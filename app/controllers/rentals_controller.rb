class RentalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rentals = current_user.rentals
    @rentals.each do |rental|
      if rental.canceled?
        break
      elsif rental.end_date < Date.current
        rental.done!
      elsif (rental.end_date >= Date.current) && (rental.start_date <= Date.current)
        rental.ongoing!
      else
        rental.confirmed!
      end
      rental.save!
    end
    @rentals = @rentals.order(:status)
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def create
    @rental = Rental.new(rental_params)
    game = Game.find(params[:game_id])
    @rental.price = (game.price_per_day + (game.price_per_day * (@rental.end_date - @rental.start_date).to_i))
    @rental.price == game.price_per_day if @rental.price == 0
    @rental.user = current_user
    @rental.game = game
    @rental.status = "confirmed"
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

  def cancel
    @rental = Rental.find(params[:id])
    if @rental.canceled!
      redirect_to rentals_path, notice: "La location a été annulée avec succès."
    else
      redirect_to rentals_path, alert: "Impossible d'annuler la location."
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :status, :game_id, :user_id)
  end
end
