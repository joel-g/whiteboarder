require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :hashed_password, presence: true
  has_many :feedbacks, through: :interviews
  has_many :interviews, class_name: 'Interview', foreign_key: 'applicant_id'



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

  def self.authenticate(username, password)
    user = self.find_by(username: username)
    if user.authenticate(password)
      user
    else
      nil
    end
  end


end
