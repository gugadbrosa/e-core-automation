module Helpers
  def login(username, password)
    @page.fill('input[name="username"]', username)
    @page.fill('input[name="password"]', password)
    @page.click('#btnLogin')
  end
end

RSpec.configure do |config|
  config.include Helpers
end
