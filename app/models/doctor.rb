class Doctor < ActiveRecord::Base
	 validates :name, presence: true,  format: { without: /\d/}

      validates :contact_no, presence: true, length: { is: 10 }

       validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: {case_sensitive: false}

     
      has_many :doctor_patients, dependent: :destroy
      has_many :patients, :through => :doctor_patients

end
