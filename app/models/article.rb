# frozen_string_literal: true

class Article < ActiveResource::Base
  self.site = ENV.fetch('ARTICLE_API_URL').gsub(/(.+\/)(.+)\.json/, '\1')
  self.collection_name = ENV.fetch('ARTICLE_API_URL').gsub(/(.+\/)(.+)\.json/, '\2')

  def self.all_with_likes
    likes = Like.all.reduce({}) do |acc, like|
      acc[like.article_id] = like
      acc
    end

    all.each do |article|
      article.like = likes[article.id]
    end
  end

  def thumbnail_url
    self.photos.first.files.medium
  end

  def username
    self.user.first_name
  end
end
