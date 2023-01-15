# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  include ActiveResourceMocks

  describe 'POST /likes' do
    subject { post likes_path, params: params }
    let(:params) { { article_id: 123456 } }

    context 'when article is invalid' do
      it 'doesn\t create the like' do
        expect do
          subject
        rescue
        end.not_to change { Like.count }
      end

      it 'throws an error' do
        expect { subject }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when the article exists' do
      let(:articles) { mock_articles }
      let(:params) { { article_id: articles.first['id'] } }

      it 'redirects correctly' do
        expect(subject).to redirect_to(root_path)
      end

      it 'successfully creates the like' do
        expect { subject }.to change { Like.count }.by(1)
      end
    end
  end
end
