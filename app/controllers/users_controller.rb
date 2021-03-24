class UsersController < ApplicationController
  def user
    @users = User.all
  end

  def add_user
    @user = User.create(name: params[:user], coins: 0)
    redirect_to('/')
  end

  def game

    @monster = Monster.find(rand(1..5))
    @user = User.find(params[:id])
  end

  def attack
    @user = User.find(params[:data][:user])
    @actual_monster = Monster.find(params[:data][:monster])
    @monster = Monster.find(rand(1..5))
    @user.killed_monsters << KilledMonster.new(user_id: @user.id, monster_id: @actual_monster.id)
    @user.deaths << Death.new(user_id: @user.id)
    @user.collected_coins << CollectedCoin.new(user_id: @user.id, value: @actual_monster.coins)

    respond_to do |format|
      format.html { render :game }
      format.js { render :game }
    end
  end
end
