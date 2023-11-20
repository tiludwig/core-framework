.silent:

all: core app

app:
	$(info -- compiling app --)
	$(MAKE) -C app
core:
	$(info -- compiling core --)
	$(MAKE) -C core

clean:
	$(info -- cleaning project --)
	$(MAKE) -C app clean
	$(MAKE) -C core clean


.phony: all app core clean