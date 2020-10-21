class CommentsController < ApplicationController
  def create
    # 投稿後すぐにsaveにて保存する。validetesが絡むと必ずこのような記述になる。
    # if文を用いてページのアクセスを設定する。
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype) 
      # 今回の実装には関係ありませんが、このようにPrefixでパスを指定することが望ましいです。
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show" 
      # views/prototypes/show.html.erbのファイルを参照しています。
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
