require 'rails_helper'

RSpec.describe CommentSerializer do
  subject { described_class.new(comment).to_h }

  let(:comment) { build :comment }

  it { is_expected.to include(body: comment.body) }
  it { is_expected.to include(id: comment.id) }
  it { is_expected.to include(created_at: comment.created_at) }

  describe '#author' do
    context 'when comment with author is present' do
      it { is_expected.to include(author: comment.author) }
    end

    context 'when comment with author is nil' do
      let(:comment) { build :comment, author: nil }

      it { is_expected.to include(author: described_class::ANONYMOUS) }
    end
  end
end
