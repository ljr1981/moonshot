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
			new_form.set_class (a_class)
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
			last_new_form.set_method ("POST")
			last_new_form.add_text_input_field_group (<<
					["First Name:", "first_name", maxlength_equals (12), size_equals (12), include_break],
					["Last Name:", "last_name", maxlength_equals (36), size_equals (12), include_break]
					>>)
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
