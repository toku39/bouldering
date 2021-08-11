class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :problems
  has_many :comments
  has_many :likes, dependent: :destroy

  validates :name, presence: true

  def liked_by?(problem_id)
    likes.where(problem_id: problem_id).exists?
  end
end
