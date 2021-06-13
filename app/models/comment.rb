class Comment < ApplicationRecord

  has_many:child_comments,
  class_name: "Comment",
  foreign_key: :parent_comment_id,
  dependent: :destroy
end
