class District < ActiveRecord::Base
	belongs_to :voivodship
	has_one :user

	 validates :name, presence: true, uniqueness: true
	 
	 has_many :votes
		
end
