require 'rails_helper'

RSpec.feature 'Projects' do
  scenario 'Visiting the home page' do
    visit '/'

    expect(page).to have_text('Simple Todo Lists')
  end
end