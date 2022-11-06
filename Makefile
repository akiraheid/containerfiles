# Convert directory findings to just the directory name
SUBDIRS:=$(patsubst %/,%,$(wildcard */))
SUBDIRS_RELEASE:=$(patsubst %,%-release ,$(SUBDIRS))
dockerPrefix=docker.io/akiraheid

all: $(SUBDIRS)

release: $(SUBDIRS_RELEASE)

html:
	python3 makeGhPage.py

$(SUBDIRS):
	podman build -t localhost/$@ $@

$(SUBDIRS_RELEASE):
	IMAGE=$(patsubst %-release,%,$@) \
		  && bash release.sh $${IMAGE}

.PHONY: all html release $(SUBDIRS) $(SUBDIRS_RELEASE) $(SUBDIRS_PAGE)
