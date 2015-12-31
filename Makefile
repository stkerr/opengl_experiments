
SRC := $(wildcard src/*.cpp)
OBJS := $(subst src,obj,$(SRC))
OBJS := $(patsubst %.cpp,%.o,$(OBJS))
BINARY := bin/opengl

CXXFLAGS += -std=c++11

LDFLAGS += -lGL -lGLEW -lglfw

all: run

run: $(BINARY)
	./$<

$(BINARY): $(OBJS) | bin
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BINARY) $^

obj/%.o: src/%.cpp | obj
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $@ -c $^

obj bin:
	mkdir $@

clean:
	-rm -rf obj bin