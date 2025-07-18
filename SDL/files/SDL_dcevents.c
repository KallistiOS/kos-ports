/*
    SDL - Simple DirectMedia Layer
    Copyright (C) 1997, 1998, 1999, 2000, 2001, 2002  Sam Lantinga

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Library General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Library General Public License for more details.

    You should have received a copy of the GNU Library General Public
    License along with this library; if not, write to the Free
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

    BERO
    bero@geocities.co.jp

    based on SDL_nullevents.c by

    Sam Lantinga
    slouken@libsdl.org

    Modified by Lawrence Sebald <bluecrab2887@netscape.net>
    Modified by Falco Girgis <gyrovorbis@gmail.com>
*/

#include "SDL.h"
#include "SDL_sysevents.h"
#include "SDL_events_c.h"
#include "SDL_dcvideo.h"
#include "SDL_dcevents_c.h"

#include <kos.h>

const static unsigned short sdl_key[]= {
    /*0*/	0, 0, 0, 0, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i',
        'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
        'u', 'v', 'w', 'x', 'y', 'z',
    /*1e*/	'1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
    /*28*/	SDLK_RETURN, SDLK_ESCAPE, SDLK_BACKSPACE, SDLK_TAB, SDLK_SPACE, SDLK_MINUS, SDLK_PLUS, SDLK_LEFTBRACKET,
    SDLK_RIGHTBRACKET, SDLK_BACKSLASH , 0, SDLK_SEMICOLON, SDLK_QUOTE,
    /*35*/	'~', SDLK_COMMA, SDLK_PERIOD, SDLK_SLASH, SDLK_CAPSLOCK,
    SDLK_F1, SDLK_F2, SDLK_F3, SDLK_F4, SDLK_F5, SDLK_F6, SDLK_F7, SDLK_F8, SDLK_F9, SDLK_F10, SDLK_F11, SDLK_F12,
    /*46*/	SDLK_PRINT, SDLK_SCROLLOCK, SDLK_PAUSE, SDLK_INSERT, SDLK_HOME, SDLK_PAGEUP, SDLK_DELETE, SDLK_END, SDLK_PAGEDOWN, SDLK_RIGHT, SDLK_LEFT, SDLK_DOWN, SDLK_UP,
    /*53*/	SDLK_NUMLOCK, SDLK_KP_DIVIDE, SDLK_KP_MULTIPLY, SDLK_KP_MINUS, SDLK_KP_PLUS, SDLK_KP_ENTER,
    SDLK_KP1, SDLK_KP2, SDLK_KP3, SDLK_KP4, SDLK_KP5, SDLK_KP6,
    /*5f*/	SDLK_KP7, SDLK_KP8, SDLK_KP9, SDLK_KP0, SDLK_KP_PERIOD, 0 /* S3 */
};

const static unsigned short sdl_shift[] = {
    SDLK_LCTRL,SDLK_LSHIFT,SDLK_LALT,0 /* S1 */,
    SDLK_RCTRL,SDLK_RSHIFT,SDLK_RALT,0 /* S2 */,
};

#define	MOUSE_WHEELUP 	(1<<4)
#define	MOUSE_WHEELDOWN	(1<<5)

const static char sdl_mousebtn[] = {
    MOUSE_WHEELUP,
    MOUSE_LEFTBUTTON,
    MOUSE_SIDEBUTTON,
    MOUSE_RIGHTBUTTON,
    MOUSE_WHEELDOWN
};

static void mouse_update(void) {
    static int prev_buttons;
    maple_device_t *dev;
    mouse_state_t *state;
    int buttons, changed;
    int i;

    if(!(dev = maple_enum_type(0, MAPLE_FUNC_MOUSE)) ||
       !(state = maple_dev_status(dev)))
        return;

    buttons = state->buttons;
    if(state->dz < 0)
        buttons |= MOUSE_WHEELUP;
    if(state->dz > 0)
        buttons |= MOUSE_WHEELDOWN;

    if(state->dx || state->dy)
        SDL_PrivateMouseMotion(0, 1, state->dx, state->dy);

    changed = buttons ^ prev_buttons;

    for(i = 0; i < sizeof(sdl_mousebtn); ++i) {
        if(changed & sdl_mousebtn[i]) {
            SDL_PrivateMouseButton((buttons & sdl_mousebtn[i]) ?
                                   SDL_PRESSED : SDL_RELEASED, i, 0, 0);
        }
    }

    prev_buttons = buttons;
}

static void keyboard_update(void) {
#if KOS_VERSION_BELOW(2, 2, 0)
    static kbd_state_t old_state;
#else 
	static kbd_mods_t old_mods;
#endif
    kbd_state_t	*state;
    maple_device_t *dev;
    int shiftkeys;
    SDL_keysym keysym;
    int i;

    if(!(dev = maple_enum_type(0, MAPLE_FUNC_KEYBOARD)))
        return;

    state = maple_dev_status(dev);

    if(!state)
        return;

#if KOS_VERSION_BELOW(2, 2, 0)
    shiftkeys = state->shift_keys ^ old_state.shift_keys;
    for(i = 0; i < sizeof(sdl_shift); ++i) {
        if((shiftkeys >> i) & 1) {
            keysym.sym = sdl_shift[i];
            SDL_PrivateKeyboard(((state->shift_keys >> i) & 1) ?
                                SDL_PRESSED : SDL_RELEASED, &keysym);
        }
    }

    for(i = 0; i < sizeof(sdl_key); ++i) {
        if(state->matrix[i] != old_state.matrix[i]) {
            int key = sdl_key[i];
            if(key) {
                keysym.sym = key;
                SDL_PrivateKeyboard(state->matrix[i] ?
                                    SDL_PRESSED : SDL_RELEASED, &keysym);
            }
        }
    }

    old_state = *state;

#else /* KOS 2.2.0+ */
    shiftkeys = state->last_modifiers.raw ^ old_mods.raw;
    for(i = 0; i < sizeof(sdl_shift)/sizeof(sdl_shift[0]); ++i) {
        if((shiftkeys >> i) & 1) {
            keysym.sym = sdl_shift[i];
            SDL_PrivateKeyboard(((state->last_modifiers.raw >> i) & 1) ?
                                SDL_PRESSED : SDL_RELEASED, &keysym);
        }
    }

    for(i = 0; i < sizeof(sdl_key)/sizeof(sdl_key[0]); ++i) {
        int key = sdl_key[i];
        keysym.sym = key;

        if(state->key_states[i].value == KEY_STATE_CHANGED_DOWN) {
            SDL_PrivateKeyboard(SDL_PRESSED, &keysym);
        } else if(state->key_states[i].value == KEY_STATE_CHANGED_UP) {
            SDL_PrivateKeyboard(SDL_RELEASED, &keysym);
        }
    }
#endif
}

void DC_PumpEvents(_THIS) {
    keyboard_update();
    mouse_update();
}

void DC_InitOSKeymap(_THIS) {
}