class User < ApplicationRecord
    attr_accessor :remember_token , :activation_token
    before_create :create_activation_digest
    has_many :posts
    before_save { self.email = email.downcase }

    validates :name , presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false}, 
    format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    validates :password , presence: true
    validates :password_confirmation , presence: true
    
    #for encrypting a string
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    #to generate a random mix of strings 
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    #to update the remember_digest of the table with encrypted random string  
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest , User.digest(remember_token))
    end
    #return true if remember digest value is equal to remember token
    def authenticated?(attribute, token)
        digest = self.send("#{attribute}_digest")
        return false if remember_digest.nil?
        BCrypt::Password.new(digest).is_password?(remember_token)
    end
    # Forgets a user.
    def forget
      update_attribute(:remember_digest, nil)
    end

    #begin activation implementation
        # Creates and assigns the activation token and digest.
    def create_activation_digest
        self.activation_token  = User.new_token
        self.activation_digest = User.digest(activation_token)
    end
end
