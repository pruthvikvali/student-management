class DoctorsController < ApplicationController
  def index

    @doctorss = Doctor.all
      if params[:search]
        @doctors = Doctor.search(params[:search])
      else
        @doctors = Doctor.all
      end
    
    #@patients = Patient.all.map{ |p| [p.name, p.id] }
  
    #if params[:patient_id].present?
    #@patient = Patient.find(params[:patient_id])
    #@doctors = @patient.doctors
   # else
   # @patient = nil
    #@doctors = Doctor.all
    #end
  end

   def show
    @doctor = Doctor.find(params[:id])

  end
 

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    patient = Patient.find_by(id: @doctor.id)

    if patient.present?
      @doctor.patients << patient
    end
   
 
    if @doctor.save()
    redirect_to @doctor
    else
    render 'new'
    end 
  end

  def edit
     @doctor= Doctor.find(params[:id])
  end

  def update
    @doctor= Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      redirect_to @doctor
    else
      render 'edit'
    end
  end

  def destroy
  @doctor = Doctor.find(params[:id])
  @doctor.destroy
  redirect_to doctors_path 
  end

  def save
    @doctor = Doctor.new(doctor_params)
    if @doctor.save()
    redirect_to @doctor
    else
    render 'new'
    end 
  end
 
private
  def doctor_params
    params.require(:doctor).permit(:name, :email, :contact_no, :doctor,  :search )
  end
end
