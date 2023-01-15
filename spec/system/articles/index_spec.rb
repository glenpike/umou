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
      expect(page).to have_selector('img.article__thumbnail', count: articles.size)
    end

    it 'shows the username for each article' do
      username = 'Lloyd'
      count = Article.all.select { |a| a.user.first_name == username }.count
      expect(page).to have_content(username, count: count)
    end
  end

  describe 'sorting' do
    it 'no sorting by default' do
      visit root_path
      within('.article', match: :first) do
        expect(page).to have_content('Ambipur air freshener plugin')
      end
    end

    it 'default sort for invalid param' do
      visit root_path({ sort: 'invalid' })
      within('.article', match: :first) do
        expect(page).to have_content('Ambipur air freshener plugin')
      end
    end

    it 'default sort link works' do
      visit root_path
      click_link('Default')
      within('.article', match: :first) do
        expect(page).to have_content('Ambipur air freshener plugin')
      end
    end

    it 'title sort link works' do
      visit root_path
      click_link('Title')
      within('.article', match: :first) do
        expect(page).to have_content('1 x Book with baby name, only puctured names available')
      end
    end

    it 'closest sort link works' do
      visit root_path
      click_link('Distance (closest first)')
      within('.article', match: :first) do
        expect(page).to have_content('Epson Stylus Printer Cartridges')
      end
    end

    it 'popular sort link works' do
      visit root_path
      click_link('Most popular')
      within('.article', match: :first) do
        expect(page).to have_content('Lampshades & flowers')
      end
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
