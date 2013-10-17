class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  before_save :hash_password
  
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true, presence: { on: :create }
  
  def hash_password
    if password_changed?
      write_attribute(:password, BCrypt::Password.create(password))
    end
  end
end
