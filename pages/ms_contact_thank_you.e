note
	description: "[
		Representation of an effected {MS_CONTACT_THANK_YOU}.
		]"

class
	MS_CONTACT_THANK_YOU

inherit
	MS_BASE_PAGE

feature {NONE} -- Implementation

	navigation_setup
			-- <Precursor>
		do
			do_nothing
		end

	content_setup
			-- <Precursor>
		do
			new_article.set_class ("content")
			last_new_article.add_text_content ("Thank you! You are on our Favorite People List!")
			add_content (last_new_article)
		end

note
	design_intent: "[
		Intended for harvesting contacts!
		]"

end
