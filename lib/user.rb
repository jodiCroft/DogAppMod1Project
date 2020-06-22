class User < ActiveRecord::Base
    has_many :favorites
    has_many :breeds, through: :favorites
end
    