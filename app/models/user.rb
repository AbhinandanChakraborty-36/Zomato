class User < ApplicationRecord
    after_initialize :set_defaults, unless: :persisted?

    has_secure_password

    has_many :reviews, dependent: :destroy
    has_many :ords, dependent: :destroy
    has_many :books, dependent: :destroy
    validates :email, presence:true, uniqueness:true,format:{with: /\A\S+@.+\.\S+\z/ }
    validates :password, presence:true
    
    def set_defaults
        self.isadmin= false if self.isadmin.nil?
    end
end
