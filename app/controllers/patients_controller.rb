class PatientsController < ApplicationController

	def create
    @doctor = Doctor.find(params[:doctor_id])
    @patient = @doctor.patients.create(patient_params)
    redirect_to doctor_path(@doctor)
  end
 
  private
    def patient_params
      params.require(:patient).permit(:name, :email)
    end
end
