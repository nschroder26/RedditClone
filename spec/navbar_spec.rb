require 'rails_helper'
require 'capybara/rails'

describe "homepage", type: :feature, js: true do
  before do
    Capybara.server_port = 3001
    Capybara.app_host = "http://localhost:3001"
    visit static_pages_home_path
  end

  it "displays the navbar" do
    expect(page).to have_content("tiddeR")
    expect(page).to have_content("Home")
  end
end
