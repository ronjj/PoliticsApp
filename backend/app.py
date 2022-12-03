import json

from db import db
from flask import Flask
from db import User
from db import Representative
from db import Location
from db import representative_user_association_table
from flask import request
import csv
import users_dao
import requests

app = Flask(__name__)
db_filename = "cms.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()


#csv test file
with open("Final thing.csv", "r") as csv_file:
    csv_reader = csv.reader(csv_file)

    for line in csv_reader:
        print(line)






def success_response(data, code=200):
    return json.dumps(data), code

def failure_response(message, code=404):
    return json.dumps({"error": message}), code 

#endpoints
#@
#issue with zip codes and api

#MAIN ENDPOINTS
    #create_user

#create endpoints
#session endpoint
@app.route("/api/district/state/", methods=["POST"])
def get_district_represenative():
    """
    Returns represenatives for any district, state combo
    """
    body = json.loads(request.data)
    state = body.get("state")
    district = body.get("district")
    with open("Final thing.csv", "r") as csv_file:
        csv_reader = csv.reader(csv_file)
        for line in csv_reader:
            if(line[2] == state):
                print(line[2])
                if(line[1][-2:] == district):
                    print(line[1][-2:])
                    print("found")
                    #call function with zip code
    return failure_response("That state, district combo isn't in our database")

@app.route("/api/user/all/")
def get_users_all():
    """
    Endpoint for returning all represenenatives related to a user
    """
    if(check_token(extract_token(request)) == False):
        return failure_response("That is not the valid user session")
    user = User.query.filter_by(session_token=extract_token(request)).first()
    if user is None:
        return failure_response("User not found")
    return success_response(user.serialize())

@app.route("/api/start/", methods=["POST"])      
def get_all_districts():
    """
    Creates a list of all pairs of state, district to color
    """
    with open("Final thing.csv", "r") as csv_file:
        csv_reader = csv.reader(csv_file)
        district_pairs = {}
        for line in csv_reader:
            x = internal_location_creation(line[0])
            print(x)
            if(type(x) == type("hello")):
                district_pairs[str(line[1])] = "Democrat"
            else:
                if(x["represenative"] == []):
                    district_pairs[str(line[1])] = "Democrat"
                else:
                    party = x["represenative"][0]["party"]
                    district_pairs[str(line[1])] = party
    print(district_pairs)
    return district_pairs
                


def internal_location_creation(zip):
    """
    Returns the represenatives for a zip
    """
    print(zip)
    zip = str(zip)
    response = requests.get("https://whoismyrepresentative.com/getall_mems.php?zip=" + zip+ "&output=json")
    if(str(response.text) == "<result message='No Data Found' />"):
        return "That zip code is not working at this time, input a zip code similar to the last one"
    print(response.text)
    location_name = response.json()["results"][0]["state"]
    state = location_name
    new_location = Location(name = state, zipCode = zip, state = state)
    db.session.add(new_location)
    db.session.commit()
    #create represenatives
    for represenatives in range(len(response.json()["results"])):
        if(True): #stand in for checking if the represenative already exists
            create_represenatives(response.json()["results"][represenatives], zip)
    return new_location.serialize()


def extract_token(request):
    """
    Helper funciton that extracts the token from the header of a request
    """
    auth_header = request.headers.get("Authorization")
    if auth_header is None:
        return False, json.dumps({"error:":"Missing authorization header."}), 400
    bearer_token = auth_header.replace("Bearer ", "").strip()
    if bearer_token is None or not bearer_token:
        return False, failure_response("Invalid authorization header", 400)
    return bearer_token

def check_token(token):
    """
    Helper function that checks if a token is valid
    """
    user = users_dao.get_user_by_session_token(token)
    if user is None and user.verify_session_token(token):
        return False
    else:
        return True

@app.route("/api/login/", methods=["POST"])
def login():
    """
    Endpoint for a user to login in
    """
    body = json.loads(request.data)
    name = body.get("name")
    password = body.get("password")
    if name is None or password is None:
        return failure_response("Missing email or password!", 400)
    success, user = users_dao.verify_credentials(name, password)
    if success is False:
        return failure_response("Incorrect name or password", 401)
    return success_response({
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "update_token": user.update_token
    })

@app.route("/api/all/represenatives/colors/")
def get_all_represenatives_ever():
    """
    Returns a list of dictionaries with district name, and party control
    """
    # list of all districts and zip codes
    #get all represenatives and store values
    #
    pass


@app.route("/api/delete/user/<int:user_id>/", methods = ["DELETE"])
def delete_location(user_id):
    """
    Deletes a location from the location list
    """
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return failure_response("User not foudn")
    db.session.delete(user)
    db.session.commit()
    return success_response(user.serialize())

#testers
@app.route("/api/user/")
def get_all_users():
    """
    Endpoint for getting all users
    """
    users = [users.serialize() for users in User.query.all()]
    return success_response({"users":users})

@app.route("/api/locations/")
def get_all_locations():
    """
    Endpoint for getting all locations
    """
    location = [location.serialize() for location in Location.query.all()]
    return success_response({"location":location})

@app.route("/api/represenatives/")
def get_all_represenatives():
    """
    Endpoint for getting all represenatives
    """
    represenative = [represenative.serialize() for represenative in Representative.query.all()]
    return success_response({"represenative":represenative})

