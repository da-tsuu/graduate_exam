require 'rails_helper'
require "selenium-webdriver"

RSpec.describe 'ユーザー機能', type: :system do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
    FactoryBot.create(:therd_user)
    FactoryBot.create(:post1)
    FactoryBot.create(:post2)
    FactoryBot.create(:post3)
    # visit new_user_session_path
    # fill_in 'メールアドレス', with: 'test1@a.com'
    # fill_in 'パスワード', with: 'hogehoge'
    # click_on 'Log in'
  end

  describe '投稿一覧画面' do
    context '投稿を作成した場合' do
      it '作成済みの投稿が表示されること' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test1@a.com'
        fill_in 'パスワード', with: 'hogehoge'
        click_on 'Log in'
        expect(page).to have_content '卍卍卍'
      end
    end
    context '自分が投稿した投稿ではない場合' do
      it '編集や削除ボタンが表示されないこと' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test2@a.com'
        fill_in 'パスワード', with: 'hogehoge'
        expect(page).to_not have_content 'edit'
        expect(page).to_not have_content 'destroy'
      end
    end
  end
  

end