# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :article

  def article
    Article.all.find { |a| a.id == article_id }
  end
end
