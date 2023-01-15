# frozen_string_literal: true

module ActiveResourceMocks
  def mock_articles(articles_json = nil)
    articles_json ||= File.read('spec/fixtures/articles.json')

    ActiveResource::HttpMock.respond_to do |mock|
      status = 200
      body = articles_json

      mock.get "#{Article.collection_path}",
                { 'Accept' => 'application/json' },
                body, status, {}
    end

    JSON.parse(articles_json)
  end
end
