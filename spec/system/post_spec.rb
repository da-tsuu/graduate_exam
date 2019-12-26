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
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test1@a.com'
    fill_in 'パスワード', with: 'hogehoge'
    click_on 'Log in'
  end

  describe '投稿一覧画面' do
    context '投稿を作成した場合' do
      it '作成済みの投稿が表示されること' do
        expect(page).to have_content '卍卍卍'
      end
    end
    context '自分が投稿した投稿ではない場合' do
      it '編集や削除ボタンが表示されないこと' do
        click_on 'ログアウト'
        sleep(1)
        fill_in 'メールアドレス', with: 'test2@a.com'
        fill_in 'パスワード', with: 'hogehoge'
        click_on 'Log in'
        expect(page).to_not have_content 'edit'
        expect(page).to_not have_content 'destroy'
      end
    end
    context '自分が投稿した投稿の場合' do
      it 'お気に入りボタンが表示されないこと' do
        expect(page).to_not have_content 'お気に入りする'
      end
    end
    context '他人が投稿した投稿の場合' do
      it 'お気に入りボタンが表示されること' do
        click_on 'ログアウト'
        sleep(1)
        fill_in 'メールアドレス', with: 'test2@a.com'
        fill_in 'パスワード', with: 'hogehoge'
        click_on 'Log in'
        expect(page).to have_content 'お気に入りする'
      end
    end
    context 'お気に入りボタンが押された場合' do
      it 'お気に入りに登録されること' do
        click_on 'ログアウト'
        sleep(1)
        fill_in 'メールアドレス', with: 'test2@a.com'
        fill_in 'パスワード', with: 'hogehoge'
        click_on 'Log in'
        all(:id, 'favorite_button')[0].click_on
        expect(page).to have_content 'お気に入り解除する'
      end 
    end  
  end 
  describe '投稿検索機能' do
    context '検索窓にキーワードを入れて検索した場合' do
      it '該当のものだけが表示されること' do
        find("#search_bar").set("卍卍卍")
        click_on '検索'
        expect(page).to have_content '卍卍卍'
        expect(page).to_not have_content 'VIDEOVIDEO'
        expect(page).to_not have_content 'MANIAMANIA'
      end
    end
  end
end