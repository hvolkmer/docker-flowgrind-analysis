
docker run -ti --rm -v "$PWD":/home/docker -w /home/docker -u docker d7a7fcf923f2 \
Rscript plot3.r log1.log log2.log log3.log output.png "3x3 VM pairs/flows


docker run -ti --rm -v "$PWD":/home/docker -w /home/docker -u docker d7a7fcf923f2 \
Rscript plot3.r fg-91950218-10.100.45.7-10.100.7.49.log fg-91950218-10.100.45.8-10.100.78.11.log fg-91950218-10.100.78.10-10.100.7.51.log output.png "3x3 kube "