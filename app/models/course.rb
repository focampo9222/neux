class Course < ApplicationRecord
	validates_presence_of :name

	def save_matters(matter_ids)
		m_ids = matter_ids.values
		return false if m_ids.size <= 0
		Course.transaction do
			begin
				m_ids.each do |mi|
					cm = CourseMatter.new
					cm.course_id = self.id
					cm.matter_id = mi.to_i
					cm.save!
				end
				return true
			rescue Exception => e
				return false
			end
		end
	end
end