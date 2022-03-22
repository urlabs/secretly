# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :nullify
  has_many :likes, dependent: :nullify
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  passwordless_with :email
end
