class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  belongs_to :district
  belongs_to    :role
  has_many :votes


  validates :district,  uniqueness: true

  #if role_id == nil

  def local?
    return false if self.role.blank?
    self.role.name == "Czlonek Komisji Okręgowej"
  end

  def central?
    return false if self.role.blank?
  	self.role.name == "Członek Komisji Centralnej"
  end

  
end
