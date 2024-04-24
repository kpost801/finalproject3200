class Survey < ApplicationRecord
    has_many :question
    validates :title, :description, presence: true

    accepts_nested_attributes_for :question, allow_destroy: true
end
