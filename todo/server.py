import os
import uvicorn
from fastapi import FastAPI

app = FastAPI(title="Todo App")

@app.get("/")
async def root():
    return {"message": "Todo App is running"}

@app.get("/health")
async def health_check():
    return {"status": "healthy"}

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8000))
    print(f"Server started in port {port}")
    uvicorn.run(app, host="0.0.0.0", port=port)