class Task < ActiveRecord::Base
	scope :active, ->{ where(status: 0) }
	scope :completed, ->{ where(status: 1) }

	def toggle_status
		self.status = (self.status + 1) % 2
	end

	def self.completed_status
		'1'
	end

	def completed?
		self.status == 1
	end
end
