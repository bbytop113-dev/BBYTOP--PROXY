FROM ginuerzh/gost:latest

EXPOSE 8080

ENTRYPOINT ["gost"]
CMD ["-L=http+ws://bbytop:bbytop@:8080"]
