# NOTES for routes

## Controllers
 *  ruby class about_controller must be AboutController No space no .rb
 *  inherit application controller < ApplicationContoller to get all the functionality from rails

 must define action 
  def index
  end

## Routes

get "/" can be replaced by root: to ""


## Partial
 - not a full page layout
 - must start with an underscore '_'

## Links (navbar)

    Regular html <a class="nav-link" href="/about">About</a>

    Ruby helpers <%= link_to "About", about_path, class:"nav-link" %>

    - whats in the link_to " " in ruby is whats in between the a <a>  </a> in html

    Rails.application.routes.draw do
        get "about-us", to: "about#index" as: :about changed from get "about", to "about#index"
        root to: "main#index"
    end

    can change the url but keep the name the same

    link to helper see above
    url helper root_path, or about_path

## Flash
    Inherited from the application controller
    
    flash[:notice] = "Logged in successfully"

    most common, alert or notice

    wait to see if they are rendered on next request

    flash.now only displays on the current request

## Database 

    Create a database model 
    ex. rails generate model User email:string password_digest:string
    want passwords hashed for security

    rails db:migrate 

    when you run a model generator it will gernerate a database migration file which defines the new table and the changes to it. 

    once in production you dont want to lose and data. So you can always add to the table

### Models

    two levels

    Querying of the table. Interacting with all the users. 

    Instance of the users. Which is a single row in your database. Template for all the users an how to interact with them

## User

    has_secure_password method
    virtual attributs that wont run throught the databas but will run through bcrypt and has that password 

    we never have to deal with password_digest string

    the method will check the password and password confirmation see if they match then run it through bcrypt 

    rails will always create the created_at and update_at timestamps for you

### validations 

    validates :email, presence: true

    makes sure there is an email in the record before it saves it to the database

    db > migrate > user table  
    add 'null: false' to 't.string :email'
    result: t.string :email, null: false

### Database 

    rails db:rollback
    rails db:migrate

    rails db:redo - combines them both

## Regex

    Sets up a pattern then test a string against that pattern

    \A[A-Z0-9+_.-]+@[A-Z0-9.-]+\Z

    