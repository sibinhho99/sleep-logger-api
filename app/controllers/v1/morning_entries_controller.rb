class V1::MorningEntriesController < ApplicationController
    def index
      @morning_entries = @current_user.morning_entries
      render json: @morning_entries, status: :ok
    end
    
    def create
      @morning_entry = @current_user.morning_entries.build(morning_entry_params)
      render json: @morning_entry, status: :created
    end
  
    def show
      @morning_entry = MorningEntry.find(params[:id])
      if @morning_entry
        render json: @morning_entry, status: :ok
      else
        render status: :unprocessable_entity
      end
    end
  
    def update
      @morning_entry = MorningEntry.find(params[:id])
      if @morning_entry.update(morning_entry_params)
        render json: @morning_entry, status: :ok
      else
        render status: :unprocessable_entity
      end
    end
  
    def destroy
      @morning_entry = MorningEntry.find(params[:id])
      if @morning_entry.destroy
        render status: :ok
      else
        render status: :unprocessable_entity
      end
    end
  
    def morning_entry_params
        params.require(:morning_entry).permit(:bed_time, :wake_up_time, :ease_of_sleep, :hours_of_sleep, :morning_feeling)
    end
  end
  