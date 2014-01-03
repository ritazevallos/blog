class Post < ActiveRecord::Base
  belongs_to :category
  extend FriendlyId
  friendly_id :title, use: :slugged
  default_scope -> { order('created_at DESC') }

  validates :title, presence: true, uniqueness: true
  validates_presence_of :content, :slug, :category_id

end
