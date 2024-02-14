software system that helps manage movies and reviews operations.


## How to run ##
- ```docker compose up -d```
- Access the app through http://localhost:3000/

## Features ## 
- Create Movie , Review
- Import Movies , Reviews from csv files
- Search By Actor

## Useful Commands ##
```
# lists containers for the given docker compose configuration
docker compose ps

# lists all running containers in Docker engine
docker ps

# access Backend console
docker exec -it first_try-web-1 /bin/bash
  
