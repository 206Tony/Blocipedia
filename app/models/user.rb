class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis
  has_many :collaborations, through: :collaborators, source: :wiki
  has_many :collaborators

  after_initialize :set_role

  enum role: [:standard, :premium, :admin]

  def admin?
    role == "admin"
  end

  def premium?
    role == "premium"
  end

  def standard?
    role == "standard"
  end

  def upgrade_account
    self.update(role: 'premium')
  end

  def downgrade_account
    self.update(role: 'standard')
  end

  private

  def set_role 
  	self.role ||= :standard 
  end
end
