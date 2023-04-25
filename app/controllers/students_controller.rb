class StudentsController < ApplicationController

  before_action :set_student, only: [:show, :edit, :update, :destroy]
  
  def index
    @projects = Project.all
    if params[:student].present? and params[:student][:project_id].present?
      @project= Project.find_by_id(params[:student][:project_id])
      @students = Student.eager_load(student_projects: :project).where("projects.pname =?", @project.pname)
      @details = []
      @students.each do|student|
        @name= student.name 
        @email = student.email
        @contact_no = student.contact_no
        @projects = student.student_projects
        @student_project_details = []
        @projects.each do|student_project|
          @student_project_details << student_project.project.pname
        end
        @details << {:name=>@name, :email=>@email, :contact_no=>@contact_no, :student_project_details=> @student_project_details,:student=>student}
      end  
    end
  end

  def show 
  end

  def new
    @student = Student.new

  end

  def edit
  end
 
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end


  def update
    if @student.update(student_params)
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  def delete_students
    Student.where(id: params[:student_ids]).destroy_all
    redirect_to students_path, notice: "student deleted successfully"
  end


  private
  def set_student
    @student= Student.find(params[:id])
  end


  private
  def student_params
    params.require(:student).permit(:name, :email, :contact_no )
  end



 
end
