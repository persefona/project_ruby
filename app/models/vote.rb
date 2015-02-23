class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :committee
	belongs_to :district


	validates :committee_id, :uniqueness => {scope: :district_id, :case_sensitive => false, :message => "Wprowadzono już głosy na ten komitet" }
end
