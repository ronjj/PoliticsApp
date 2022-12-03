from flask_sqlalchemy import SQLAlchemy
import hashlib
import bcrypt
import os
import datetime

db = SQLAlchemy()
                                                                                                                                                                   
representative_user_association_table = db.Table(
    "representative_user_association",
    db.Column("representative_id", db.Integer, db.ForeignKey("representative.id")),
    db.Column("user_id", db.Integer, db.ForeignKey("user.id"))
)

class User(db.Model):
    """
    User Model

    Relationships:

    A class that stores are user information in a database - has a many to many relationship to the Representative table
    and a one to many relationship to the location table
    """
    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    name = db.Column(db.String, nullable = False, unique=True)
    password = db.Column(db.String, nullable = False) # change back to false
    session_token = db.Column(db.String, nullable=False, unique=True)
    session_expiration = db.Column(db.DateTime, nullable=False)
    update_token = db.Column(db.String, nullable=False, unique =True)
    representatives_for_users = db.relationship("db.Representative", secondary=representative_user_association_table, back_populates="users_for_represenative")
    location_for_users = db.Column(db.Integer, db.ForeignKey("location.id"), nullable = False)

    def __init__(self, **kwargs):
        """
        Initializes User object
        """
        self.name = kwargs.get("name", "")
        self.password = bcrypt.hashpw(kwargs.get("password").encode("utf8"), bcrypt.gensalt(rounds=13))
        self.location_for_users = kwargs.get("location", "")
        self.renew_session()
    
    def _urlsafe_base_64(self):
        """
        Randomly generates hashed tokens
        """
        return hashlib.sha1(os.urandom(64)).hexdigest()

    def renew_session(self):
        """
        Renews the session
        """
        self.session_token = self._urlsafe_base_64()
        self.session_expiration = datetime.datetime.now() + datetime.timedelta(weeks=1)
        self.update_token = self._urlsafe_base_64()
    
    def verify_password(self, password):
        """
        Verifies the password of a user
        """
        return bcrypt.checkpw(password.encode("utf8"), self.password)

    def verify_session_token(self, session_token):
        """
        Verifies the session token of a user
        """
        return session_token == self.session_token and datetime.datetime.now() < self.session_expiration

    def verify_update_token(self, update_token):
        """
        Verify the update token of a user
        """
        return update_token == self.update_token

    def serialize(self):
        """
        Serializes User object
        """
        return {
            "id": self.id,
            "name": self.name,
            "representatives": [a.simple_serialize() for a in self.representatives_for_users],
            "location": ((Location.query.filter_by(id=self.location_for_users).first()).simple_serialize()),
            "session_token": self.session_token,
            "session_expiration": str(self.session_expiration),
            "update_token": self.update_token
        }
    
    def simple_serialize(self):
        """
        Simple serializes User object
        """
        return {
            "id": self.id,
            "name": self.name
        }

class Representative(db.Model):
    """
    Representative Model

    Relationships:

    A class that stores are representatitve information in a database - has a many to many relationship to the User table
    and a one to many relationship to the location table
    """
    __tablename__ = "representative"
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    name = db.Column(db.String, nullable = False)
    #political_lean = db.Column(db.String, nullable = False)
    party = db.Column(db.String, nullable = False)
    #topics = db.Column(db.String, nullable = False)
    phone = db.Column(db.String, nullable = False)
    office = db.Column(db.String, nullable = False)
    state = db.Column(db.String, nullable = False)
    website = db.Column(db.String, nullable = False)
    title = db.Column(db.String, nullable = False)
    users_for_represenative = db.relationship("db.User", secondary=representative_user_association_table, back_populates="representatives_for_users")
    location_for_represenative = db.Column(db.Integer, db.ForeignKey("location.id"), nullable = False)
    
    def __init__(self, **kwargs):
        """
        Initializes Representative object
        """
        self.name = kwargs.get("name","")
        print(kwargs.get("political_lean"))
        #self.political_lean = kwargs.get("political_lean", "")
        #self.topics = kwargs.get("topics", "")
        self.office = kwargs.get("office", "")
        self.state = kwargs.get("state", "")
        self.phone = kwargs.get("phone", "")
        self.party = kwargs.get("party", "")
        self.website = kwargs.get("website", "")
        self.title = kwargs.get("title","")
        self.location_for_represenative = kwargs.get("location_for_represenative", "")

    def serialize(self):
        """
        Serializes Representative object
        """
        return {
            "id": self.id,
            "name": self.name,
            #"political lean": self.political_lean,
            #"topics": self.topics,
            "office": self.office,
            "state": self.state,
            "party": self.party,
            "phone": self.phone,
            "website": self.website,
            "title": self.title,
            "users": [u.simple_serialize() for u in self.users_for_represenative],
            "location": ((Location.query.filter_by(id=self.location_for_represenative).first()).simple_serialize())
        }
    def simple_serialize(self):
        """
        Simple serializes Representative object
        """
        return {
            "id": self.id,
            "name": self.name,
            #"political lean": self.political_lean,
            #"topics": self.topics,
            "party": self.party,
            "phone": self.phone,
            "website": self.website,
            "office": self.office,
            "title": self.title,
            "state": self.state
        }

class Location(db.Model):
    """
    Location Model

    Relationships:

    A class that stores are location information in a database - has a many to one relationship to the Representative table
    and a one to many relationship to the user table
    """
    __tablename__="location"
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    name = db.Column(db.String, nullable = False)
    zipCode = db.Column(db.String, nullable = False)
    state = db.Column(db.String, nullable = False)
    users_with_location = db.relationship("User", cascade="delete")
    represenatives_with_location = db.relationship("Representative", cascade="delete")

    def __init__(self, **kwargs):
        """ 
        Initalizes Location object
        """
        self.name = kwargs.get("name", "")
        self.zipCode = kwargs.get("zipCode", "")
        self.state = kwargs.get("state", "")
    
    def simple_serialize(self):
        """
        Simple serializes Location object
        """
        return {
            "name": self.id,
            "zipCode": self.zipCode,
            "state": self.state
        }

    def serialize(self):
        """
        Serializes Locaiton object  
        """
        return {
            "name": self.id,
            "zipCode": self.zipCode,
            "state": self.state,
            "user": [a.simple_serialize() for a in self.users_with_location],
            "represenative": [a.simple_serialize() for a in self.represenatives_with_location]
        }

#topic table