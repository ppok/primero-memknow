class MemsController < ApplicationController
  before_action :set_mem, only: [:show, :edit, :update, :destroy]

  def index
    @mems = Mem.all
  end

  def show
  end

  def new
    @mem = Mem.new
  end

  def edit
  end

  def create
    @mem = Mem.new(mem_params)
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

    def mem_params
      params.require(:mem).permit(:question, :answer, :score)
    end
end
