class Product < ApplicationRecord
  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :category, optional: false

  def display_photo
    return unless photo.attached?

    photo.variant(format: :jpg, resize_to_limit: [300, 300]).processed
  end

  def displayable_title
    title.length > 15 ? "#{title[0..9]}..." : title
  end

  def displayable_photo_name
    return unless photo.attached?

    photo.filename.to_s.length > 20 ? "#{photo.filename.to_s[0..15]}..." : photo.filename.to_s
  end

  def photo_present?
    photo.attached?
  end

  private

end
