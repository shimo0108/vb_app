require 'rails_helper'

RSpec.describe "User認証", type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, nickname: "") }

  describe 'ユーザー作成' do
   
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end

      it 'createが成功すること' do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by 1
      end

      it 'リダイレクトされること' do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to users_path
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.status).to eq 200
      end

      it 'createが失敗すること' do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.to_not change(User, :count)
      end

      it 'エラーが表示されること' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.body).to include '新規登録'
      end
    end
  end

  describe 'show' do
    context "userが認証されている" do
      before do
        @user = FactoryBot.create(:user)
        
      end
      it "正常なレスポンスが返る" do
        sign_in @user
        get user_path((@user.id))
        expect(response).to be_successful
      end

      it "200レスポンスが返る" do
        sign_in @user
        get user_path((@user.id))
        expect(response).to have_http_status "200"
      end
    end

    context "不正なユーザーのアクセス" do
      before do
        @user = FactoryBot.create(:user)
      end
      it "正常なレスポンスが返る" do
        get user_path((@user.id))
        expect(response).to_not be_successful
      end

      it "302レスポンスが返る" do
        get user_path((@user.id))
        expect(response).to have_http_status "302"
      end

      it "不正なアクセスがリダイレクトされる" do
        get user_path((@user.id))
        expect(response).to redirect_to "/users/sign_in"
      end
    end           
  end
end