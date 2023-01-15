# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index; end

  private
    def articles
      @articles ||= Article.all_with_likes
    end

    helper_method :articles
end
