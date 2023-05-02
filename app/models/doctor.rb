class Doctor < ActiveRecord::Base
    
     has_many :doctor_patients, dependent: :destroy
     has_many :patients, :through => :doctor_patients
       
      # validates :name, presence: true,  format: { without: /\d/} 
      # validates :contact_no, presence: true, length: { is: 10 }, :unless => :validate_contact_no?
      validates :email, presence: true
       
  #     attr_accessor :skip_contact_no_validation, :skip_email

  #     # before_destroy :delete_roles
  #     # before_save :validate_email
  #     # before_validation :ensure_name_has_a_value


  #    private
  #    def validate_contact_no?
  #       skip_contact_no_validation = true
  #    end

  #    #private
  #    #def validate_email?
  #    #    skip_email = true
  #   # end

  # private

  # def ensure_name_has_a_value
  #   if name.nil?
  #     self.name = "name"
  #   end
  # end

  # def delete_roles
  #   # Delete all the appointments associated with this doctor before deleting the doctor
  #   Role.where(user_id: id).destroy_all
  # end

   #def validate_email
    # Validate email address before saving the model
    #unless email =~ URI::MailTo::EMAIL_REGEXP
     # errors.add(:email, "is not a valid email address")
     # throw(:abort)
  # end

#   def self.search(doctor_name)
#     if doctor_name
#         doctor_name.downcase!
#         where('LOWER(name) LIKE ?', "%#{doctor_name}%")
#     else
#         all
#     end
# end

def self.search(search)
  where("name LIKE ?", "%#{search}%")
  where("email LIKE ?", "%#{search}%")
end


     



end
