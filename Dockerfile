FROM bthuillier/lein

ENV PORT 8080

RUN mkdir /project

ADD . /project

WORKDIR /project

EXPOSE 8080

RUN lein ring uberjar

ENTRYPOINT java -jar target/docker-clj.jar
