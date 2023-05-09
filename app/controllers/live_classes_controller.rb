class LiveClassesController < ApplicationController

  helper_method :formated_date
	def create
    @user = User.find(params[:user_id])
    @live_class = @user.live_classes.create(live_class_params)
    redirect_to user_path(@user)
  end
 
  private
    def live_class_params
      params.require(:live_class).permit(:start_time, :end_time, :teacher)
    end

  #   private
  #    def formated_date(date)
  #   date.strftime('%B %d, %Y at %I:%M %p') if live_class.start_time.present?
  # end
end
