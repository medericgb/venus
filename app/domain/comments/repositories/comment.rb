module Comments
  module Repositories
    class Comment

      def create_comment(comment_params:)
        entity.create(comment_params)
      end
      
      private
      def entity
        Comments::Entities::Comment
      end
    end
  end
end