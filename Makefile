# Convert directory findings to just the directory name
SUBDIRS:=$(patsubst %/,%,$(wildcard */))
SUBDIRS_RELEASE:=$(patsubst %,%-release ,$(SUBDIRS))
SUBDIRS_SCAN:=$(patsubst %,%-scan ,$(SUBDIRS))
dive=docker.io/wagoodman/dive:v0.10.0
grype=docker.io/anchore/grype:v0.53.1

all: clean $(SUBDIRS)

clean:
	-rm -r scans

html:
	python3 makeGhPage.py

release: $(SUBDIRS_RELEASE)

scan: clean $(SUBDIRS_SCAN)

$(SUBDIRS):
	bash build.sh $@

$(SUBDIRS_RELEASE):
	IMAGE=$(patsubst %-release,%,$@) \
		  && bash release.sh $${IMAGE}

$(SUBDIRS_SCAN):
	mkdir -p scans
	-rm -r scans/*.tar
	IMAGE=$(patsubst %-scan,%,$@) \
		&& ARCHIVE=$${IMAGE}.tar \
		&& podman save -o scans/$${ARCHIVE} $${IMAGE} \
		&& podman run --rm -e CI=true -v ${PWD}/scans/:/data/:ro ${dive} --source docker-archive /data/$${ARCHIVE} \
			| tee scans/$${IMAGE}-dive.txt \
		&& podman run --rm -e GRYPE_DB_CACHE_DIR=/db -v grype-db:/db -v ${PWD}/scans/:/data/:ro ${grype} /data/$${ARCHIVE} \
			| tee scans/$${IMAGE}-grype.txt
	-rm -r scans/*.tar

.PHONY: all clean html release $(SUBDIRS) $(SUBDIRS_RELEASE) $(SUBDIRS_SCAN)
