class LinksController < ApplicationController
  def index
    @links = Link.order('created_at DESC')
  end

  def show
    @link = Link.find_by_short_name(params[:short_name])

    if @link
      redirect_to @link.url
    else
      render text: "No such link.", status: 404
    end
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to root_url, notice: 'Link was successfully created.'
    else
      render :new
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end
end
