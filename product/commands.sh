# run local manually, no docker container
#mvn clean package && java -jar target/*.jar
# Create docker image
docker build -t onlinestore/product:SNAPSHOT-0.1.0 .
# Stop container if alraedy runninf
docker stop product
# Force remove the Container if still running. docker rm <containerName or containerID>
docker rm -f product
# run on docker
docker run -p 9090:9090 --name product onlinestore/product:SNAPSHOT-0.1.0
