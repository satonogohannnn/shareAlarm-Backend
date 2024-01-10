from typing import Union
from fastapi import FastAPI
import mysql.connector
from mysql.connector import errorcode
from sqlalchemy.orm import Session
from db import session, ENGINE, Depends
from model import UserResponse, Users

app = FastAPI()

def get_db():
    db = session()
    try:
        yield db
    finally:
        db.close()

@app.get("/users/", response_model=list[UserResponse])
def get_all_users(db: Session = Depends(get_db)):
    users = db.query(Users).all()
    return users


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}

# @app.get("/users/", response_model=list[UserResponse])
# def get_all_users(db: Session = Depends(get_db)):
#     users = db.query(Users).all()
#     return users