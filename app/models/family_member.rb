class FamilyMember < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :age, :email, :family_id, :name, :phone, :role

  belongs_to :family
  has_many :tasks
  has_many :task_logs

  # validates :name, presence: true
  validates :phone, uniqueness: true
end
