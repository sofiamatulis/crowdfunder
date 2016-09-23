class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :name, :password_digest, :email, presence: true


  has_many :pledges
  has_many :projects, through: :pledges 
  has_many :owned_projects, class_name: 'Project'
  has_many :comments
end
