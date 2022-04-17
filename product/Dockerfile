# Multple-stage build
FROM maven:3.6.1-jdk-8-alpine AS BUILD

#RUN addgroup -S demo && adduser -S demoUser -G demo
#USER demoUser

# Define workspace. Default is root.
WORKDIR /workspace/app

# Copy all code to workspace. For optimization we are not copying the target directory to a docker image.
COPY pom.xml .
COPY src src

# Build with Maven
RUN mvn install -DskipTests

# Unpack using jar command.
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

# Use the JRE base image (not jdk) to reduce build size
FROM openjdk:8-jre-alpine

# Volume
VOLUME /tmp

ARG DEPENDENCY=/workspace/app/target/dependency
COPY --from=BUILD ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=BUILD ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=BUILD ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.onlinestore.product.ProductApplication"]
