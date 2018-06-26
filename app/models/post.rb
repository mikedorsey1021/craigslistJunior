class Post < ApplicationRecord
  validates :name, presence: true
  validates :author, presence: true
  validates :body, presence: true

  belongs_to :category
end
