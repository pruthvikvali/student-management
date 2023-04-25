class Student < ActiveRecord::Base
	has_many :projects , through: :student_projects
	has_many :student_projects, dependent: :destroy

	has_many :blogs
end
