class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :authorized_user!, only: [:edit, :update, :destroy]

  def index
    @rental = Rental.new
    if params[:search].present?
      @games = Game.all
      params[:search].split(' ').each do |search|
        @games = @games.where("name ILIKE ? OR description ILIKE ? OR address ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
      end
    else
      @games = Game.all
    end
  end

  def my_games
    @my_games = current_user.games

  end

  def show
    @rental = Rental.new
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    @user = User.find(current_user.id)
    @game.user = @user
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
    params.require(:game).permit(:name, :description, :price_per_day, :address, :user_id, :picture)
  end
  def authorized_user!
    unless @game.user == current_user
      redirect_to games_path
    end
  end
end
