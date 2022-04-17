# https://docs.docker.com/registry/

# Start your registry. (Pull docker image from DockerHub and run locally)
docker run -d -p 5000:5000 --name registry registry:2
# If using Docker compose
docker-compose up -d

# Pull (or build) some sample images from the hub
# Ignore if already have your project image

# Tag the image so that it points to your registry
docker image tag onlinestore/product:SNAPSHOT-0.1.0 localhost:5000/product

# Push it
docker push localhost:5000/product

# Remove the locally-cached images, so that you can test pulling the image from your registry.
# This does not remove the localhost:5000/<xxx> actual image from your registry.
docker image remove localhost:5000/product

# If you have a private local registry on the same computer then remove the existing image first
docker stop product
docker rm -f product
docker image remove onlinestore/product:SNAPSHOT-0.1.0

# Pull it back wherever you want
docker pull localhost:5000/product

# Now stop your registry and remove all data
# docker container stop registry && docker container rm -v registry
