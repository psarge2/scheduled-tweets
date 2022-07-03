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


## Vriables

    instance variable - ad @ to a variable ex @user
    can be visiable in our views

    local variable onl availble inside the method (not able to use anywhere else)


## Form with

    ex. <%= form_with model: @user do |form| %>

    for with looks for a url based upon or model 
     - user would look for a url helper called user (added to routes)
     - ex.  post "users", to: "registrations#creasate"
     
     ADD URL 
     <%= form_with model: @user, url: sign_up_path do |form| %>

     post "sign_up", to: "registrations#creasate"

     <%= form_with model: @user, url: sign_up_path do |form| %>
         <%= form.text_field :email %>
        <%= form.text_field :password %>
        <%= form.text_field :password_confirmation%>
    <% end %>

    change passworfd from text_field to password_field to hide password

    form.submit (button)
    submit talks to form 
    form knows we have a model called user and the model is brand new
    if its brand new and not inthe database we want to say 'create {modelname}'

    to overide pass in a string as an argument

    <%= form.submit "Get Started" %>

## Private

    allows o
    params user.permit
    params.require(:user).permit(:email, :password, :password_confirmation)
    there are the only thing wer allow you to set

    if you create a private param

    private def user_params
        params.require().permit(:email, :password)

    pass the private method back into the create

        def create
            @user = User.new(user_params)
        end

## COokies
    sesioned cookies 

    encrypted store - stored cookie in your browser 

    assigned cookies

