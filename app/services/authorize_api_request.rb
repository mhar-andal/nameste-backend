class AuthorizeApiRequest

  def initialize(headers = {})
    @headers = headers
  end

  def self.call(options)
    new(options).call
  end

  def call
    user    
  end

  private

  attr_reader :headers

  def user
    return false unless decoded_auth_token
    User.find(decoded_auth_token[:user_id])
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    return false unless headers['Authorization'].present?
    headers['Authorization'].split(' ').last
  end
end
