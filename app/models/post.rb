# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  validates :content, presence: true

  has_one_attached :image
end
