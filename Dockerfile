FROM jboss/keycloak:11.0.3

COPY theme /opt/jboss/keycloak/themes/dotbase
COPY target/dotbase_totp_provder-1.0-SNAPSHOT.jar /opt/jboss/keycloak/standalone/deployments/dotbase_totp_provder-1.0-SNAPSHOT.jar
