# Convert directory findings to just the directory name
SUBDIRS:=$(patsubst %/,%,$(wildcard */))
SUBDIRS_RELEASE:=$(patsubst %,%-release ,$(SUBDIRS))
dockerPrefix=docker.io/akiraheid

all: clean $(SUBDIRS)

clean:
	-rm -r scans

html:
	python3 makeGhPage.py

release: $(SUBDIRS_RELEASE)

$(SUBDIRS):
	podman build -t localhost/$@ $@

$(SUBDIRS_RELEASE):
	IMAGE=$(patsubst %-release,%,$@) \
		  && bash release.sh $${IMAGE}

.PHONY: all clean html release $(SUBDIRS) $(SUBDIRS_RELEASE)
