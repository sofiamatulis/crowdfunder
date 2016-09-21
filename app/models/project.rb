class Project < ApplicationRecord
  belongs_to :owned_user, class_name: "User"
  belongs_to :category
  has_many :users, through: :pledges
  has_many :pledges
  validates :name, :date, :goal, :user_id, :category_id, :description, presence: true
end
