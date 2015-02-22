class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :committee
	belongs_to :district
end
