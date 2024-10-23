FROM openjdk:21-jdk-slim

# Set working directory
WORKDIR /app

# Copy the WAR file
COPY target/neoheulge-0.0.1-SNAPSHOT.war app.jar

# Run the application with timezone setting
ENTRYPOINT ["java", "-Duser.timezone=Asia/Seoul", "-jar", "app.jar"]
