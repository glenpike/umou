# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:subject) { described_class.new() }

  it { should respond_to(:thumbnail_url) }
  it { should respond_to(:username) }

  describe 'all_with_likes' do
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

    context 'when nothing is liked' do
      it 'should return the articles with each like set to nil' do
        Article.all_with_likes.each do |article|
          expect(article.like).to be(nil)
        end
      end
    end

    context 'when the first article is liked' do
      let(:like) { Like.create(article_id: articles.first['id']) }

      before do
        like
      end

      it 'should return the articles with the first one liked' do
        Article.all_with_likes.each_with_index do |article, index|
          if index == 0
            expect(article.like.id).to be(like.id)
          else
            expect(article.like).to be(nil)
          end
        end
      end
    end
  end
end
