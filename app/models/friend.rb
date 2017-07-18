class Friend < ApplicationRecord
    belongs_to :user
    validates_presence_of :first_name, :last_name, :email, :address
end
