FROM tomcat:8.0-alpine


ADD ./target/HelloWorldMaven-1.1.1-RELEASE.jar/ /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]