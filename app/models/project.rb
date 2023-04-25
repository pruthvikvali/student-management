class Project < ActiveRecord::Base
	has_many :students, through: :student_projects
	has_many :student_projects
end
