# frozen_string_literal: true

class Article < ActiveResource::Base
  self.site = "#{ENV.fetch('ARTICLE_API_URL')}"
  self.collection_name = 'test-articles-v4'

  def thumbnail_url
    self.photos.first.files.small
  end

  def username
    self.user.first_name
  end
end
