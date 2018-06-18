# node-runtime

[![dockeri.co](http://dockeri.co/image/lgatica/node-runtime)](https://hub.docker.com/r/lgatica/node-runtime/)

[![Build Status](https://travis-ci.org/lgaticaq/node-runtime.svg?branch=master)](https://travis-ci.org/lgaticaq/node-runtime)

> Docker onbuild image for ligth node apps with alpine linux

Supported tags and respective Dockerfile links

* latest ([Dockerfile](https://github.com/lgaticaq/node-runtime/blob/master/Dockerfile))

## Create a Dockerfile in your Node.js app project

NOTE: this image depend of a node onbuild image. For example [node:8-onbuild](https://github.com/nodejs/docker-node/blob/master/8/onbuild/Dockerfile).

```dockerfile
FROM lgatica/node:10-onbuild as builder
FROM lgatica/node-runtime

EXPOSE 3000
```

You can then build and run the Docker image:

```bash
docker build -t my-nodejs-app .
docker run -it --rm --name my-running-app my-nodejs-app
```

### Notes

The image assumes that your application has a file named package.json listing its dependencies and defining its start script.
