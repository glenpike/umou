# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:subject) { described_class.new() }

  it { should respond_to(:thumbnail_url) }
  it { should respond_to(:username) }
end
