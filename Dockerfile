# Use Maven and JDK base image
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /smartbill_webapp

# Copy entire project
COPY . .

# Build project (clean install)
RUN mvn -f smartbill/pom.xml clean install

# Use Tomcat base image to run WAR
FROM tomcat:9.0

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy built WAR to Tomcat webapps
COPY --from=build /smartbill_webapp/smartbill/target/smartbill.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

CMD ["catalina.sh", "run"]
