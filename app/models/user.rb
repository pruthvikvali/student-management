class User < ActiveRecord::Base
    
      #giving association
      has_many :roles, :through => :user_roles
      has_many :user_roles, dependent: :destroy

      attr_accessor :contact_no_temporary
      
      #adding validation
      validates :name, presence: true,  format: { without: /\d/} 
      validates :contact_no, presence: true, length: { is: 10 }
      validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: {case_sensitive: false}
      validates :gender, presence: true, inclusion: { in: %w(male female other ) } ,on: :gender_validation

      before_save :update_user_name
      before_validation :format_contact_no
      before_validation :set_default_gender
      after_update :show_message
      after_destroy :log_destroy_action


      def self.search(search)
            where("name LIKE ?", "%#{search}%")
            where("email LIKE ?", "%#{search}%")
      end


      private
      def set_default_gender
            self.gender = "other" if gender.blank?
      end

	
      private
      after_find do |user|
            puts "You have found an object!"
      end

      private
      def update_user_name
            self.name.downcase!
      end

      private
      def format_contact_no
            self.contact_no = contact_no.gsub(/\D/, '')
      end

      private
      def show_message
            puts "===========user is updated==============="
      end


      def log_destroy_action
            puts '=====user destroyed========'
      end












                   

end
