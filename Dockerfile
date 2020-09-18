# Base Alpine Linux based image with OpenJDK JRE only
FROM openjdk:8-jre-alpine
# copy application WAR (with libraries inside)
COPY target/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar /home/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar
# specify default command
CMD ["/usr/bin/java", "-jar", "/home/spring-petclinic-2.3.0.BUILD-SNAPSHOT.jar"]
