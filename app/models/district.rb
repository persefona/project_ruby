class District < ActiveRecord::Base
	belongs_to :voivodship
	has_one :user

	 

		
end
