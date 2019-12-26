require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'contentが空ならバリデーションが通らない' do
    post = Post.new(content: '')
    expect(post).not_to be_valid
  end

  it 'contentに内容が記載されていればバリデーションが通る' do
    post = Post.new(content: '成功')
    expect(post).to be_valid
  end
end 