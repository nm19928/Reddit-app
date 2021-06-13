class Post < ApplicationRecord
  validates :title, uniqueness: {message:"Title already taken"}

  has_many:post_subs,
  inverse_of: :post

  has_many:subs,
  through: :post_subs

  belongs_to:user,
  class_name: "User",
  primary_key: :username,
  foreign_key: :username

  has_many:comments,
  dependent: :destroy

end
