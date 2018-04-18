require 'prime'
require 'json'

class RsasController < ApplicationController
  before_action :set_rsa, only: [:show, :edit, :update]

  # GET /rsas
  # GET /rsas.json
  def index

  end

  # GET /rsas/1
  # GET /rsas/1.json
  def show
    #   @rsa = Rsa.where(:mid => params[:id]).first
      #
    #   if @rsa.nil?
    #       respond_to do |format|
    #           format.json {render json: {status: "Failed"} }
    #       end
    #   else
    #       respond_to do |format|
    #           format.json { render :created }
    #       end
    #   end
  end

  # GET /rsas/new
  def new
    @rsa = Rsa.new
  end

  # GET /rsas/1/edit
  def edit
  end

  # POST /rsas
  # POST /rsas.json
  def create

    @rsa = Rsa.new

    random = ""
    begin
      random = SecureRandom.hex(7)
    end while Rsa.where(:mid => random).count > 0
    @rsa.mid = random

    if params[:n] and params[:e] and params[:d]
        @rsa.n = params[:n].to_i
        @rsa.e = params[:e].to_i
        @rsa.d = params[:d].to_i
    else
        n, e, d = Rsa.new_keys

        @rsa.n = n
        @rsa.e = e
        @rsa.d = d
    end

    respond_to do |format|
      if @rsa.save
        #format.html { redirect_to @rsa, notice: 'Rsa was successfully created.' }
        format.html { render plain:  @rsa.mid}
        format.json { render :show, status: :created, location: @rsa }
      else
        format.html { render :new }
        format.json { render json: @rsa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rsas/1
  # PATCH/PUT /rsas/1.json
  def update
    respond_to do |format|
      if @rsa.update(rsa_params)
        format.html { redirect_to @rsa, notice: 'Rsa was successfully updated.' }
        format.json { render :show, status: :ok, location: @rsa }
      else
        format.html { render :edit }
        format.json { render json: @rsa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rsas/1
  # DELETE /rsas/1.json
  def destroy
    @rsa.destroy
    respond_to do |format|
      format.html { redirect_to rsas_url, notice: 'Rsa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rsa
      @rsa = Rsa.where(:mid => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rsa_params
      params.require(:rsa).permit(:mid, :message, :enc_message, :n, :e, :d)
    end
end
