class User < ActiveRecord::Base
  has_many :todo_lists
  has_secure_password

  validates :email, presence: true, 
                    uniqueness: true,
                    format: {
                      with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
                    }

  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end
end
