module Comments
  module Entities
    class Comment < ApplicationRecord
      belongs_to :commentable, polymorphic: true
    end
  end
end