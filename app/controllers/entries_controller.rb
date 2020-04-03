class EntriesController < ApplicationController
  def new
    @entry = Entry.new
    @counter = Counter.new
  end

  def create
    binding.pry
    @entry = Entry.new(entry_params)
    if !params[:entry][:counter_id].empty?
      @entry.counter = Counter.find params[:entry][:counter_id]
    else
      @entry.counter = Counter.new(entry_params[:counter_attributes])
    end
    #@entry.counter = Counter.create(params[:counter]) if params[:counter]
    if @entry.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def set_entry
    @entry = Entry.find params[:id]
  end

  def entry_params
    params.require(:entry).permit(
      :quantity,
      :counter_id,
      :counter_attributes => [:id, :title, :user_id]
    )
  end
end
