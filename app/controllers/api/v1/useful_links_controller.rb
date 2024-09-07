module Api
  module V1
    class UsefulLinksController < ApplicationController
      before_action :authenticate_request

      def index
        @useful_links = UsefulLink.all
        render json: @useful_links, each_serializer: UsefulLinkSerializer
      end
    end
  end
end
