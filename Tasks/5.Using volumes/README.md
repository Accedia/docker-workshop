# Practice - using volumes

Run a container "mypsql" using **postgres:12** with options to:
 - run the container in detached mode
 - pass an environment variable `POSTGRES_PASSWORD=secretpass`
 - create a named volume with `-v <name>:/var/lib/postgresql/data`

Run a shell in the container and use psql to add a table and a record:
 - $ `psql -U postgres`
 - $ `create table public.films (id int PRIMARY KEY, name varchar(255));`
 - $ `insert into films(id, name) values(1, 'Some movie');`

Exit the container and delete it. Run a new container with the same options. Use ***the same*** volume name to re-use the existing volume.

Run a shell inside the container and see if your data is still there:
 - $ `psql –U postgres`
 - $ `select * from public.films;`
