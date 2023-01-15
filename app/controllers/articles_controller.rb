# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index; end

  private
    def articles
      @articles ||= Article.all_with_likes

      case params[:sort]
      when 'title'
        @articles.sort { |a, b| a.title <=> b.title }
      when 'closest'
        @articles.sort { |a, b| a.location.distance <=> b.location.distance }
      when 'popular'
        @articles.sort { |a, b| a.reactions.views <=> b.reactions.views }
      else
        @articles
      end
    end

    helper_method :articles
end
