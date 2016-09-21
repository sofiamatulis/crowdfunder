class Project < ApplicationRecord
  belongs_to :owned_user, class_name: "User"
  belongs_to :category
  has_many :users, through: :pledges
  has_many :pledges
end
