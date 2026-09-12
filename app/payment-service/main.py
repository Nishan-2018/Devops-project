import os
from fastapi import FastAPI, Response, status
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI(title="Payment Microservice", version="1.0.0")

# Instrument Prometheus metrics
Instrumentator().instrument(app).expose(app)

@app.get("/")
def read_root():
    return {
        "service": "Payment Microservice",
        "status": "Healthy",
        "version": "1.0.0"
    }

@app.get("/healthz")
def health_check():
    return {"status": "ok"}

@app.post("/api/payments/process")
def process_payment(amount: float, currency: string = "USD"):
    return {
        "transaction_id": "TXN-8712634",
        "amount": amount,
        "currency": currency,
        "status": "APPROVED"
    }
