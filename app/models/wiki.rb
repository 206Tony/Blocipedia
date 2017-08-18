class Wiki < ApplicationRecord
	belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  
  #default_scope { order('created_at DESC') }
  scope :visible_to, -> (user) {user && ((user.role == 'admin') || (user.role == 'premium')) ? all : where(private: false) }
  scope :private_wikis, -> (user) { where(private: true) }

  def public?
  #	!private?
    self.private == false
  end

  def private? 
    self.private == true
  end
end
