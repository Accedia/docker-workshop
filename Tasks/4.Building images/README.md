# Practice - building images

Your project utilizes microservices and Kuberenetes. On your cluster you have many containers (pods) with your services. There's a special container which runs Ubuntu and can access the other services' databases and other components. To access those components you install a few CLI tools on this special container. The problem - each time the cluster is re-deployed you must install the CLI tools again because they're not part of the container's base Ubuntu image.

You want to automate this process by building a Dockerfile for this container using ubuntu:18.04 as your base image.

To install those tools you normally use the following commands:

- $ `DEBIAN_FRONTEND=noninteractive` # Env var required for postgres
- $ `apt-get update && apt-get install -y postgresql` # Install postgres to access dbs
- $ `apt-get install -y wget` # Install wget for downloading software packages
- $ `apt-get install -y curl` # Install curl for running HTTP requests

:whale: HINT: Research how to set environment variables inside Dockerfiles for the DEBIAN_FRONTEND variable.

To build the image, navigate to your Dockerfile path and use
 - `docker build –t "<name>:<tag>" .`

Run a container from this image in interactive mode and verify the installations:
 - `psql --version` # You should see the psql version
 - `wget --version` # You should see the wget version and other info
 - `curl 'http://example.com'` # You should see some html
