class Doctor < ActiveRecord::Base
    
     has_many :doctor_patients, dependent: :destroy
     has_many :patients, :through => :doctor_patients
       
      validates :name, presence: true,  format: { without: /\d/} 
      validates :contact_no, presence: true, length: { is: 10 }, :unless => :validate_contact_no?
      validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: {case_sensitive: false},unless: :validate_email?

      attr_accessor :skip_contact_no_validation, :skip_email


     private
     def validate_contact_no?
        skip_contact_no_validation = true
     end

     private
     def validate_email?
         skip_email = true
     end

     



end
