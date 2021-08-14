require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できるとき' do
      it 'textの値が存在すればコメント投稿できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメント投稿できないとき' do
      it 'textが空だとコメント投稿できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userと紐付いてないとコメント投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'problemと紐付いてないとコメント投稿できない' do
        @comment.problem = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Problem must exist')
      end
    end

    
  end
end
