# Create Custom Docker Image
FROM tomcat:latest

 

# copy war file on to container 
COPY ./ /usr/local/tomcat/webapps/login.war
EXPOSE 8080