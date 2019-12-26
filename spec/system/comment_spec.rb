require 'rails_helper'
require "selenium-webdriver"

RSpec.describe 'コメント投稿機能', type: :system do
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
    all(:id, 'show_button')[0].click_on
  end

  describe 'コメント画面' do
    context 'コメントを作成した場合' do
      it '作成済みのコメントが表示されること' do
        find(".input").set("シュウマイ")
        click_on 'コメントをする'
        expect(page).to have_content 'シュウマイ'
      end
    end
    context 'コメントを編集した場合' do
      it '内容が反映されること' do
        find(".input").set("シュウマイ")
        click_on 'コメントをする'
        sleep(1)
        click_on 'コメントを編集する'
        page.all("#edit_comment")[0].set("餃子")
        click_on '編集する'
        expect(page).to_not have_content 'シュウマイ'
        expect(page).to have_content '餃子'
      end
    end
    context 'コメントを削除した場合' do
      it '内容が削除されること' do
        find(".input").set("シュウマイ")
        click_on 'コメントをする'
        sleep(1)
        click_on 'コメントを削除する'
        expect(page).to_not have_content 'シュウマイ'
      end
    end 
  end
end