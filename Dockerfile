# Select base image
FROM ubuntu:16.04

# Set the current working directory
WORKDIR /home

# Update the system, download any packages essential for the project
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git build-essential make gcc vim net-tools iputils-ping

# Download and build application code
RUN git clone https://github.com/cnnrznn/dist-membership
WORKDIR /home/dist-membership
RUN make

# Import any additional files into the environment (from the host)
ADD hostfile .
