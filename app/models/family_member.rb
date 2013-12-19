class FamilyMember < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :age, :family_id, :name, :phone, :role, :accepted

  before_validation :clean_phone_number

  belongs_to :family
  has_many :tasks
  has_many :task_logs

  # validates :name, presence: true
  # validates :phone, uniqueness: true

  def clean_phone_number
    number = self.phone

    if number
      unless number[0..1] == "+1"
        number.gsub!(/[^0-9]/, '')
        self.phone = "+1#{number}"
      end
    end
  end
end
