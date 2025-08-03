
# Use Python slim image
FROM python:3.11-slim

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Set working directory
WORKDIR /app

# Copy project files
COPY pyproject.toml ./
COPY uv.lock ./
COPY server.py ./

# Install dependencies using uv
RUN uv sync --frozen --no-cache

# Set default port
ENV PORT=8000

# Expose the port
EXPOSE ${PORT}

# Run the application
CMD sh -c "uvicorn server.py --host 0.0.0.0 --port ${PORT:-8000}"