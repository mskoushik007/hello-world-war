FROM maven:3.8.2-openjdk-8 as build_stage
WORKDIR /mydir
COPY . .
RUN mvn clean package

FROM tomcat:9.0
COPY --from=build_stage /mydir/target/hello-world-war-null.war /usr/local/tomcat/webapps/

