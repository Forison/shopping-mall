class Post < ApplicationRecord
    # belongs_to :user 

    validates :author , presence: true
    validates :headline , presence: true 
    validates :content , presence: true
end
