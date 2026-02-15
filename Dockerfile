# lolllll i use arch btw

FROM debian:latest

RUN apt-get update && apt-get install -y \
    build-essential cmake dialog

COPY . /hello

WORKDIR /hello/build

RUN cmake -C ../config.cmake ..

RUN make

CMD ["./bin/hello"]
