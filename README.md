# Instruction
```shell
# build docker image
cd ./fluentd
docker build -t fluentd .

# docker run
docker run -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -it -p 24224:24224 --name fluentd_logger fluentd

# test logging
echo '{"test": "test via fluent-cat."}' | fluent-cat test.tag

# docker run again
docker rm $(docker ps --all | grep fluentd_logger | awk '{print $1}') && docker run -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -it -p 24224:24224 --name fluentd_logger fluentd
```

# Outline
1. This sample uses `fluent-logger` rubygem.
2. `fluentd-rails-sample/app/controllers/index_controller.rb#main`(`get '/'`) calls wrapper class of `fluent-logger`. 
3. The wrapper class is in `lib/fluentd_logger.rb` where it initializes fluentd logger and creates connection. This sample wrapper class has a class method for location logging.
4. `Dockerfile` and `fluent.conf` are in `fluentd/`. 
