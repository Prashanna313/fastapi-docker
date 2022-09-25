"""Sample FastAPI code"""
from fastapi import FastAPI

APP = FastAPI()


@APP.get("/items")
async def get_items():
    """
    Sample FastAPI method
    """
    return {"message": "Hello World"}
