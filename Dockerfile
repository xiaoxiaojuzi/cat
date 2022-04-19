FROM adoptopenjdk:11-jre-hotspot
WORKDIR /tmp
EXPOSE 8080
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} /tmp/application.jar
ENTRYPOINT ["java","-jar","application.jar"]