def connect_user_to_represenatives(zip, user_id):
    """
    Helper function for connecting a represenatives 
    """
    #location for that zip
    new_location = Location.query.filter_by(zipCode = zip).first()
    user = User.query.filter_by(id = user_id).first()
    for represenatives in range(len(new_location.represenatives_with_location)):
        new_location.represenatives_with_location
        user.representatives_for_users.append(new_location.represenatives_with_location[represenatives])
    #adds all the represenatives to the representatives_for_users




@app.route("/api/user/", methods=["POST"])
def create_user():
    """
    Endpoint for creating a user
    """
    body = json.loads(request.data)
    if body.get("name") is None or body.get("password") is None or body.get("location") is None:
            return failure_response("Missing at least one of the required inputs: name, password, and location.", 400)
    if(User.query.filter_by(name = body.get("name")).first() is not None):
        return failure_response("User already exists", 400)
    response = requests.get("https://whoismyrepresentative.com/getall_mems.php?zip=" + body.get("location")+ "&output=json")
    if(str(response.text) == "<result message='No Data Found' />"):
        return failure_response("That zip code is not working at this time, input a zip code similar to the last one")
    new_location = Location.query.filter_by(zipCode = body.get("location")).first()
    if(new_location is None):
        x = create_location(body.get("location"))
        new_location = Location.query.filter_by(zipCode = body.get("location")).first()
        #make new_location the new location
    #if this zip code already has a location then connect it to that one and connect it's represenatives to this
    # if it doesn't then create this location and then connect it to this user and it's represenatives
    new_user = User(name = body.get("name"), password = body.get("password"), location = new_location.id)
    db.session.add(new_user)
    db.session.commit()
    #connect user to represenatives in location
    connect_user_to_represenatives(body.get("location"), new_user.id)
    #
    db.session.commit()
    return success_response(new_user.serialize(), 201)

def create_user_body(name, password, zipCode):
    """
    Endpoint for creating a user
    """
    new_location = Location.query.filter_by(zipCode = zipCode).first()
    if(new_location is None):
        create_location(zipCode)
        new_location = Location.query.filter_by(zipCode = zipCode).first()
        #make new_location the new location
    
    #if this zip code already has a location then connect it to that one and connect it's represenatives to this
    # if it doesn't then create this location and then connect it to this user and it's represenatives
    new_user = User(name = name, password = password, location = new_location.id)
    db.session.add(new_user)
    db.session.commit()
    #connect user to represenatives in location
    connect_user_to_represenatives(zipCode, new_user.id)
    #
    db.session.commit()
    return success_response(new_user.serialize(), 201)



def create_represenatives(represenativeList, zip):
    """
    Endpoint for creating a represenative
    """
    name = represenativeList["name"]
    party = represenativeList["party"]
    state = represenativeList["state"]
    district = represenativeList["district"]
    phone = represenativeList["phone"]
    office = represenativeList["office"]
    website = represenativeList["link"]
    if("Senate" in office):
        title = "Senator"
    else:
        title = "House"
    location = Location.query.filter_by(zipCode = zip).first()
    location_id = location.id    
    new_represenative = Representative(name = name, phone = phone, title = title, party = party, website = website, office = office, state = state, location_for_represenative = location_id)
    db.session.add(new_represenative)
    db.session.commit()
    return success_response(new_represenative.simple_serialize())

def create_location(zip):
    """
    Endpint for creating a location
    """
    zip = str(zip)
    response = requests.get("https://whoismyrepresentative.com/getall_mems.php?zip=" + zip+ "&output=json")
    if(str(response.text) == "<result message='No Data Found' />"):
        return failure_response("That zip code is not working at this time, input a zip code similar to the last one")
    
    location_name = response.json()["results"][0]["state"]
    state = location_name
    new_location = Location(name = state, zipCode = zip, state = state)
    db.session.add(new_location)
    db.session.commit()
    #create represenatives
    for represenatives in range(len(response.json()["results"])):
        if(True): #stand in for checking if the represenative already exists
            create_represenatives(response.json()["results"][represenatives], zip)
    return success_response(new_location.serialize())


@app.route("/api/user/represenatives/")
def get_users_represenatives():
    """
    Endpoint for returning all represenenatives related to a user
    """
    if(check_token(extract_token(request)) == False):
        return failure_response("That is not the valid user session")
    user = User.query.filter_by(session_token=extract_token(request)).first()
    if user is None:
        return failure_response("User not found")
    return success_response(user.serialize()["representatives"])

@app.route("/api/locations/<int:zip_code>/")
def get_location(zip_code):
    """
    Endpoint for getting the represenatives of a zip code
    """
    location = Location.query.filter_by(zipCode = zip_code).first()
    if location is None:
        response = requests.get("https://whoismyrepresentative.com/getall_mems.php?zip=" + str(zip_code) + "&output=json")
        if(str(response.text) == "<result message='No Data Found' />"):
            return failure_response("That zip code is not working at this time, input a zip code similar to the last one")
        create_location(zip_code)
        answer = Location.query.filter_by(zipCode = str(zip_code)).first().serialize()["represenative"]
    else:
        answer = location.serialize()["represenative"]
    return success_response(answer)

#implement all general gets
#implement all the sepcific gets 
#API call to newApi, politicAapi 

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
