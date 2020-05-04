# Practice - networking

 - Run an nginx container "nginx1" in detached mode
 - Run a busybox container "busy1" in interactive mode
 - Try to ping the nginx container by name (You won’t be able to)
 - Create a custom network **newnet** with a bridge driver
 - Run another detached nginx container "nginx2", this time using **newnet**
 - Run a new interactive busybox container "busy2", again using **newnet**
 - Try pinging the new nginx container by name
