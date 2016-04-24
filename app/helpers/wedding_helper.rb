module WeddingHelper
	def attendance_info_visibility_css(is_coming)
		if is_coming
			return 'show'
		end
	end

	def guest_visibility_css(guest_name)
		if guest_name == ''
			return 'not-attending'
		end
	end
end
