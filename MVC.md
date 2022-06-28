# The Model View Controller (MVC) Pattern
 - this is how Rails decides how to process your request 
 - where to find information in the data base
 - how to render responses (HTML, XML, JSON, JavaScript, etc)

 GET /about HTTP/1.1
 Host: 127.0.0.01

 GET for "/about

## Routes
Matchers for the URL that is requested

GET for "/about"

I see you requested "/about", we'll give it to the AboutController to handle 

Here's a URL lets give it to a controller to process it


## Models
Database wrapper

User
* query for records (ex all the users who logged in in the last 24hrs)
* wrap indivdual records (ex. username must be at least 3 charaters long)

PURPOSE IS TO INTERACT WITH DATABASE RECORDS AND TABLES

## Views
 - Views incompass the rendered formats 
 * HTML
 * CSV
 * PDF
 * XML

 - whats get sent back to the browser and displayed

## Controllers
Decide how to process a request and define a response

-  ex. hey you tried to give a passowrd but it wasnt long enough so we will give you an error back. But if it is long enough we will direct you to the user dashboard

DECIDE WHERE THINGS GO

Decides what get renders and how its views (what view to assign)

controls how the request is handled