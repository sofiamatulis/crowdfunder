class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :users, through: :pledges
  has_many :pledges
  has_many :comments
  validates :name, :date, :goal, :description, presence: true
  has_many :rewards, inverse_of: :project
  accepts_nested_attributes_for :rewards, allow_destroy: true
  validates :goal, numericality: { greater_than_or_equal_to: 0 }
  
  def self.search(search)
  where("name LIKE ?", "%#{search}%")
  end



end

def self.index(search)
  # Title is for the above case, the OP incorrectly had 'name'
  where("title LIKE ?", "%#{search}%")

end
