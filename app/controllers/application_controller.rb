class ApplicationController < ActionController::Base
  include SetFlavor

  def set_modal_properties
    @padding = !(params[:padding] == "0")
    @advance = params[:advance] == "1"
    @override_url = "/custom-advance-history-url" if @advance
  end
end
