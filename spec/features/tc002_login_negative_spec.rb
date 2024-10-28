# frozen_string_literal: true

require 'playwright'

RSpec.describe 'TC002 - Login (Negative)', type: :feature do
  before(:each) do
    @page.goto('https://automation-sandbox-python-mpywqjbdza-uc.a.run.app')
  end

  shared_examples 'invalid login' do |username, password|
    it "denies login for username: #{username} and password: #{password}" do
      login(username, password)

      error_message = @page.locator('text=Wrong username or password').text_content.strip
      expect(error_message).to eq('Wrong username or password.')
    end
  end

  login_credentials = [
    { username: 'Demouser', password: 'abc123' },
    { username: 'demouser_', password: 'xyz' },
    { username: 'demouser', password: 'nananana' },
    { username: 'demouser', password: 'abc123' }
  ]

  login_credentials.each do |credentials|
    include_examples 'invalid login', credentials[:username], credentials[:password]
  end
end
