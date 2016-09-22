class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :users, through: :pledges
  has_many :pledges
  validates :name, :date, :goal, :description, presence: true
  has_many :rewards
  accepts_nested_attributes_for :rewards, reject_if: :all_blank
  validates :goal, numericality: { greater_than_or_equal_to: 0 }
  def self.search(search)
  where("name LIKE ?", "%#{search}%")
  end



end
