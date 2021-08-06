class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :problem
  
  validates :text, presence: true
end
