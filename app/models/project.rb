class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :users, through: :pledges
  has_many :pledges
  validates :name, :date, :goal, :description, presence: true


  def self.search(search)
  where("name LIKE ?", "%#{search}%")

end


end
