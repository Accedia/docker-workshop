# Practice - building images

Your project utilizes microservices and Kuberenetes. On your cluster you have many containers (pods) with your services. There’s a special container **jumpbox** which runs Ubuntu and can access the other services' databases and other components. To access those components you install a few CLI tools on this special container. The problem - each time the cluster is re-deployed you must install the CLI tools again because they're not part of the container's base Ubuntu image.

You want to automate this process by building a Dockerfile for this container using **ubuntu:18.04** as your base image.

To install those tools you normally use the following commands:

- $ `DEBIAN_FRONTEND=noninteractive` # Env var required for postgres installation
- $ `apt-get update && apt-get install -y postgresql` # Install postgres to access dbs
- $ `apt-get install -y wget` # Install wget for downloading software packages
- $ `apt-get install -y curl` # Install curl for running HTTP requests

1. Create the above Dockerfile and build an image **jumpbox** with a **1.0** tag. Run a container with interactive bash and verify the installations:
 - `psql --version` # You should see the psql version
 - `wget --version` # You should see the wget version and other info
 - `curl 'http://example.com'` # You should see some html
2. Change **curl** to **inetutils-ping**. Build a jumpbox version **2.0** and test again:
- `psql --version`
- `ping 8.8.8.8`
