class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :users, through: :pledges
  has_many :pledges
  validates :name, :date, :goal, :description, presence: true
  has_many :rewards
  accepts_nested_attributes_for :rewards, reject_if: :all_blank


  def self.search(search)
  where("name LIKE ?", "%#{search}%")

end


end
