FROM maven:3.2-jdk-7-onbuild
CMD mvn install

FROM jboss/wildfly
COPY /usr/src/app/target/movieplex7-1.0-SNAPSHOT.war /opt/jboss/wildfly/standalone/deployments/
RUN /opt/jboss/wildfly/bin/add-user.sh admin Admin --silent
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
