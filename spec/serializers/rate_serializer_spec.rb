require 'rails_helper'

describe RateSerializer do
  subject(:serialized_rate) { described_class.new(rate).to_h }

  let(:rate) { build(:rate) }

  it { is_expected.to include(id: rate.id) }
  it { is_expected.to include(vote: rate.vote) }
end
