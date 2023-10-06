class List < ApplicationRecord
  has_many :bookmark
  has_many :movies, through: :bookmark
  has_one_attached :photo

  validates :name, uniqueness: true
end
