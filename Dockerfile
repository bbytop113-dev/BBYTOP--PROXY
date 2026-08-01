FROM ginuerzh/gost:latest

ENV GOST_USER=admin \
    GOST_PASS=securepassword123

EXPOSE 8080

CMD ["gost", "-L=http://:8080?auth=${GOST_USER}:${GOST_PASS}"]
