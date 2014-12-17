FROM pandeiro/lein:latest

RUN mkdir /project

ADD . /project

WORKDIR /project

EXPOSE 8080

ENTRYPOINT lein with-profile production trampoline ring server 8080
