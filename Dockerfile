FROM java:8
WORKDIR /
COPY ./HelloWorldMaven-1.1.1-RELEASE.jar HelloWorldMaven-1.1.1-RELEASE.jar
EXPOSE 8080
CMD java - jar HelloWorldMaven-1.1.1-RELEASE.jar