module AuthHelpers
  def sign_in(user)
    post login_path, params: { username: user.username, password: user.password }
  end
end

RSpec.configure do |config|
  config.include AuthHelpers, type: :request
end
