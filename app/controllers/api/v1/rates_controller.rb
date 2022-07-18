module Api
  module V1
    class RatesController < ApplicationController
      before_action :set_recipe
      def create
        rate = rate.new(rate_params)
        rate.recipe = @recipe
        if rate.save
          render json: rate
        else
          render json: { errors: rate.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
      private
      
      def rate_params
        params.require(:comment).permit(%i[vote])
      end
      
      def set_recipe
        @recipe = Recipe.find(params[:id])
      end
    end
  end
end
