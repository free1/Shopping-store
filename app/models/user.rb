class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password

  before_save :create_remember_token
  after_destroy :ensure_an_admin_remains

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

  	def create_remember_token
  		self.remember_token = SecureRandom.urlsafe_base64
  	end

    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can not delete last user"
      end
    end
end
