module ApplicationHelper

	# returns appropriate title depending on whether an appendix is provided or not
	def full_title(page_title)
		base_title = "Katata Network"
		if page_title.empty?
			base_title + " - Home"
		else
			"#{base_title} - #{page_title}"
		end
	end
end