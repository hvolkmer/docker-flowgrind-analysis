# R based analysis of flowgrind logs in docker container

To create some useful log files use the [hvolkmer/flowgrind](https://github.com/hvolkmer/docker-flowgrind) docker container.

    docker run -ti --rm -v "$PWD":/home/docker -w /home/docker -u docker hvolkmer/flowgrind-analysis Rscript plot3.r \
     fg-91950218-10.100.45.7-10.100.7.49.log fg-91950218-10.100.45.8-10.100.78.11.log fg-91950218-10.100.78.10-10.100.7.51.log \
     output.png "3x3 kube"

I needed this for a project. If you find it useful, feel free to use it YMMV.

# Author

Hendrik Volkmer <hvolkmer@gmail.com>
