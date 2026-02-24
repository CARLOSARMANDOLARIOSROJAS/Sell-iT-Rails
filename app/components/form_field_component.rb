# frozen_string_literal: true

class FormFieldComponent < ViewComponent::Base
  def initialize(form:, field:, label:, as: :text_field, select: nil, selectedCategory: nil, options: {})
    @form = form
    @field = field
    @label = label
    @as = as
    @select = select
    @selectedCategory = selectedCategory
    @options = options
  end
end
