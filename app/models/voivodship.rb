class Voivodship < ActiveRecord::Base
  	validates :name, :presence => true
    validates :name, :length => { :minimum => 4 }
	has_and_belongs_to_many :committees
	has_many :districts
end
