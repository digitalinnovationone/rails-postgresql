class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_locale

    private 
    def set_locale
        I18n.locale = session["locale"].present? ? session["locale"] : I18n.default_locale
    end
end
