require 'rails_helper'

RSpec.describe ProjectsController do
  it 'routes the home page to projects#index' do
    expect(get: '/').to route_to('projects#index')
  end

  it 'generates / for root_path' do
    expect(root_path).to eq('/')
  end
end