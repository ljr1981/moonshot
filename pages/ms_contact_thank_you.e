note
	description: "[
		Representation of an effected {MS_CONTACT_THANK_YOU}.
		]"

class
	MS_CONTACT_THANK_YOU

inherit
	MS_BASE_PAGE
		redefine
			content_setup
		end

feature {NONE} -- Implementation

	navigation_setup
			-- <Precursor>
		do
			do_nothing
		end

	content_setup
			-- <Precursor>
		do
			Precursor
			last_new_article.add_text_content ("Thank you! You are on our Favorite People List!")
		end

note
	design_intent: "[
		Intended for harvesting contacts!
		]"

end
