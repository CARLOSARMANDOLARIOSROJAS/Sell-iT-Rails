class ProductCardComponent < ViewComponent::Base
  def initialize(product:, show_actions: false, editing: true)
    @product = product
    @show_actions = show_actions
    @editing = editing
  end
end
