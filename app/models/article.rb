# frozen_string_literal: true

class Article < ActiveResource::Base
  self.site = "#{ENV.fetch('ARTICLE_API_URL')}"
  self.collection_name = 'test-articles-v4'
end
