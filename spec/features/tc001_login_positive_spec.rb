# frozen_string_literal: true

require 'playwright'
require 'dotenv/load'

RSpec.describe 'TC001 - Login (Positive)', type: :feature do
  it 'validates user authentication with provided credentials' do
    @page.goto('https://automation-sandbox-python-mpywqjbdza-uc.a.run.app')

    login

    expected_url = 'https://automation-sandbox-python-mpywqjbdza-uc.a.run.app/account'
    expect(@page.url).to eq(expected_url)
  end
end
