class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :set_categories

  def switch_locale(&action)
    I18n.with_locale(locale_from_header, &action)
  end

  private

  def locale_from_header
    request.env["HTTP_ACCEPT_LANGUAGE"]&.scan(/^[a-z]{2}/)&.first 
  end

  def set_categories
    @categories = Category.order(name: :asc)
  end

end
