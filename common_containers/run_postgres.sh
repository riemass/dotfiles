#! /bin/bash
docker run --rm -it --publish 0.0.0.0:5432:5432 --name pg -e POSTGRES_PASSWORD=postgres -v ~/docker/postgres:/var/lib/postgresql/data -d postgres:alpine
