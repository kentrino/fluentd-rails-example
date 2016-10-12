# Run docker
```shell
# build docker image
docker build -t fluentd .

# docker run
docker run -it -p 24224:24224 --name fluentd_logger fluentd

# test
echo '{"test": "test via fluent-cat."}' | fluent-cat

# run again
docker rm $(docker ps --all | grep fluentd_logger | awk '{print $1}') && docker run -it -p 24224:24224 --name fluentd_logger fluentd

```

