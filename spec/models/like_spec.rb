# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:subject) { described_class.new() }

  it { should respond_to(:article_id) }
  it { should respond_to(:article) }

  it 'belongs_to an article' do
    expect(described_class.reflect_on_association(:article).macro).to eq(:belongs_to)
  end
end
