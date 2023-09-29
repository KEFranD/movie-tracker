class List < ApplicationRecord
  has_many :bookmark
  has_many :movies, through: :bookmark

  validates :name, uniqueness: true
end
