class Committee < ActiveRecord::Base
	validates :name, :presence => true
	validates :name, :length => { :minimum => 4 }


	has_and_belongs_to_many :voivodships
	validates :name, presence: true, uniqueness: true

	has_many :votes

	 #specify that the avatar is a paperclip file attachment
  	#specify additional styles that you want to use in views or eslewhere
  	has_attached_file :image, :styles => { large: "600x600>" , medium: "300x300>", thumb: "150x150#"}
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	


end
