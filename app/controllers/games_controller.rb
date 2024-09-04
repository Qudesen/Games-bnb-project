class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :authorized_user!, only: [:edit, :update, :destroy]
  def index
    @games = Game.all
    @rental = Rental.new
  end

  def show
    @rental = Rental.new
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    user = User.find(current_user.id)
    @game.user_id = user.id
    if @game.save
      redirect_to games_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @game.update!(game_params)
      redirect_to games_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path, status: :see_other
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :description, :price_per_day, :address, :user_id)
  end
  def authorized_user!
    unless @game.user == current_user
      redirect_to games_path
    end
  end
end
