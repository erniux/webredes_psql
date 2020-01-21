class Event < ApplicationRecord
	 
	validates_presence_of :titulo, :detalle, :lugar, :start, :end

	has_one_attached :foto
	attr_accessor :date_range

	def all_day_event?
		self.start == self.start.midnight && self.end == self.end.midnight ? true : false
	  end
	 
end

