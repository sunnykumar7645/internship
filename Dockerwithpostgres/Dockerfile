FROM tomcat:8.0-alpine
# LABEL maintainer="deepak@softwareyoga.com"
ADD userlogin-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
# EXPOSE 8443
CMD ["catalina.sh", "run"]