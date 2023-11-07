FROM eclipse-temurin:21-jdk-jammy

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

RUN mkdir -p "$CATALINA_HOME"

WORKDIR $CATALINA_HOME

ENV TOMCAT_VERSION 9.0.82

# Download and extract Tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-9/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz && \
    tar -xzf apache-tomcat-$TOMCAT_VERSION.tar.gz --strip-components=1 && \
    rm apache-tomcat-$TOMCAT_VERSION.tar.gz

# Expose the default Tomcat port
EXPOSE 8080

CMD ["catalina.sh", "run"]
