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