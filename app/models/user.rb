class User < ApplicationRecord
	include BCrypt
	has_secure_password
	enum status: { user: 0, superadmin: 1}
end
