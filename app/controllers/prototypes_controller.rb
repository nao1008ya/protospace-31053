class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @prototypes = Prototype.all
  end

  def new
    # からの投稿ページを作成。
    @prototype = Prototype.new
  end

  def create
    # 投稿後すぐにsaveにて保存する。validetesが絡むと必ずこのような記述になる。
    # if文を用いてページのアクセスを設定する。
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    # ルーティングからきてモデルから受け取ったparamsをviewsに流すその後updateへ
    # その為、インスタンス変数である@つける
    
    # 投稿者以外のユーザーが、投稿者専用のページに遷移できないように
    unless @prototype.user.id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    # updateで完結する為、@必要なし
    # 投稿後すぐにupdateにて更新する。validetesが絡むと必ずこのような記述になる。
    # if文を用いてページのアクセスを設定する。
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path(prototype.id)
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
