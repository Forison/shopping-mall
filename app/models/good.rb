class Good < ApplicationRecord
    has_many_attached :avatar

    before_save :format_inputs

     validates_presence_of :name
     validates_presence_of :brand
     validates_presence_of :sex
     validates_presence_of :category
     validates_presence_of :description
     validates_presence_of :price
    

    default_scope->{ order(created: :desc)}
    # def thumbnail
    #     self.avatar.each{|c| c.variant(resize: '200 * 200')}
    # end
    private
    def format_inputs
        self.name=name.capitalize
        self.brand=brand.upcase
        self.sex=sex.capitalize
    end
end
