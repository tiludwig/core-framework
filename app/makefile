SRC := src/main.cpp

CPPFLAGS := -std=c++11 -MMD -MP -fno-rtti
WFLAGS := -Wall -Wextra
LDFLAGS :=
LIBS := -lcore
INCLPATH := -I../core/src/
LIBPATH := -L../core/build/lib

OBJ_DIR := build/objects

OBJ := $(addprefix $(OBJ_DIR)/, $(SRC:.cpp=.cpp.o))
DEPS := $(OBJ:.o=.d)

.SECONDEXPANSION:
build/bin/app.exe: $(OBJ) | $$(@D)/.
	$(info linking app to build/bin/app.exe)
	g++ $(LDFLAGS) $(LIBPATH) -o $@ $^ $(LIBS)

$(OBJ_DIR)/%.cpp.o: %.cpp | $$(@D)/.
	$(info compiling source file $<)
	g++ $(CPPFLAGS) $(WFLAGS) $(INCLPATH) -o $@ -c $<

build/.:
	test -d $@ || mkdir $(subst /,\,$@)
build%/.:
	test -d $@ || mkdir $(subst /,\,$@)

clean:
	$(info cleaning app)
	rm -rf build
	mkdir build

-include $(DEPS)

.phony: clean
.precious: build/. build%/. $(OBJ)