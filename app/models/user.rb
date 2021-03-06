class User < ApplicationRecord
	include BCrypt
	has_secure_password
	enum status: { user: 0, superadmin: 1}
  	has_many :authentications, dependent: :destroy
    
    def self.create_with_auth_and_hash(authentication, auth_hash)
      if auth_hash.provider == 'google_oauth2'
        user = self.create!(
          name: auth_hash["info"]["name"],
          email: auth_hash["info"]["email"],
          password: SecureRandom.hex(16)
        )
        user.authentications << authentication
        return user
      else auth_hash.provider == 'facebook'
        user = self.create!(
          name: auth_hash["extra"]["raw_info"]["name"],
          email: auth_hash["extra"]["raw_info"]["email"],
          password: SecureRandom.hex(16)
        )
        user.authentications << authentication
        return user
      end  
    end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end

    def google_token
      x = self.authentications.find_by(provider: 'google')
      return x.token unless x.nil?
    end
end
