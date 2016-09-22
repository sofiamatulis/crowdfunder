class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :users, through: :pledges
  has_many :pledges
  validates :name, :date, :goal, :description, presence: true
  validates :goal, numericality: { greater_than_or_equal_to: 0 }



  def self.search(search)
  where("name LIKE ?", "%#{search}%")
  end

  def count(project)
    Pledge.where(project_id: project.id)
    count = 0
    pledge.each do |pledge|
      count += pledge.amount
    end
    return count

  end


end
