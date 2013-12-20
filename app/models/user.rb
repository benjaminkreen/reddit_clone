class User < ActiveRecord::Base
  attr_accessible :email, :password
  attr_reader :password

  before_validation :ensure_token
  validates :password, :length => { :minimum => 6 }, :on => :create
  validates :email, :presence => true

  has_many :links
  has_many :subs

  def self.generate_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    if user && user.is_password?(password)
      return user
    else
      nil
    end
  end

  def reset_token!
    self.token = self.class.generate_token
    self.save!
    self.token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_token
    self.token ||= self.class.generate_token
  end
end
