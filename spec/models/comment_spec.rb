require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'contentが空ならバリデーションが通らない' do
    comment = Comment.new(message: '')
    expect(comment).not_to be_valid
  end

  it 'contentに内容が記載されていればバリデーションが通る' do
    comment = Comment.new(message: '成功')
    expect(comment).to be_valid
  end
end
