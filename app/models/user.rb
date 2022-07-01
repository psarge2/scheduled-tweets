# email:string
#password_digest:string - never had to set this ourselves 
# 
#password:sting virtual
#password_confirmation:string virtual


class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, format: { with: /\A[A-Z0-9+_.-]+@[A-Z0-9.-]+\Z/, message: "must be a valid email address" }
end
