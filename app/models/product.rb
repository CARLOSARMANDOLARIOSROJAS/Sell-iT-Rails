class Product < ApplicationRecord
  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }


  def display_photo
    return unless photo.attached?

    photo.variant(format: :jpg, resize_to_limit: [300, 300]).processed
  end

end
