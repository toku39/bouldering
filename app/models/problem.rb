class Problem < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
  belongs_to :climb_done

  with_options presence: true do
    validates :setter
    validates :area
    validates :memo
  end
    


  with_options numericality: { other_than: 1 } do
    validates :grade_id
    validates :climb_done_id
  end

end
