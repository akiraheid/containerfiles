# Convert directory findings to just the directory name
SUBDIRS:=$(patsubst %/,%,$(wildcard */))
SUBDIRS_RELEASE:=$(patsubst %,%-release ,$(SUBDIRS))
SUBDIRS_HTML:=$(patsubst %,%-html ,$(SUBDIRS))
dockerPrefix=docker.io/akiraheid

all: $(SUBDIRS)

release: $(SUBDIRS_RELEASE)

html: $(SUBDIRS_HTML)
	bash makeGhPage.sh

$(SUBDIRS):
	podman build -t localhost/$@ $@

$(SUBDIRS_RELEASE):
	IMAGE=$(patsubst %-release,%,$@) \
		  && bash release.sh $${IMAGE}

$(SUBDIRS_HTML):
	IMAGE=$(patsubst %-html,%,$@) \
		  && bash makeGhPage.sh $${IMAGE}

.PHONY: all gh-page release $(SUBDIRS) $(SUBDIRS_RELEASE) $(SUBDIRS_PAGE)
