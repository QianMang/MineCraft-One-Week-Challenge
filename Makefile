CFILES=$(shell find Source -name '*.cpp')
OFILES=$(patsubst %.cpp,%.o,$(CFILES))
TARGET=MinecraftWeek

OS := $(shell uname)
ifeq ($(OS),Darwin)
FLAGS=-framework OpenGL -lpthread -lsfml-system -lsfml-window -lsfml-graphics -lGLEW -L/Users/19nbourgeois_68/homebrew/lib
CC_FLAGS=-std=c++1y -I/Users/19nbourgeois_68/homebrew/include
else
FLAGS=-lGL -lpthread -lsfml-system -lsfml-window -lsfml-graphics -lGLEW
CC_FLAGS=-std=c++1y
endif

$(TARGET): $(OFILES)
	g++ -g -o $(TARGET) $(OFILES) $(FLAGS)

%.o: %.cpp
	g++ $(CC_FLAGS) -o $@ -c $<

clean:
	rm -rf $(TARGET) $(OFILES)
