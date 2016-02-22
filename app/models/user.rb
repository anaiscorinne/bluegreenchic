class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true

  after_initialize :set_default_role, :if => :new_record?


# set default to regular user
  def set_default_role
  	unless self.role 
  		self.role = :user 
  	end
  end

end
