class CourseMatter < ApplicationRecord
	belongs_to :matter
	belongs_to :course
	validates_presence_of :matter, :course
	validates :matter, uniqueness: { scope: :course }
end