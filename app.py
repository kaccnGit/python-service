from datetime import datetime
from typing import Any, Dict

from fastapi import FastAPI
from pydantic import BaseModel


class EchoRequest(BaseModel):
    message: str


def create_app() -> FastAPI:
    app = FastAPI(title="python-service", version="1.0.0")

    @app.get("/health")
    def health() -> Dict[str, Any]:
        return {"status": "ok", "timestamp": datetime.utcnow().isoformat() + "Z"}

    @app.get("/")
    def health() -> Dict[str, Any]:
        return {"status": "ok", "timestamp": datetime.utcnow().isoformat() + "Z"}

    @app.post("/echo")
    def echo(payload: EchoRequest) -> Dict[str, str]:
        return {"echo": payload.message}

    return app


app = create_app()
