class MemsController < ApplicationController
  before_action :set_mem, only: [:show, :edit, :update, :destroy]

  # GET /mems
  # GET /mems.json
  def index
    @mems = Mem.all
  end

  # GET /mems/1
  # GET /mems/1.json
  def show
  end 

  # GET /mems/new
  def new
    @mem = Mem.new
  end

  # GET /mems/1/edit
  def edit
  end

  # POST /mems
  # POST /mems.json
  def create
    @mem = Mem.new(mem_params)
      if @mem.save
        redirect_to @mem, notice: 'Your Mem was successfully created.' 
      else
        render action: 'new' 
      end
    end
    
  # PATCH/PUT /mems/1
  # PATCH/PUT /mems/1.json
  def update
      if @mem.update(mem_params)
        redirect_to @mem, notice: 'Your Mem was successfully updated.' 
      else
        render action: 'edit'   
    end
  end

  # DELETE /mems/1
  # DELETE /mems/1.json
  def destroy
    @mem.destroy
      redirect_to mems_url, notice: 'That stinky Mem was successfully destroyed.'
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mem
      @mem = Mem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mem_params
      params.require(:mem).permit(:description)
    end
end
