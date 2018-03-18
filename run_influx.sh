#! /bin/bash
docker run -p 8086:8086 -v ~/data:/var/lib/influxdb -e INFLUXDB_DATA_QUERY_LOG_ENABLED='true' influxdb
