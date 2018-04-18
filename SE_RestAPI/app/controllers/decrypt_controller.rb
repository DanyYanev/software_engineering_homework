class DecryptController < ApplicationController

    def decrypt_msg

        @rsa = Rsa.where(:mid => params[:id]).first

        if @rsa.nil? or @rsa.n.nil? or @rsa.e.nil? or @rsa.d.nil?
            respond_to do |format|
                format.html {render :not_found}
                format.json {render json: {status: "Failed"} }
            end
        else
            msg = params[:message]

            @rsa.message = @rsa.decrypt msg
            respond_to do |format|
              if @rsa.save
                format.html { render plain:  @rsa.message}
              end
            end

        end
    end
end
