require 'rails_helper'
require 'capybara/rails'

describe "homepage", type: :feature, js: true do
  before do
    Capybara.server_port = 3001
    Capybara.app_host = "http://localhost:3001"
    visit static_pages_home_path
  end

  it "displays the content 'Email Address'" do
    expect(page).to have_content("Email Address")
  end
  it "displays the content 'Password'" do
    expect(page).to have_content("Password")
  end
end
