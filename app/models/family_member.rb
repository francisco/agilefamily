class FamilyMember < ActiveRecord::Base
  attr_accessible :age, :email, :family_id, :name, :phone, :role

  attr_accessible :age, :family_id, :name, :phone_number, :role

  belongs_to :family
  has_many :tasks
  has_many :task_logs

  validates :name, presence: true
  validates :phone_number, uniqueness: true
end
