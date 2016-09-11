CEU_DIR     = $(error set absolute path to "<ceu>" repository)
CEU_SDL_DIR = $(error set absolute path to "<ceu-sdl>" repository)

all:
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_SDL_DIR)/include"    \
	          --pre-input=main.ceu                                          \
	    --ceu                                                               \
	    --env --env-header=/data/ceu/ceu/env/header.h                       \
	          --env-main=/data/ceu/ceu/env/main.c                           \
	          --env-output=/tmp/x.c                                         \
	    --cc --cc-args="-lm -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_gfx" \
	         --cc-output=storm
