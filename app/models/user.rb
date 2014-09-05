class User < ActiveRecord::Base
  enum role: [:operator, :manager, :admin]
  after_initialize :set_default_role, :if => :new_record?
  
  belongs_to :company

  def set_default_role
    self.role ||= :operator
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :invitable, :database_authenticatable, :confirmable, :recoverable, :rememberable, :validatable, :trackable
end