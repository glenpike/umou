class LikesController < ApplicationController
  def create
    Like.create(article_id: params[:article_id])

    redirect_to root_path
  end

  def destroy
    Like.find(params[:id]).destroy

    redirect_to root_path
  end
end
