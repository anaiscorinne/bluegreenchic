class User < ActiveRecord::Base
  acts_as_voter
  
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  before_create :set_default_role, :if => :new_record?


# set default to regular user
  def set_default_role
  	unless self.role 
  		self.role = :user 
  	end
  end

end
