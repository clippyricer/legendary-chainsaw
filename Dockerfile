# lolllll i use arch btw

FROM debian:latest

RUN apt-get update && apt-get install -y \
    build-essential cmake

COPY . /hello

WORKDIR /hello/build

RUN cmake ..

RUN make

CMD ["./bin/hello"]
