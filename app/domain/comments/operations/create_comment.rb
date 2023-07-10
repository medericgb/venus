module Comments
  module Operations
    class CreateComment
      include Interactor

      def call
        context.comment = repo.create_comment(comment_params: context.comment_params)
        raise context.comment.inspect
      rescue => e
        context.fail!(errors: "create_comment_error: #{e.message}")
      end

      private
      def repo
        Comments::Repositories::Comment.new
      end
    end
  end
end