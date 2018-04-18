class EncryptController < ApplicationController

before_action only: [:show, :encrypt_msg]

    def encrypt_msg
        @rsa = Rsa.where(:mid => params[:id]).first
        if @rsa.nil? or @rsa.n.nil? or @rsa.e.nil? or @rsa.d.nil?
            # render json: {status: "Failed"}
            respond_to do |format|
                format.json {render json: {status: "Not Found"} }
                format.html {render :not_found}
            end
        else
            msg = params[:message]

            result = @rsa.encrypt msg
            @rsa.enc_message = result

            if @rsa.save
                respond_to do |format|
                    format.html { render plain: @rsa.mid}
                end
            end
        end
    end

    def show
        @rsa = Rsa.where(:mid => params[:id]).first

        if @rsa.nil? or @rsa.enc_message.nil?
            respond_to do |format|
                format.json {render json: {status: "Not Found"} }
                format.html {render :not_found}
            end
        else
            respond_to do |format|
                format.json {render json: {message: "#{@rsa.enc_message}"}}
                format.html {render plain: "all good"}
            end
        end

    end
end
