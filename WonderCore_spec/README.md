# WonderCore App Document



#### **REST API Endpoints**


**Server Response Format**

The server would respond in the following format:

```
{
    result:0,
    data:<(json) relevent data or error message>
}```
<br/>
A successful api call would look like:

```
{
    result:<(int) 0 indicating success, numbers greater than 0 indicating the success code>,
    data:<(json) relevent data>,
    count:<(int) count of objects for pagination if data is an array>
}```
<br/>
A failed call or a call with an erronous result would look like:

```
{
    result:<(int) a negative indicating the type of error>,
    error:{
        message:<(string) the message describing the error>,
        stacktrace:<(string) when in debug mode, this field would be the stacktrace of the error from the server>
    }
}```
<br/>
Universal error codes are:

```
-1 = server error
-2 = not authorized to perform the action```
<br/>
The base endpoints available and their usage can be found in the sails js documentation at:

[http://sailsjs.org/#!/documentation/reference/blueprint-api?q=blueprint-routes]

---
**HTTP Methods**

The REST api endpoints specific to the http verbs are defined as follows:

```
GET     /api/:model/      = fetch a list of model objects
POST    /api/:model/      = create a model
PUT     /api/:model/:id   = update model where id is
DELETE  /api/:model/:id   = delete model where id is```

The model fields can be found at:

[http://192.168.1.99:8081]
