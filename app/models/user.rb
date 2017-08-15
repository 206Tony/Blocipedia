class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis

  after_initialize :set_role


  def set_role 
  	self.role ||= :standard 
  end
  
  enum role: [:standard, :premium, :admin]

end
