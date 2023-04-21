# cdhit-docker
Docker image for running cdhit in Ubuntu:kinetic

The image contains a full install of [cd-hit](http://weizhongli-lab.org/cd-hit/), including all necessary dependencies. Credit to https://github.com/chrishah/cdhit-docker for creating the initial image.

In detail, the image is set up with:
 - Ubuntu:kinetic
 - cd-hit v4.8.1-2019-0228 (latest release as of April 2023)

To build the image from the Dockerfile, run:
```bash
mkdir cd-hit && cd cd-hit
git pull https://github.com/seanfahey1/cdhit-docker.git
docker build -t cd-hit-local .
```

To run any program from the cd-hit suite you can do the following (this will mount the directory `/home` of the container to the current working directory on your local machine, and allow you to access files in this directory and any sub-directories):
```bash
docker run -it --rm -v $(pwd):/home cd-hit-local bash
```

To delete the image and recover hard drive space, run:
```bash
docker rmi cd-hit-local
```
