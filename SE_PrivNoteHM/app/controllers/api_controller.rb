# require 'json'
# require 'nokogiri'

class ApiController < ApplicationController

      def show

        # @message = Message.where(:url => params[:id]).first
        #
        # if @message.nil?
        #   respond_to do |format|
        #     format.json { render json: {status: 'Failed'} }
        #     format.xml { render xml: {status: 'Failed'} }
        #   end
        #   # render json: {status: 'FAILED'}
        # else
        #   respond_to do |format|
        #     format.json { render json: {status: 'SUCCESS', message: @message.text},status: :ok }
        #     format.xml { render xml: {status: 'Failed'} }
        #   end
        #   # render json: {status: 'SUCCESS', message: @message.text},status: :ok
        #   @message.destroy
        # end
      end

      def create
        @message = Message.new
        if xml_request?
          @message.text = Nokogiri::XML.fragment(request.body.read).content
        else
          @message.text = params[:message]
        end

        random = ""
        begin
          random = SecureRandom.hex(7)
        end while Message.where(:url => random).count > 0
        @message.url = random

        respond_to do |format|
          if @message.save
            if json_request?
              format.json { render :created }
            elsif xml_request?
              format.xml { render :created }
            end
          else
            format.xml  { render xml: @message.errors }
            format.json { render json: @message.errors }
          end
        end
      end

      private

      def xml_request?
        request.content_type =~ /xml/
      end

      def json_request?
        request.content_type =~ /json/
      end
end
