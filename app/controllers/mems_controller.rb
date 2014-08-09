class MemsController < ApplicationController
  before_action :set_mem, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @mems = Mem.all
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
        redirect_to @mem, notice: 'Your Mem was successfully created.' 
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
      redirect_to mems_url, notice: 'That stinky Mem was successfully destroyed.'
    end

  private
    def set_mem
      @mem = Mem.find(params[:id])
    end

  def correct_user
    @mem = urrent_user.mems.find_by(id: params[:id])
    redirect_to mems_path, notice: "Don't go around editing other peple's mems" if @mem.nil?
  end

    def mem_params
      params.require(:mem).permit(:description)
    end
end
