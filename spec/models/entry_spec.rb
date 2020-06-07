require 'rails_helper'

RSpec.describe Entry, type: :model do

  example '有効なファクトリを持つこと' do
    entry = FactoryBot.create(:entry)
    expect(entry).to be_valid
    binding.pry
  end
  
end
