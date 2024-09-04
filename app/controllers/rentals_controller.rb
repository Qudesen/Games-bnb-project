class RentalsController < ApplicationController

  def index
    @rentals = current_user.rentals
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def create
    @rental = Rental.new(rental_params)
    game = Game.find(params[:game_id])
    @rental.price = (game.price_per_day * (@rental.end_date - @rental.start_date).to_i)
    @rental.user = current_user
    @rental.game = game
    if @rental.save!
      redirect_to rental_path(@rental)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @rental = Rental.find(params[:id])
  end

  def update
    @rental = Rental.find(params[:id])
    if @rental.update!(rental_params)
      redirect_to rental_path(@rental)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    redirect_to rentals_path, status: :see_other
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :status, :game_id, :user_id)
  end
end
