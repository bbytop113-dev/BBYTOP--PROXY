FROM ginuerzh/gost:latest

EXPOSE 8080

CMD ["gost", "-L=http://:8080"]
