FROM tomcat:8.5-jre8-alpine

MAINTAINER Sébastien Vanvelthem

ENV JVM_OPTS="-Xmx4g -Xms4g -XX:MaxPermSize=1024m"

RUN apk --update add php7 php7-cgi

# Set tomcat config
#ADD tomcat/catalina.policy /usr/local/tomcat/conf/catalina.policy

# Add webapps
ADD webapps/jasper-bridge.war /usr/local/tomcat/webapps/jasper-bridge.war

# Manual deploy
RUN apk add unzip &&\
    unzip /usr/local/tomcat/webapps/jasper-bridge.war -d /usr/local/tomcat/webapps/jasper-bridge &&\
    rm /usr/local/tomcat/webapps/jasper-bridge.war &&\
    apk del unzip

#RUN "sh ./scripts/build-jasper-bridge-servlet.sh"
#ADD tomcat-users.xml /usr/local/tomcat/conf/
#ADD context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml

CMD ["catalina.sh", "run"]

EXPOSE 8080 9267