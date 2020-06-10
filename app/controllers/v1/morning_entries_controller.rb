class V1::MorningEntriesController < ApplicationController
    def index
      @morning_entries = MorningEntry.all
      render json: @morning_entries, status: :ok
    end
    
    def create
      @morning_entry = MorningEntry.new(task_params)
      @morning_entry.save
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
      if @morning_entry.update(task_params)
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
      params.require(:morning_entry)
    end
  end
  