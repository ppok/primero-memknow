class MemsController < ApplicationController
  before_action :set_mem, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @mems = Mem.all # is this where I can order it by due date? 
    # how to add due_date to schema.rb? active record: find_in_batches if due_date= today?
    # Mem.find_each do |mem| mem.daily_deliver(mem).group("date(created_at)")
  end

  def show
  end

  def new
    @mem = current_user.mems.build
  end

  def edit
  end

  def create
    @mem = current_user.mems.build(mem_params)
    if @mem.save
        redirect_to @mem, notice: 'Your Mem was successfully spawned.'
      else
        render action: 'new'
      end
  end

  def update
    if @mem.update(mem_params)
     redirect_to @mem, notice: 'Your Mem was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @mem.destroy
    redirect_to mems_url
  end

  private
    def set_mem
      @mem = Mem.find(params[:id])
    end

    def correct_user
      @mem = current_user.mems.find_by(id: params[:id])
      redirect_to mems_path, notice: "Don't change what's not yours" if @mem.nil?
    end

    def mem_params
      params.require(:mem).permit(:question, :answer, :score)
    end
end
