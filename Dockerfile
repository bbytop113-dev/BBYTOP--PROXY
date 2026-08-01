FROM ginuerzh/gost:latest

EXPOSE 8080

CMD ["sh", "-c", "gost -L=ws://bbytop:bbytop@:8080"]
