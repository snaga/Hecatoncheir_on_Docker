docker images | grep uptimejp/hecatoncheir | awk '{ print $3 }' | xargs docker rmi -f
docker build -t uptimejp/hecatoncheir:jpoug .
docker images

