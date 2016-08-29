class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :channels, through: :subscriptions

  validates :email, :hashed_password, presence: { message: "You must include an email and a password."}
  validates :email, uniqueness: { message: "This email is already in use. Please recover your email. "}

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(password)
    self.password == password
  end

end
