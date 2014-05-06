class Letter < ActiveRecord::Base

	validates :recipient_first_name, presence: true
	validates :recipient_last_name, presence: true
	validates :recipient_street, presence: true
	validates :recipient_state, presence: true
	validates :recipient_city, presence: true
	validates :recipient_zip, presence: true
	validates :content, presence: true, 
						length: {maximum: 250}
	


end
