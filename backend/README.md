# Backend

API calls:






The first three endpoints inside the first line segment are for testing and help with implementation into the application (They will be removed from the final version - submission)
***

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

BUG - the current API I'm using doesn't reconisue all US zip codes so errors can accure - Working on it
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



