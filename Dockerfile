FROM base/archlinux:latest

ENV LEIN_ROOT true

RUN pacman --noconfirm -Sy wget jdk8-openjdk openssl ca-certificates

RUN wget -q -O /usr/bin/lein \
    https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
    && chmod +x /usr/bin/lein

RUN lein

RUN mkdir /project

ADD . /project

WORKDIR /project

EXPOSE 8080

ENTRYPOINT lein with-profile production trampoline ring server 8080
