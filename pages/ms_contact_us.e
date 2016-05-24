note
	description: "[
		Representation of an effected {MS_CONTACT_US}.
		]"

class
	MS_CONTACT_US

inherit
	MS_BASE_PAGE
		redefine
			make_restful,
			make_restful_on_class
		end

create
	make_restful,
	make_restful_on_class

feature {NONE} -- Initialization

	make_restful_on_class (a_class, a_uri: STRING)
		do
			default_create
			last_new_form.set_needs_redirection
			last_new_form.set_redirection_uri ("/" + {MS_BASE_PAGE}.Thank_you_uri)
			last_new_form.set_class (a_class)
			last_new_form.set_rest_uri (a_uri)
		end

	make_restful (a_uri: STRING)
			-- <Precursor>
		do
			default_create
			new_form.set_rest_uri (a_uri)
		end

	navigation_setup
			-- <Precursor>
		do
			last_new_nav.add_link_and_text ({MS_BASE_PAGE}.whatis_page, {MS_BASE_PAGE}.whatis_label)
			last_new_nav.add_link_and_text ({MS_BASE_PAGE}.blogs_page, {MS_BASE_PAGE}.blogs_label)
		end

	content_setup
			-- <Precursor>
		do
			new_article.set_class ("content")
			new_form.set_method ("POST")
			last_new_form.add_text_input_field_group (<<
					["First Name:", "first_name", maxlength_equals (12), size_equals (12), include_break],
					["Last Name:", "last_name", maxlength_equals (36), size_equals (12), include_break]
					>>)

			last_new_form.add_checkbox_group ("Interests:", "interests",
					<<"Web-dev", "Rapid App Dev", "Frameworks", "Need web-dev">>, include_break)

			last_new_form.add_textarea ("physical", "quote", "Write to us!", cols_equals (50).to_integer, rows_equals (20).to_integer, include_break)

			last_new_form.add_select_with_options ("Follow-up?", "response_needed",
					3, <<"None", "Email", "Phone">>, include_break)

			last_new_form.add_content (create {HTML_P}.make_with_content (<<
					create {HTML_INPUT}.make_as_submit_button>>))
			last_new_article.add_content (last_new_form)
			add_to_current (last_new_article)
		end

note
	design_intent: "[
		Intended for harvesting contacts!
		]"

end
