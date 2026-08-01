FROM ginuerzh/gost:latest

ENV PORT=8080
EXPOSE 8080

CMD ["sh", "-c", "gost -L=http://bbytop:bbytop@:8080"]
