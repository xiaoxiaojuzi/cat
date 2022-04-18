FROM maven
WORKDIR /tmp
ADD . /tmp
RUN mvn clean install

FROM adoptopenjdk:11-jre-hotspot
ARG JAR_FILE=/tmp/target/*.jar
COPY --from=0 ${JAR_FILE} cat-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/cat-0.0.1-SNAPSHOT.jar"]