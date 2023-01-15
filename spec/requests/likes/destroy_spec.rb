# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  include ActiveResourceMocks

  describe 'DELETE /like/:id' do
    subject { delete like_path(params) }
    let(:params) { { id: 123456 } }

    context 'when like is invalid' do
      it 'doesn\t destroy the like' do
        expect do
          subject
        rescue
        end.not_to change { Like.count }
      end

      it 'throws an error' do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when the like exists' do
      let(:articles) { mock_articles }
      let(:like) { Like.create(article_id: articles.first['id']) }
      let(:params) { { id: like.id } }

      before do
        like
      end

      it 'redirects correctly' do
        expect(subject).to redirect_to(root_path)
      end

      it 'successfully deletes the like' do
        expect { subject }.to change { Like.count }.by (-1)
      end
    end
  end
end
