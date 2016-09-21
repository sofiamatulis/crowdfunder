class User < ApplicationRecord
  has_many :pledges
  has_many :projects 
  has_many :owned_projects, class_name: 'Project'
end
