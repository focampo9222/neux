class Student < ApplicationRecord
	validates_presence_of :name
	has_many :notes
	has_many :course_students
	has_many :courses, through: :course_students

	def as_json(options = { })
		h = options
		h['name'] = self.name
		h['notes'] = self.notes.as_json
		h
	end

	def save_courses(courses_ids)
		c_ids = courses_ids.values
		return false if c_ids.size <= 0
		Student.transaction do
			begin
				c_ids.each do |mi|
					cm = CourseStudent.new
					cm.course_id = self.id
					cm.student_id = mi.to_i
					cm.save!
				end
				return true
			rescue Exception => e
				return false
			end
		end
	end

	def save_note(params)
		errors = []
		Student.transaction do
			begin
				note = Note.new
				note.add_point(params[:point])
				note.course_id = params[:course_id].to_i
				note.matter_id = params[:matter_id].to_i
				note.student_id = self.id
				if note.errors.full_messages.present?
					errors = erros + note.errors.full_messages.to_a
				end
				if note.save!
					return {saved: true, errors: []}
				end

			rescue Exception => e
				errors = errors + note.errors.full_messages
				return {saved: false, errors: errors}
			end
		end
	end
end