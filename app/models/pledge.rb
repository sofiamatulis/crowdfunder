class Pledge < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :amount, :user_id, :project_id, presence: true
end
