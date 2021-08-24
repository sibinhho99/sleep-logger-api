class V1::TipsController < ApplicationController
  # Returns the tips associated with the current user
  def index
    @tips = @current_user.tips
    render json: @tips, status: :ok
  end

  #For saving tip. Creates association between the logged in user and the tip.
  def save_tip
    # If user already has the tip, do nothing. Else, create new user-tip association.
    usertip = @current_user.usertips.find_by(tip_id: params[:id])
    if usertip
      render json: @tip, status: :ok
    else
      tip = Tip.find(params[:id])
      if tip
        Usertip.create(user_id: @current_user.id, tip_id: params[:id])
        render json: tip, status: :ok
      else
        render status: :unprocessable_entity
      end
    end
  end

  #For removing tip. Removes association between the logged in user and the tip.
  def remove_tip
    @usertip = @current_user.usertips.find_by(tip_id: params[:id])
    if @usertip
      @usertip.destroy
      render json: @usertip, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def tip_params
    params.require(:tip).permit(:id)
  end
end