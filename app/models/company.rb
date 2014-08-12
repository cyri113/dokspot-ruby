class Company < ActiveRecord::Base
  after_initialize :set_default_published, :if => :new_record?

  scope :published, -> { where(published: true) }

  has_many :users
  has_many :products
  
  validates :name,        presence: true
  validates :symbol,      presence: true
  validates :website,     presence: true
  validates :contact,     presence: true
  validates :order_email, presence: true
  
  validates :name,        uniqueness: true
  validates :symbol,      uniqueness: true
  
  def set_default_published
    self.published ||= true
  end

end