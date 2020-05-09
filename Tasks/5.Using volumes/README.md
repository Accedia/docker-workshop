# Practice - using volumes

Run a container **mypsql** using **postgres:12** with options to:
 - run in detached mode
 - pass the appropriate environment variable (find it on https://hub.docker.com/)
 - use a named volume

Run bash in the container and use psql to add a table and a record:
 - $ `psql -U postgres`
 - $ `create table public.films (id int PRIMARY KEY, name varchar(255));`
 - $ `insert into films(id, name) values(1, 'Some movie');`

Exit the container and delete it. Run a new container with the same options (use ***the same*** volume name).

Run bash inside the new container and see if your data has survived:
 - $ `psql –U postgres`
 - $ `select * from public.films;`
