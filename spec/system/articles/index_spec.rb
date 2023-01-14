# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'articles', type: :system do
  let(:articles_json) { File.read('spec/fixtures/articles.json') }
  let(:articles) { JSON.parse(articles_json) }
  let(:mock) do
    ActiveResource::HttpMock.respond_to do |mock|
      status = 200
      body = articles_json

      mock.get "#{Article.collection_path}",
                { 'Accept' => 'application/json' },
                body, status, {}
    end
  end

  describe 'displaying information' do
    before do
      mock
      visit root_path
    end

    it 'shows a list of articles' do
      articles.each do |article|
        expect(page).to have_content(article['title'].strip)
      end
    end

    it 'has an image for each article' do
      expect(page).to have_selector('img', count: articles.size)
    end

    it 'shows the username for each article' do
      username = 'Lloyd'
      count = Article.all.select { |a| a.user.first_name == username }.count
      expect(page).to have_content(username, count: count)
    end
  end
end
