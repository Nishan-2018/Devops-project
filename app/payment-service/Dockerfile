FROM python:3.11-slim AS builder
WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt -t /app/deps

FROM python:3.11-slim
WORKDIR /app

# Non-root user setup
RUN addgroup --system appgroup && adduser --system --group appuser

COPY --from=builder /app/deps /usr/local/lib/python3.11/site-packages
COPY main.py ./

USER appuser
EXPOSE 8000

CMD ["python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
