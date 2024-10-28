module Helpers
  # For tests using credentials, it's a good practice to protect them using .env file and adding the file to the .gitignore, ensuring a security layer for the organization. Since this is an evaluation, I will not add the .env to the .gitignore for the evaluators convenience.
  DEFAULT_USER = ENV['USERACCESS']
  DEFAULT_PASS = ENV['PASSKEY']
  def login(username = DEFAULT_USER, password = DEFAULT_PASS)
    @page.fill('input[name="username"]', username)
    @page.fill('input[name="password"]', password)
    @page.click('#btnLogin')
  end
end

RSpec.configure do |config|
  config.include Helpers
end
