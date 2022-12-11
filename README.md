# Docker CMAK (Cluster Manager for Apache Kafka, previously known as Kafka Manager)

A Dockerfile for [CMAK](https://github.com/yahoo/CMAK). This image is based on the [Eclipse Temurin Java 11 JRE](https://hub.docker.com/_/eclipse-temurin) image.

The UI is exposed on port 9000. Configure the `ZK_HOSTS` environment variable to point to Zookeeper. Multiple Zookeeper hosts can be specified using a comma separated list.

Example docker-compose snippet:
```
  cmak:
    image: fkjellberg/cmak:latest
    ports:
      - 9000:9000
    environment:
      ZK_HOSTS: zk1:2181,zk2:2181,zk3:2181
```
