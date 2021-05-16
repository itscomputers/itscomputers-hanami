require 'features_helper'

describe 'visit divisibility' do
  it 'is successful' do
    visit '/ntp/divisibility'
    expect(page).to have_content 'divisibility'
  end
end

