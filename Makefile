ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
UID:=$(shell echo "$${UID}")
IMAGE=karlkfi/jupyter-krm

.PHONEY: exec
exec:
	docker run \
	  -p 8888:8888 \
	  --user $(UID):0 --group-add=users \
	  -v $(ROOT_DIR):/home/jovyan/work:rw \
	  --workdir /home/jovyan/work \
	  $(IMAGE) \
	  jupyter nbconvert --to notebook --execute kinetic.ipynb --output kinetic-out.ipynb

.PHONEY: edit
edit:
	docker run -p 8888:8888 --user $(UID):0 --group-add=users -v $(ROOT_DIR):/home/jovyan/work:rw $(IMAGE)

.PHONEY: image
image:
	cd images/jupyter-krm/ && docker build . -t $(IMAGE)

all: exec
