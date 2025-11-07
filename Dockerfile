FROM python:3.12-slim AS runtime

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

COPY pyproject.toml uv.lock README.md ./
COPY src ./src
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --upgrade pip setuptools wheel && \
    pip install .

EXPOSE 8080

CMD ["mcp-google-sheets", "--transport", "sse", "--host", "0.0.0.0", "--port", "8080"]
