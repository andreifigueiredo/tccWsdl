class ApplicationController < ActionController::Base

  before_filter :set_locale

   private

   def set_locale
      I18n.locale = 'pt'
   end
  # around_action :switch_locale

  # def switch_locale(&action)
  #   locale = params[:locale] || I18n.default_locale
  #   I18n.with_locale(locale, &action)
  # end
end
