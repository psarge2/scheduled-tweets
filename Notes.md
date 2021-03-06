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

    A header that is sent back back and forth always every request in you browser

    Sessioned cookies 

    encrypted store - stored cookie in your browser 

    Assigned cookies

    find vs find_by

    find_by will not throw an error if user cannot be found

## Action Control
before_action

something that is done before all other actions in any controller (if set on appcontroller) 
ex. before_action :set_current_user

change instance variable (@user) to current.user in views


## Action mailer

rails g to create a mailer 

rails g mailer {Mailer Name} {email for mailer}
give mailer name emails to send

ex. gails g mailer Password reset

ex. placed in controller

def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            #send email
            PasswordMailer.with(user: @user).reset.deliver_later
        
        redirect_to root_path, notice: "if an accoint with that email was found, we have sent a link to reset your password."    
end

PasswordMailer - what email we are sending

(user:@user) - params for who is getting the email

reset - what email we are sending

deliver_later - background job

user will see a reponse quickly but the email will come later

### Token for User ID

from rails console

global id
user.to_global.id.to_s

signed id
user.signed_id
verified by server to know its not messed with

user.signed_id(expires_in: 15.minutes)
can add a purpose. 
user.signed_id(expires_in: 15.minutes, purpose:"password_reset")
then the server will know "we only take user signed id's with the purpose of resetting the password

have to use url in mailers


## Note

need a model inthe form from this to work:

<% if form.object.errors.any? %>
        <div class="alert alert-danger">
            <% form.object.errors.full_messages.each do |message| %>
            <div><%= message %></div>
        <% end %>
        </div>
    <% end %>

