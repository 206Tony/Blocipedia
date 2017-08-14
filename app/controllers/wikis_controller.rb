class WikisController < ApplicationController
  include WikisHelper
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to wiki_path
    else
      flash.now[:alert] = "There was an error saving your wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])  
    authorize @wiki

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to action: :index 
    else
      flash[:error] = "There was an error deleting your wiki."
      render :show
    end
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user
    authorize @wiki if @wiki.private == true

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was a error saving your wiki. Please try again."
      render :new
    end
  end

    private

  def user_not_authorized
    flash[:alert] = "You are not worthy."
    redirect_to root_path
  end

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
