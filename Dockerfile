# Use the official OpenJDK 17 as the base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Gradle wrapper files to the container
COPY gradlew .
COPY gradle gradle

# Copy the build.gradle and settings.gradle files to the container
COPY build.gradle.kts .
COPY settings.gradle.kts .

# Copy the source code to the container
COPY src src

# Run the Gradle wrapper to download and install the dependencies
RUN ./gradlew dependencies

# Build the application
RUN ./gradlew build -x test

# Expose the port on which the Spring Boot application will run
EXPOSE 8080

# Set the environment variables for configuration
ENV SPRING_PROFILES_ACTIVE=default
#ENV SPRING_DATASOURCE_URL=jdbc:mysql://localhost:3306/mydatabase
#ENV SPRING_DATASOURCE_USERNAME=root
#ENV SPRING_DATASOURCE_PASSWORD=secret

# Set the default command to run the Spring Boot application
CMD ["java", "-jar", "build/libs/backend-0.0.1-SNAPSHOT.jar"]