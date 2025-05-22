FROM eclipse-temurin:21-jre-alpine
LABEL cloud computing team

ARG USER=norootuser
ENV HOME /home/$USER

# Don't assign a password to a user
RUN adduser -D $USER
USER $USER
WORKDIR $HOME

# .dockerignore working
COPY . .
COPY target/demo*.jar my_server.jar

# best practice
#COPY target/demo*.jar my_server.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "my_server.jar"]
CMD ["entrypoint_argument"]

# ENTRYPOINT ["java", "-jar", "my_server.jar", "entrypoint_argument"]

# CMD ["java", "-jar", "my_server.jar"]
