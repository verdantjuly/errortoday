class ErrorsController < ApplicationController
  before_action :set_error, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:show,  :index]
  # GET /errors or /errors.json
  def index
    @errors = Error
  .joins(:user)
  .left_outer_joins(:occurs)
  .order(created_at: :desc)
  .select('errors.*, users.email, COUNT(occurs.id) AS occurs_count')
  .group('errors.id, users.email')

  @today = Error
  .joins(:user)
  .left_outer_joins(:occurs)
  .where(today: true)
  .select('errors.*, users.email, COUNT(occurs.id) AS occurs_count')
  .group('errors.id, users.email')
  .order('occurs_count DESC')
  .first
end

  # GET /errors/1 or /errors/1.json
  def show
    @error = Error.find(params[:id])
    @comments = Comment.where(error_id: @error.id)
  end

  # GET /errors/new
  def new
    @error = Error.new
  end

  # GET /errors/1/edit
  def edit
  end

  # POST /errors or /errors.json
  def create
    @error = Error.new(error_params)

    respond_to do |format|
      if @error.save
        format.html { redirect_to error_url(@error), notice: "Error was successfully created." }
        format.json { render :show, status: :created, location: @error }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @error.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /errors/1 or /errors/1.json
  def update
    respond_to do |format|
      if @error.update(error_params)
        format.html { redirect_to error_url(@error), notice: "Error was successfully updated." }
        format.json { render :show, status: :ok, location: @error }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @error.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /errors/1 or /errors/1.json
  def destroy
    @error.destroy!

    respond_to do |format|
      format.html { redirect_to errors_url, notice: "Error was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_error
      @error = Error.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def error_params
      permitted_params = params.require(:error).permit(:error, :content)
      permitted_params.merge(user_id: current_user.id)
    end
end
