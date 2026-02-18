# lolllll i use arch btw

FROM archlinux:latest

RUN sudo pacman -Syu && sudo pacman -S \
    base-devel cmake make meson fzf ninja gcc

COPY . /hello

WORKDIR /hello/build

# RUN chmod a+x ../configure.sh && ../configure.sh

RUN cmake ..

RUN make

ENTRYPOINT ["bash", "/hello/docker.sh"]

# CMD ["./bin/hello"]
