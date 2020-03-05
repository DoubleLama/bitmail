class EmailsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @emails = Email.all
  end

  def new
    @emails = Email.all
  end

  def show
    @email = Email.find(params[:id])
    @email.read = true
    @email.save
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def create
    @email = Email.new(object:Faker::Book.title,body:Faker::Hipster.paragraphs[0])
    if @email.save
      respond_to do |format|
      format.html { }
      format.js { }
    end
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def update
    @email = Email.find(params[:id])
    @email.update(read: !@email.read)
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end
end
