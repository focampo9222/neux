class StudentsController < ApplicationController
	def index
		@students = Student.all
	end

	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			redirect_to students_path
		else
			render :new
		end
	end

	def add_courses
		@courses = Course.all
		@student = Student.find(params[:id])
	end

	def save_courses
		@student = Student.find(params[:student_id])
		if @student.save_courses(params[:courses])
			redirect_to courses_path
		else
			@courses = Course.all
			render :add_courses
		end
	end

	def add_note
		@student = Student.find(params[:id])
		@courses = @student.courses
		@matters = Matter.all
	end

	def save_note
		@student = Student.find(params[:student_id])
		response = @student.save_note(params)
		if response[:saved]
			redirect_to students_path
		else
			@errors = response[:errors]
			@courses = @student.courses
			@matters = Matter.all
			render :add_note
		end
	end

	private
	def student_params
		params.require(:student).permit(:name)
	end
end