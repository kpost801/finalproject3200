class Question < ApplicationRecord
  belongs_to :survey
  has_many :options
  accepts_nested_attributes_for :options, allow_destroy: true
end
