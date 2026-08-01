FROM ginuerzh/gost:latest

# Railway PORT environment variable aur Expose 
EXPOSE 8080

CMD ["sh", "-c", "gost -L=wss://bbytop:bbytop@:8080"]
