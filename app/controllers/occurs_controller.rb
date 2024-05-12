class OccursController < ApplicationController
  before_action :set_occur, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show,  :index]


  # GET /occurs/1 or /occurs/1.json
  def show
  end

  # GET /occurs/new
  def new
    @occur = Occur.new
  end

  # GET /occurs/1/edit
  def edit
  end

  # POST /occurs or /occurs.json
  def create
    @occur = Occur.new(occur_params)
    respond_to do |format|
      if @occur.save
        format.html { redirect_to occur_url(@occur), notice: "Occur was successfully created." }
        format.json { render :show, status: :created, location: @occur }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @occur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /occurs/1 or /occurs/1.json
  def update
    respond_to do |format|
      if @occur.update(occur_params)
        format.html { redirect_to occur_url(@occur), notice: "Occur was successfully updated." }
        format.json { render :show, status: :ok, location: @occur }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @occur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /occurs/1 or /occurs/1.json
  def destroy
    @occur.destroy!

    respond_to do |format|
      format.html { redirect_to occurs_url, notice: "Occur was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occur
      @occur = Occur.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def occur_params
      permitted_params = params.require(:occur).permit(:error_id)
      permitted_params.merge(user_id: current_user.id)
    end
end
