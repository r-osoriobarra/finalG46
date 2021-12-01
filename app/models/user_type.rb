class UserType < ApplicationRecord
    has_many :users
    enum name: [:admin, :founder, :entrepeneur]
end
