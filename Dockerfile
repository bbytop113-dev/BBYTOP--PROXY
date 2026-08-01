# Single Dockerfile for GOST proxy on Railway
FROM ginuerzh/gost:latest

# Set environment variables
ENV GOST_USER=admin \
    GOST_PASS=securepassword123 \
    GOST_PORT=443

# Expose port
EXPOSE 443

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD ["gost", "-L=:443"]

# Run GOST with WebSocket and authentication
CMD ["sh", "-c", "gost -L=wss://:${GOST_PORT}?auth=${GOST_USER}:${GOST_PASS}"]
