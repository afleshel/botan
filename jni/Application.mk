# common android build settings

APP_PLATFORM := android-14
APP_STL := c++_shared
APP_ABI := armeabi-v7a x86

APP_OPTIM := release
APP_DEBUGGABLE := false

APP_PROJECT_PATH := ./


APP_CPPFLAGS := \
	-fvisibility=hidden \
	-fvisibility-inlines-hidden \
	-std=c++11 \
	-fexceptions \
	-frtti -mfpu=neon


APP_CFLAGS += -Wall -Wextra -Wpedantic -Wshadow -Wstrict-aliasing -Wstrict-overflow=5 -Wcast-align -Wmissing-declarations -Wpointer-arith -Wcast-qual



