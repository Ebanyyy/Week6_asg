class User < ActiveRecord::Base
	has_many :rating
	has_secure_password
end