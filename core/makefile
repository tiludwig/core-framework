SRC := src/utils.cpp

CPPFLAGS := -std=c++11 -MMD -MP -fno-rtti
WFLAGS := -Wall -Wextra
LDFLAGS :=
INCLPATH :=

OBJ_DIR := build/objects
OBJ := $(addprefix $(OBJ_DIR)/, $(SRC:.cpp=.cpp.o))
DEPS := $(OBJ:.o=.d)

.SECONDEXPANSION:
build/lib/libcore.a: $(OBJ) | $$(@D)/.
	$(info creating library libcore.a)
	@ar crf $@ $^

$(OBJ_DIR)/%.cpp.o: %.cpp | $$(@D)/.
	$(info compiling source file $<)
	g++ $(CPPFLAGS) $(WFLAGS) $(INCLPATH) -o $@ -c $<

build/.:
	test -d $@ || mkdir $(subst /,\,$@)
build%/.:
	test -d $@ || mkdir $(subst /,\,$@)

clean:
	$(info cleaning core)
	rm -rf build
	mkdir build

-include $(DEPS)

.phony: clean
.precious: build/. build%/. $(OBJ)