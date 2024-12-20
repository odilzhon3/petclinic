FROM openjdk
COPY App-Code /myapp/
WORKDIR /myapp/
RUN ./mvnw package
FROM openjdk
COPY --from=0 /myapp/target/spring-petclinic-3.4.0-SNAPSHOT.jar /myapp/target/app.jar
CMD ["java", "-jar", "/myapp/target/app.jar"]
