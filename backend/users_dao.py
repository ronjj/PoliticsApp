"""
DAO (Data Access Object) file

Helper file containg function for accesing data in our database
"""
from app import app
from db import User

def get_user_by_name(Cname):
    """
    Returns a user object from the database given an name
    """
    return User.query.filter_by(name = Cname).first()

def get_user_by_session_token(token):
    """
    Returns a user object from the database given an session token
    """
    return User.query.filter_by(session_token = token).first()

def get_user_by_update_token(token):
    """
    Return a user object from the database given an update token
    """
    return User.query.filter_by(update_token = token).first()

def verify_credentials(name, password):
    """
    Returns true if the credentials match, otherwise returns false
    """
    optional_user = get_user_by_name(name)
    if optional_user is None:
        return False, None
    return optional_user.verify_password(password), optional_user

def create_user(name, password):
    """
    Create a User object in the database

    Returns if creations was succesful, and the User object
    """
    optional_user = get_user_by_name(name)
    if optional_user is not None:
        return False, optional_user
    #app.
    #call create user in app.py
    answer = app.create_user_body()
    #return True, User
    return True, answer
