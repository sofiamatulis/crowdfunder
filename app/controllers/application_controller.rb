class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  validates :name, :date, :goal, :user_id, :category_id, :description, presence: true
end
