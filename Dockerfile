FROM tomcat:11.0.0-M7-jdk21-openjdk-bookworm

# COPY server-signed-cert1.pem server-signed-cert1.pem
COPY keystore.jks keystore.jks

# RUN openssl x509 -in server-signed-cert1.pem -inform pem -out server-signed-cert1.der -outform der

# RUN keytool -importcert -alias startssl -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -file server-signed-cert1.der 

COPY sample.war /usr/local/tomcat/webapps/sample.war


RUN sed -i 's|<!-- Define an AJP 1.3 Connector on port 8009 -->|<Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol"\n\
               maxThreads="150" SSLEnabled="true">\n\
        <UpgradeProtocol className="org.apache.coyote.http2.Http2Protocol" />\n\
        <SSLHostConfig>\n\
            <Certificate certificateKeystoreFile="./keystore.jks"\n\
                         certificateKeystorePassword="tomcat"\n\
                         type="RSA" />\n\
        </SSLHostConfig>\n\
    </Connector>|' /usr/local/tomcat/conf/server.xml

           