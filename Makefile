# Convert directory findings to just the directory name
SUBDIRS:=$(patsubst %/,%,$(wildcard */))
SUBDIRS_RELEASE:=$(patsubst %,%-release ,$(SUBDIRS))
SUBDIRS_SCAN:=$(patsubst %,%-scan ,$(SUBDIRS))

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

$(SUBDIRS_SCAN):
	mkdir -p scans
	-rm -r scans/*.tar
	IMAGE=$(patsubst %-scan,%,$@) \
		&& ARCHIVE=$${IMAGE}.tar \
		&& podman save -o scans/$${ARCHIVE} $${IMAGE} \
		&& podman run --rm -e CI=true -v ${PWD}/scans/:/data/:ro dive:v0.10.0 --source docker-archive /data/$${IMAGE}.tar
	-rm -r scans/*.tar

.PHONY: all clean html release $(SUBDIRS) $(SUBDIRS_RELEASE) $(SUBDIRS_SCAN)
