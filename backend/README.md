# Backend
We would start by having three full tables, a user table, topics table, and a representative. The user table would store information like zip code, representatives they follow, topics they follow, and elections. The representative table would give basic information about a candidate - name, state, political office, age, three policies they are for, three policies they are against. The topics table would store the topic name, important information about the topic, topic location, and information about said topic. In connection with these three tables, I might implement a many-to-many table for the connection between representatives and users, or users-and-topics, but I believe I can do it with just many-to-one relationships. Finally, I’ll be using a News API to pull articles in relation to a user’s topic interest or representative they are following - I plan to use Newsdata API, but that’s subject to change as I implement.  



Our backend has several things implemented and a few items that will be implemented in a future update:
    -Routes:
        Implemented routes explained below
    -Database:
        We have a three tables: user, represenatives, and location
            user has a many to many relationship with a represenative, and a one to many relationship with             location
            
            represenatives has a one to many relationship with location
    -External API:
        We used the api https://whoismyrepresentative.com/getall_mems.php?zip=(zipcode)&output=json
    
  


API calls:

The first three endpoints inside the first line segment are for testing and backend use

GET - All users:[
(35.188.171.193/api/user/)
Returns all users in the database]

GET - All Locations:[
(35.188.171.193/api/locations/)
Returns all the locations in the database]

GET - ALL representatives:[
(35.188.171.193/api/represenatives/)
Returns all the representatives in the database]





----------------------------------------------------------------------------------------------------------------------------------------
POST - Create user:[
(35.188.171.193/api/user/)
Returns the created user if succesful - including the session token, expiration time, and update token

Required inputs -
{
    "name": user_name,
    "password": user_password,
    "location": user_zipCode
}
]


----------------------------------------------------------------------------------------------------------------------------------------
GET - Get location represenatives:[
(35.188.171.193/api/locations/(zip_codes)/)
Returns the represenatives connected to a zip code - if the zip code doesn't exist on the server then it creates that location, and then returns it

BUG - the current API is weird with some zip codes - Working on it
]




----------------------------------------------------------------------------------------------------------------------------------------
GET - User Represenatives:[
(35.188.171.193/api/represenatives/)
Returns the represenatives connected to a user

required inputs:
Their is no body, but a header with one of the key-value pairs - key: "Authorization" and Value: 
"Bearer (the session token)"

For example: user id 1, name: "Henry", has a session token of "6726cf2386aca26cec9dd3bd0fbdb0427449d07b"

So if you want the represenatives of user id 1, then the Authorization header value will be:
"Bearer 6726cf2386aca26cec9dd3bd0fbdb0427449d07b"
]


----------------------------------------------------------------------------------------------------------------------------------------
POST - Login:[
(35.188.171.193/api/login/)
Returns the session token, session update, and session expiration of a user

Inputs: 
{
    "name": user_name,
    "password": user_password
}

Example:
For user id 3:
{
    "name": "test_name",
    "password": "the password"
}
]
***
GET - Return user information
(35.188.171.193/api/user/all/)
Does the same as get user represenatives, but returns all things conencted to a user

DELETE - Delete User
(/api/delete/user/<int:user_id>/)
Deletes the user with the specified user_id


