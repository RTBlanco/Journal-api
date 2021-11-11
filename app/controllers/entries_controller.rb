class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

  # GET /entries
  def index
    @entries = current_user.entries.all.map{ |entry| entry.serialize }

    render json: @entries
  end

  # GET /entries/1
  def show
    render json: @entry
  end

  # POST /entries
  def create
    # @entry = Entry.new(entry_params)
    # binding.pry
    @entry = current_user.entries.build(entry_params)

    if @entry.save
      render json: @entry.serialize
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  def update
    if @entry.update(entry_params)
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
    render json: @entry
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = current_user.entries.find(params[:id])
      @entries.serialize
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.permit(:date, :mood, :note)
    end

    # checks to see if the date is valid
    def valid_date? 

    end
end
