class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  # POST /comments
  def create
    # Создаём объект @new_comment из @event
    @new_comment = @post.comments.build(comment_params)

    if @new_comment.save
      # Если сохранился, редирект на страницу самого события
      redirect_to @post, notice: I18n.t('controllers.comments.created')
    else
      # Если ошибки — рендерим здесь же шаблон события (своих шаблонов у коммента нет)
      render 'posts/show', alert: I18n.t('controllers.comments.error')
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body, :user_name)
  end
end
