FROM eclipse-temurin:21-jre-alpine
LABEL cloud=computing-team

# best practice
COPY target/demo*.jar my_server.jar

EXPOSE 8082

ENTRYPOINT ["java", "-jar", "my_server.jar"]
CMD ["entrypoint_argument"]