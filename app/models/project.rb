class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :users, through: :pledges
  has_many :pledges
  validates :name, :date, :goal, :description, presence: true
end

def self.index(search)
  # Title is for the above case, the OP incorrectly had 'name'
  where("title LIKE ?", "%#{search}%")

end
