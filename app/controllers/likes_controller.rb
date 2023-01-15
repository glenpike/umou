# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    article = Article.all.find { |a| a.id == params[:article_id].to_i }

    raise ActiveRecord::RecordNotFound unless article

    Like.create(article_id: article.id)

    redirect_to root_path
  end

  def destroy
    Like.find(params[:id]).destroy

    redirect_to root_path
  end
end
