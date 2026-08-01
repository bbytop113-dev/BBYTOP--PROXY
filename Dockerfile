FROM ginuerzh/gost:latest

# Railway dwara allocate kiye gaye port ko expose karein (Default: 443 ya PORT env)
EXPOSE 443

CMD ["-L=wss://bbytop:bbytop@:443"]
