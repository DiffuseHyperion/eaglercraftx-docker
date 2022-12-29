FROM eclipse-temurin:8-jdk-alpine

ENV MIN_RAM=512M
ENV MAX_RAM=512M
ENV EULA=false

VOLUME /server
WORKDIR /
EXPOSE 25565

COPY ./start.sh start.sh

CMD sh start.sh