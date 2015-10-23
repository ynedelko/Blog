class Post < ActiveRecord::Base
  acts_as_taggable
  has_many :comments
  belongs_to :user
  validates :title, :presence => true
  validates :text, :presence => true
end
