module Api
	module V1
		class StudentsController < ApplicationController
			def list
				render json: {students: Student.all.as_json}, status: 200
			end
		end
	end
end