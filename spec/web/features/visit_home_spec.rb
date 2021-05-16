require 'features_helper'

describe 'visit home' do
  it 'is successful' do
    visit '/'
    expect(page).to have_content 'its computers'
  end
end

