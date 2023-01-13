# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'articles', type: :system do
  let(:articles) { File.read('spec/fixtures/articles.json') }
  let(:mock) do
    ActiveResource::HttpMock.respond_to do |mock|
      status = 200
      body = articles

      mock.get "#{Article.collection_path}",
                { 'Accept' => 'application/json' },
                body, status, {}
    end
  end

  it 'can show a list of articles' do
    mock
    visit root_path

    JSON.parse(articles).each do |article|
      expect(page).to have_content(article['title'])
    end
  end
end
