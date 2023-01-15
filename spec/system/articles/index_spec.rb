# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'articles', type: :system do
  include ActiveResourceMocks

  let(:articles) { mock_articles }

  describe 'displaying information' do
    before do
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

  describe 'liking an article' do
    context 'when there are no likes' do
      before do
        visit root_path
      end

      it 'shows the buttons' do
        expect(page).to have_selector('.article__like-button', count: articles.size)
        expect(page).not_to have_selector('.article__like-button--liked')
      end

      it 'allows me to like the first article' do
        within('.article', match: :first) do
          click_on('Like')
          expect(page).to have_selector('.article__like-button--liked', count: 1)
        end
      end
    end

    context 'when an article is liked' do
      let(:like) { Like.create(article_id: articles.first['id']) }

      before do
        like
        visit root_path
      end

      it 'shows the like' do
        within('.article', match: :first) do
          expect(page).to have_selector('.article__like-button--liked')
        end
      end

      it 'allows me to unlike it' do
        click_on('Unlike')
        expect(page).to have_selector('.article__like-button', count: articles.size)
      end
    end
  end
end
