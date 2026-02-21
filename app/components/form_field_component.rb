# frozen_string_literal: true

class FormFieldComponent < ViewComponent::Base
  def initialize(form:, field:, label:, as: :text_field, options: {})
    @form = form
    @field = field
    @label = label
    @as = as
    @options = options
  end
end
