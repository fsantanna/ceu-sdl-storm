#CEU_DIR     = $(error set absolute path to "<ceu>" repository)
#CEU_SDL_DIR = $(error set absolute path to "<ceu-sdl>" repository)
CEU_DIR     = /data/ceu/ceu
CEU_SDL_DIR = /data/ceu/ceu-sdl

all:
	ceu --pre --pre-args="-I$(CEU_DIR)/include -I$(CEU_SDL_DIR)/include"    \
	          --pre-input=main.ceu                                          \
	    --ceu --ceu-err-unused=pass --ceu-err-uninitialized=pass            \
	          --ceu-features-dynamic=true \
	          --ceu-features-pool=true \
	          --ceu-features-os=true \
	    --env --env-types=$(CEU_DIR)/env/types.h                            \
	          --env-threads=$(CEU_DIR)/env/threads.h                        \
	          --env-main=$(CEU_DIR)/env/main.c --env-output=/tmp/storm.c    \
	    --cc --cc-args="-lm -llua5.3 -lpthread -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_gfx" \
	         --cc-output=storm
