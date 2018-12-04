class MattersController < ApplicationController
	def index
		@matters = Matter.all
	end

	def new
		@matter = Matter.new
	end

	def create
		@matter = Matter.new(matter_params)
		if @matter.save
			redirect_to matters_path
		else
			render :new
		end
	end

	private
	def matter_params
		params.require(:matter).permit(:name)
	end
end