require 'rails_helper'

describe ProductSerializer do
  subject(:serialized_product) { described_class.new(product).to_h }
  
  let(:product) { create :product }
  
  it do
    is_expected.to include(
      id: product.id,
      name: product.name,
      quantity: product.quantity
    )
  end
end