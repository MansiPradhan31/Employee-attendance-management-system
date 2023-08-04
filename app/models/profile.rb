class Profile < ApplicationRecord
    belongs_to :employee

    validates :image_url, presence: true
end
