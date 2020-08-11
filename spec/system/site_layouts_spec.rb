#require 'rails_helper'

RSpec.describe 'site layout', type: :system do
  context 'ルートパスにアクセスしている' do
    before { visit root_path }
    subject { page }
    it 'ルートパスに指定したパスが存在する' do
      is_expected.to have_link 'Twitterアカウントでログイン', href: user_twitter_omniauth_authorize_path
    end
  end
end
      
      #is_expected.to have_link 'Help', href: help_path
      #is_expected.to have_link 'About', href: about_path