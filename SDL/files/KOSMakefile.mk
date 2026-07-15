.PHONY: install

install:
	$(MAKE) -f Makefile.dc install
	mkdir -p ${SDL_PC_PATH}
	sed "s/@SDL_VERSION@/${SDL_VERSION}/" sdl.pc.in > ${SDL_PC_PATH}/sdl.pc
