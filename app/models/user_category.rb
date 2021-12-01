class UserCategory < ApplicationRecord
    has_many :users, dependent: :destroy
end
