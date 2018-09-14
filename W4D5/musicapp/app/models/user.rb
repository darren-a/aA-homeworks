class User < ApplicationRecord

  #attr_reader :password
  after_initialize :ensure_session_token

  # Write methods to deal with the session token: User::generate_session_token,
  # User#reset_session_token! and User#ensure_session_token.

  # factory method to generate and return new token
  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end


  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user && user.is_password?(password) ? user : nil
  end


  # set it to a new token; save it; return it
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  # lazy load a token if there isn't one
  def ensure_session_token
   self.session_token ||= self.class.generate_session_token
  end


  # Write a User#password=(password) method which actually sets the
  # password_digest attribute using BCrypt, and a User#is_password?(password)
  # method to check the users' password when they log in.

  # override the rails setter method for password (note: we need a attr_reader)
  # so that we don't allow the setting of a password directly, as we will
  # never store passwords in the model
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end
