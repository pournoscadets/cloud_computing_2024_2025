FROM eclipse-temurin:21-jre-alpine
LABEL cloud=computing-team

ARG USER=norootuser
# Bad practice because we don't need a HOMES like a environment variable
ENV HOMES=/home/$USER
# Best practice
# ARG HOMES=/home/$USER

# Don't assign a password to a user
RUN adduser -D $USER
USER $USER
WORKDIR $HOMES

# .dockerignore working, and it's not a good practice to copy all content
COPY . .
COPY target/demo*.jar my_server.jar

# best practice
#COPY target/demo*.jar my_server.jar

EXPOSE 8082

ENTRYPOINT ["java", "-jar", "my_server.jar"]
CMD ["entrypoint_argument"]

# ENTRYPOINT ["java", "-jar", "my_server.jar", "entrypoint_argument"]

# CMD ["java", "-jar", "my_server.jar"]
