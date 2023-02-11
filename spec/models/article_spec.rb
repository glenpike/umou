# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  include ActiveResourceMocks

  let(:subject) { described_class.new() }

  it { should respond_to(:thumbnail_url) }
  it { should respond_to(:username) }
  it { should respond_to(:user_avatar) }

  describe 'all_with_likes' do
    let(:articles) { mock_articles }

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
        articles
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

    context 'performance test 1' do
      let!(:dummy_likes) do
        (1..10000).to_a.each do |i|
          like = Like.new(article_id: i)
          like.save(validate: false)
        end
      end

      before do
        articles.each do |article|
          Like.create(article_id: article['id'])
        end
      end

      it 'all_with_likes' do
        start = Time.now
        Article.all_with_likes
        finish = Time.now

        puts "all_with_likes: #{finish - start}"
      end

      it 'all' do
        start = Time.now
        Article.all
        finish = Time.now

        puts "all: #{finish - start}"
      end

      it 'all_with_each_like' do
        start = Time.now
        Article.all_with_each_like
        finish = Time.now

        puts "all_with_each_like: #{finish - start}"
      end

      it 'all_likes_by_ids' do
        start = Time.now
        Article.all_likes_by_ids
        finish = Time.now

        puts "all_likes_by_ids: #{finish - start}"
      end
    end
  end
end
