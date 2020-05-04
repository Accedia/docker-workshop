# Practice – changing running containers​

 - Run httpd container in detached mode​
 - Publish a port (i.e 80) to be accessible from the host IP​
 - Open the default apache homepage to verify connectivity​
 - Get inside the running container via shell​
 - Change the default index.html file with “Hello from docker container”​
 - Refresh the apache homepage and verify the applied changes​

:whale: HINT: Try finding index.html in ***/usr/local/apache2/htdocs***  
:whale: You can use `echo "Hello from docker container" > index.html` to replace file content​