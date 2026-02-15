# lolllll i use arch btw

FROM debian:latest

RUN apt-get update && apt-get install -y \
    build-essential cmake dialog fzf ninja-build

COPY . /hello

WORKDIR /hello/build

# RUN chmod a+x ../configure.sh && ../configure.sh

RUN cmake -C ../config.cmake ..

RUN make

ENTRYPOINT ["bash", "/hello/docker.sh"]

# CMD ["./bin/hello"]
