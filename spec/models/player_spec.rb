require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { FactoryBot.create(:player) }
  
  it '有効なファクトリを持つこと' do
    expect(player).to be_valid
  end
end
