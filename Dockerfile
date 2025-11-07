FROM ghcr.io/modelcontextprotocol/python-mcp:latest

# Pin library versions that contain the latest CLI fixes and suppress oauth2client noise
RUN pip install --no-cache-dir --upgrade \
    "mcp-google-sheets>=0.3.4" \
    "google-api-python-client>=2.149.0" \
    "google-auth>=2.35.0" \
    "google-auth-oauthlib>=1.2.1"

EXPOSE 8080

# Safe entrypoint that always awaits the coroutine
CMD ["python", "-c", "import asyncio, mcp_google_sheets.server as s; asyncio.run(s.main())"]
