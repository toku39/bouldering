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
        @problem.setter = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Setter can't be blank")
      end
      it 'areaが空だと投稿できない' do
        @problem.area = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Area can't be blank")
      end
      it 'memoが空だと投稿できない' do
        @problem.memo = ''
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Memo can't be blank")
      end
      it 'imageが空だと投稿できない' do
        @problem.image = nil
        @problem.valid?
        expect(@problem.errors.full_messages).to include("Image can't be blank")
      end
      it 'grade_idは1が選択された場合、投稿できない' do
        @problem.grade_id = 1
        @problem.valid?
        expect(@problem.errors.full_messages).to include('Grade must be other than 1')
      end
      it 'climb_done_idは1が選択された場合、投稿できない' do
        @problem.climb_done_id = 1
        @problem.valid?
        expect(@problem.errors.full_messages).to include('Climb done must be other than 1')
      end
    end

  end
end
