class Job < ApplicationRecord
    belongs_to :category
    validates :title, presence: true
    validates :description, presence: true
    validates :company,  presence: true
    validates :url,  presence: true
end
