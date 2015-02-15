class User < ActiveRecord::Base
belongs_to :district

ROLES = %i[klient koordynator]
acts_as_authentic do |config|
config.validate_login_field = false
config.validate_email_field = false
config.validate_password_field = false
config.crypted_password_field = :crypted_password
config.require_password_confirmation = true
end
def role?(base_role)
ROLES.index(base_role.to_s) <= ROLES.index(role)
end
end
