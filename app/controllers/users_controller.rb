class UsersController < ApplicationController
  def user
    @users = User.all
  end

  def add_user
    User.create(name: params[:user])
    redirect_to('/')
  end

  def game
    @monster = Monster.find(rand(5) + 1)
    @user = User.find(params[:user])
  end

  def attack
    @user = User.find(params[:data][:user])
    @monster = Monster.find(params[:data][:monster])
    @user.killed_monsters << KilledMonster.new(user_id: @user.id, monster_id: @monster.id)
    @user.deaths << Death.new(user_id: @user.id)
    @user.collected_coins << CollectedCoin.new(user_id: @user.id, value: @monster.coins)
    redirect_to "/game?user=#{@user.id}"
  end
end
