require 'rails_helper'

describe CommentSerializer do
  subject(:serialized_comment) { described_class.new(comment).to_h }

  let(:comment) { create :comment }

  it { is_expected.to include(body: comment.body) }
  it { is_expected.to include(id: comment.id) }
  it { is_expected.to include(created_at: comment.created_at) }

  describe '#comment' do
    context ' with author' do
      it { is_expected.to include(author: comment.author) }
    end

    context ' without author' do
      let!(:comment) { create :comment, author: nil }

      it { is_expected.to include(author: described_class::ANONYMOUS) }
    end
  end
end
