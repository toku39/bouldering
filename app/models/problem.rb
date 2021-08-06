class Problem < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
  belongs_to :climb_done
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy

  with_options presence: true do
    validates :setter
    validates :area
    validates :memo
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :grade_id
    validates :climb_done_id
  end
end
