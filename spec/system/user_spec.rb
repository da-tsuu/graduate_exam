require 'rails_helper'
require "selenium-webdriver"

RSpec.describe 'ユーザー機能', type: :system do
  before do
    FactoryBot.create(:user)
    FactoryBot.create(:second_user)
    FactoryBot.create(:therd_user)
  end

  describe 'ログイン機能' do
    context '必要項目を入力した場合' do
      it 'アカウントを作成できること' do
        visit new_user_registration_path

        fill_in 'Username', with: 'aaaaa'
        fill_in 'メールアドレス', with: 'aaa@aaa.aaa'
        fill_in 'パスワード', with: 'hogehoge'
        fill_in '確認用パスワード', with: 'hogehoge'
        click_on 'Sign up'
        expect(page).to have_content 'Posts'
      end
      it 'ログインできること' do
        visit new_user_session_path

        fill_in 'メールアドレス', with: 'test1@a.com'
        fill_in 'パスワード', with: 'hogehoge'
        click_on 'Log in'
        expect(page).to have_content 'Posts'
      end
    end
  end
    context 'ログインしていない場合' do 
      it 'root_pathなどには行けずにログイン画面に遷移すること' do
        visit posts_path
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
      end
    end
  end