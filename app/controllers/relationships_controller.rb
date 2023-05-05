class RelationshipsController < ApplicationController
  def create
    follower = current_user.relationships.new(followed_id: params[:user_id])
    follower.save
    redirect_to requset.referrer
  end

  def destroy
    follower = current_user.relationships.find_by(followed_id: params[:user_id])
    follower.destroy
    redirect_to requset.referrer
  end


end


