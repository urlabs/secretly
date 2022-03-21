# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates :content, presence: true

  has_one_attached :image
end
