FROM python:3.12-slim
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN pip install --no-cache-dir mcp-google-sheets
ENV DRIVE_FOLDER_ID=placeholder_will_be_overridden
CMD ["mcp-google-sheets", "--transport", "sse", "--host", "0.0.0.0", "--port", "8080"]
