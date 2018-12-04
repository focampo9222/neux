class CoursesController < ApplicationController
	def index
		@courses = Course.all
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		if @course.save
			redirect_to courses_path
		else
			render :new
		end
	end

	def add_matters
		@matters = Matter.all
		@course = Course.find(params[:id])
	end

	def save_matters
		@course = Course.find(params[:course_id])
		if @course.save_matters(params[:matters])
			redirect_to courses_path
		else
			@matters = Matter.all
			render :add_matters
		end
	end

	private
	def course_params
		params.require(:course).permit(:name)
	end
end