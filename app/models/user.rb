class User < ActiveRecord::Base
    has_secure_password
    has_many :reviews

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email,
      presence: true, uniqueness: true
    validates :password, confirmation: true
    validates :password_confirmation,
      presence: true, length: { minimum: 8 }

      def authenticate_with_credentials (email, password)
        found_user = User.find_by_email(email.downcase)
        if found_user && found_user.authenticate(password)
          true
        else
          false
        end
      end
    
      private
      def downcase_email
        if (email != nil)
          email = email.downcase
        end
      end
    
end
