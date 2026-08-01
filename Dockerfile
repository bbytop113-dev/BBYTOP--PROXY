FROM ginuerzh/gost:latest

# Set default credentials (can be overridden via Railway env vars)
ENV GOST_USER=admin \
    GOST_PASS=securepassword123

# Use Railway's dynamic PORT (they set this env var)
EXPOSE $PORT

# Start GOST with HTTP proxy on the Railway-provided port
CMD ["sh", "-c", "gost -L=http://:${PORT}?auth=${GOST_USER}:${GOST_PASS}"]
