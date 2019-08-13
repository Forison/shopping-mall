class Notify < ApplicationRecord
    validates :email, presence: true
end
