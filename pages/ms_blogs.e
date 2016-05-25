note
	description: "[

		]"

class
	MS_BLOGS

inherit
	MS_BASE_PAGE
		redefine
			content_setup
		end

feature {NONE} -- Initialization

	navigation_setup
			-- <Precursor>
		do
			last_new_nav.add_link_and_text ({MS_BASE_PAGE}.whatis_page, {MS_BASE_PAGE}.whatis_label)
			last_new_nav.add_link_and_text ({MS_BASE_PAGE}.contact_us_page, {MS_BASE_PAGE}.contact_us_label)
		end

	content_setup
			-- <Precursor>
		do
			Precursor
		end

note
	design_intent: "[
		Intended for blogging!
		]"

end
