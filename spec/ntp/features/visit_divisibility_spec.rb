require 'features_helper'

describe 'visit divisibility' do
  it 'is successful' do
    visit '/ntp/divisibility'
    expect(page).to have_content 'divisibility'
  end

  it 'can trigger the dynamic example' do
    expect(page).to_not have_content '111 divides 666'

    within 'form#divisibility-example' do
      fill_in 'divisor', with: '111'
      fill_in 'dividend', with: '666'
      click_button 'submit'
    end

    expect(page).to have_content '111 divides 666'
  end
end

