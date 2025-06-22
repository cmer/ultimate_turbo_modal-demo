class ModalController < ApplicationController
  before_action :ensure_post_exists
  before_action :set_modal_properties

  def index
  end

  def show
    @header = !(params[:id] == "photo")
  end
end
