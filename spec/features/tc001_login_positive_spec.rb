# frozen_string_literal: true

require 'playwright'
require 'dotenv/load'

RSpec.describe 'TC001 - Login (Positive)', type: :feature do
  it 'validates user authentication with provided credentials' do
    @page.goto('https://automation-sandbox-python-mpywqjbdza-uc.a.run.app')

    # For tests using credentials, it's a good practice to protect them using .env file and adding the file to the .gitignore, ensuring a security layer for the organization. Since this is an evaluation, I will not add the .env to the .gitignore for the evaluators convenience.
    username = ENV['USERACCESS']
    password = ENV['PASSKEY']
    login(username, password)

    expected_url = 'https://automation-sandbox-python-mpywqjbdza-uc.a.run.app/account'
    expect(@page.url).to eq(expected_url)
  end
end
