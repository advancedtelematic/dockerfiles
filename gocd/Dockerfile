FROM gocd/gocd-server:v18.9.0

RUN mkdir -p /go-working-dir/plugins/external
RUN chmod -R 777 /go-working-dir/
RUN wget https://github.com/gocd-contrib/script-executor-task/releases/download/0.3/script-executor-0.3.0.jar -P /go-working-dir/plugins/external
