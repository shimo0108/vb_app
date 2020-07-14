require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) { FactoryBot.create(:team) }
  
  it '有効なファクトリを持つこと' do
    expect(team).to be_valid
  end
end
