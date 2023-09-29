class Movie < ApplicationRecord
  has_many :bookmark

  validates :name, uniqueness: true
  validates :description, uniqueness: true
end
