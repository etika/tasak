class Strength < ApplicationRecord
  belongs_to :router
  validates_presence_of :strength
end
