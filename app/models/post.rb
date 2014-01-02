class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
  validates :slug, presence: true
end
