FROM quay.io/keycloak/keycloak:latest as builder

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest

COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]
