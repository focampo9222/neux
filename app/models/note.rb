class Note < ApplicationRecord
	belongs_to :student
	belongs_to :course
	belongs_to :matter, foreign_key: 'matter_id'
	validates_presence_of :student, :course, :point, :matter_id
	validates_numericality_of :matter_id, :greater_than_or_equal_to => 1

	def as_json(options = {})
		h = options
		h['calificacion'] = self.point
		h['curso'] = self.course.name
		h['asignatura'] = self.matter.name
		h
	end

	def add_point(point)
		point = point.to_i
		if point <= 0
			self.errors.add(:point, "Calificación no debe ser mayor que 0")
			return
		end
		total_students = Student.count
		current_minute = DateTime.now.minute
		max_point = total_students + current_minute
		if point > max_point
			self.errors.add(:point, "Calificación no debe superar #{max_point}")
		else
			self.point = point
		end
	end
end