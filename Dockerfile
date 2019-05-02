FROM ubuntu:bionic
VOLUME /tmp
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install sqlite -y
RUN apt-get install default-jre -y
RUN apt-get install default-jdk -y
RUN javac -version
ENTRYPOINT ["java","-cp","app:app/lib/*","com.droy.trafficlights.TrafficLightsApplication"]