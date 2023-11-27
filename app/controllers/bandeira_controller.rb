class BandeiraController < ApplicationController
    def index
        I18n.locale = params["i18n"]
        session["locale"] = I18n.locale
        redirect_to "/"
    end
end
