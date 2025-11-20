FROM python:3.10-slim-bullseye AS builder

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && \
    apt-get install -y --no-install-recommends \
      build-essential \
      curl \
      libssl-dev \
      libffi-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

COPY . .

RUN chmod +x /app/entrypoint.sh

# Railway will run the container without arguments
# So entrypoint should default to UI mode
ENTRYPOINT ["/app/entrypoint.sh"]

# Default command (runs when no args provided)
CMD ["ui"]