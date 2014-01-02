class Post < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
end
