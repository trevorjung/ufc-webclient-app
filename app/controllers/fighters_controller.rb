class FightersController < ApplicationController

  def index
    @fighters = Fighter.all
  end

  def show
    @fighter = Fighter.find(params[:id])
  end

  def new
  end

  def create
    @fighter = Fighter.create(first_name: params[:first_name], last_name: params[:last_name], weight_class: params[:weight_class], weight: params[:weight], current_record: params[:current_record], current_titles: params[:current_titles], hometown: params[:hometown])
    redirect_to "/fighters/#{@fighter.id}"
  end

  def edit
    @fighter = Fighter.find(params[:id])
    redirect_to "/fighters/#{@fighter.id}"
  end

  def update
    @fighter = Fighter.update(first_name: params[:first_name], last_name: params[:last_name], weight_class: params[:weight_class], weight: params[:weight], current_record: params[:current_record], current_titles: params[:current_titles], hometown: params[:hometown])
    redirect_to "/fighters/#{@fighter.id}"
  end

  def destroy
    @fighter = Fighter.find(params[:id])
    @fighter.destroy 

    redirect_to "/fighters"
  end

end
