class Comment < ApplicationRecord
  belongs_to :post

  validates :user_name, :body, presence: true
end
