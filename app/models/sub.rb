class Sub < ApplicationRecord
validates :title, uniqueness: {message:"Title already taken"}

belongs_to:user,
class_name: "User",
primary_key: :username,
foreign_key: :moderator

has_many:post_subs,
dependent: :destroy

has_many:posts,
through: :post_subs

end
