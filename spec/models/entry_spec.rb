# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Entry, type: :model do
  it '有効なファクトリを持つこと' do
    entry = FactoryBot.create(:entry)
    expect(entry).to be_valid
  end
end
