require 'rails_helper'

RSpec.describe Problem, type: :model do
  before do
    @problem = FactoryBot.build(:problem)
  end

  describe '課題投稿' do
    context '課題投稿できるとき' do
      it 'setter, area, memo, image, grade_id, climb_done_idの値が存在すれば投稿できる' do
        expect(@problem).to be_valid
      end
    end
    context '課題投稿できないとき' do
      it 'setterが空だと投稿できない' do
      end
      it 'areaが空だと投稿できない' do
      end
      it 'memoが空だと投稿できない' do
      end
      it 'imageが空だと投稿できない' do
      end
      it 'grade_idは1が選択された場合、投稿できない' do
      end
      it 'climb_done_idは1が選択された場合、投稿できない' do
      end
    end

  end
end
