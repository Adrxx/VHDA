class User < ActiveRecord::Base

	attr_accessor :password

	before_save :encrypt_password

	validates :email, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 80} 

	validates :password, confirmation: true;

	validates :password_confirmation, presence: true;


	def self.authentificate(email,password)

		user = find_by_email(email.downcase)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		end
		#If theres no user with that email or the password is incorrect this method returns nil
	end


	def encrypt_password
		if password.present?
      		self.password_salt = BCrypt::Engine.generate_salt
      		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    	end
	end

end
