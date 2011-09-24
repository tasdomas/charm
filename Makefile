include $(GOROOT)/src/Make.inc

all: package

TARG=launchpad.net/juju/go/charm

GOFILES=\
	bundle.go\
	config.go\
	dir.go\
	charm.go\
	meta.go\
	walk.go\
	rel.go\

GOFMT=gofmt
BADFMT:=$(shell $(GOFMT) -l $(GOFILES) $(CGOFILES) $(wildcard *_test.go))

gofmt: $(BADFMT)
	@for F in $(BADFMT); do $(GOFMT) -w $$F && echo $$F; done

ifneq ($(BADFMT),)
ifneq ($(MAKECMDGOALS),gofmt)
$(warning WARNING: make gofmt: $(BADFMT))
endif
endif

include $(GOROOT)/src/Make.pkg

