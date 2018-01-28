class AuthenticateUser

  def initialize(email:, password:, username:)
    @email = email
    @password = password
    @username = username
  end

  def self.call(options)
    new(options).call
  end

  def call
    return nil unless user
    JsonWebToken.encode(user_id: user.id)
  end
  
  private

  attr_accessor :email, :password, :username

  def user
    user = User.where(email: email).or(User.where(username: username)).first
    return user if user && user.authenticate(password)
    nil
  end
end
