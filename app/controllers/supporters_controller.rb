class SupportersController < ApplicationController
  before_action :find_supporter, only: [:show, :edit, :update, :destroy, :update_done]

  def index
    @search_term = params[:search]
    @supporters  = Supporter.paginate(page: params[:page], per_page:10).
                             order(:done)
    if params[:search]
      @supporters = @supporters.wildcard_search(@search_term)
    end
  end


  def new
    @supporter = Supporter.new
  end

  def create
    @supporter = Supporter.new supporter_params
    if @supporter.save
      redirect_to @supporter, notice: notice_creator('created')
    else
      @supporter.errors.full_messages.each do |message|
        flash.now[:alert] = message
      end
      render :new
    end
  end



  def show
  end


  def edit
  end

  def update
    if @supporter.update supporter_params
      redirect_to @supporter, notice: notice_creator('updated')
    else
      @supporter.errors.full_messages.each do |message|
        flash.now[:alert] = message
      end
      render :edit
    end
  end

  def destroy
    if @supporter.destroy
      redirect_to supporters_path, notice: notice_creator('deleted')
    else
      flash.now[:alert] = notice_creator('delete', false)
      render :show
    end
  end

  # def update_done
  #   @supporter.done = !@supporter.done
  #   @supporter.save
  #   redirect_to supporters_path, notice: notice_creator('updated')
  # end

  # def search
  #   @search_term = params[:search]
  #   @supporters = Supporter.wildcard_search(@search_term).
  #                           paginate(page: params[:page], per_page:10).
  #                           order(:done)
  # end


  private

  def supporter_params
    new_supporter = params.require(:supporter).permit(:name, :email, :message, :department, :done)
    new_supporter[:department] = params[:department]
    new_supporter

  end

  def find_supporter
    @supporter = Supporter.find params[:id]
  end

  def notice_creator(action, success=true)
    "#{@supporter.name} "+action+(success ? " successfully." : "failure.")
  end
end
