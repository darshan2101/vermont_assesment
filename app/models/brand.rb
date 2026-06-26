class Brand < ApplicationRecord
    has_many :products

    CATEGORY =  %w[beer wine spirits soft_drink juice ]
    
    validates :name, presence: true, uniqueness: true
    validates :country_of_origin, presence: true
    validates :category, presence: true, inclusion: { in: CATEGORY}


    
end
