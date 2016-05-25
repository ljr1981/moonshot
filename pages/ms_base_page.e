note
	description: "[
		Representation of an effected {MS_BASE_PAGE}.
		]"
	design: "[
		See notes at the end of this class.
		]"

deferred class
	MS_BASE_PAGE

inherit
	HTML_DIV_FACTORY
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			Precursor
			set_class ("stars")
			header_setup

				-- Navigation
			new_nav.add_link_and_text ({MS_BASE_PAGE}.Home_page, {MS_BASE_PAGE}.Home_label)
			last_new_header.add_content (last_new_nav)

			navigation_setup
			content_setup
			footer_setup
		end

feature {NONE} -- Basic Operations

	header_setup
			-- `header_setup'.
		do
			new_header.set_id_and_href ("logo", "index.html")
			add_to_current (last_new_header)
		end

	navigation_setup
			-- `navigation_setup'.
		deferred
		end

	content_setup
			-- `content_setup'.
		do
			new_article.set_class ("content")
			add_to_current (last_new_article)
		end

	footer_setup
			-- `footer_setup'.
		do
			new_footer.add_image (new_image.with_id_and_src ("small-footer", "Moonshot-Website-Footer-329px.png"))
			add_to_current (last_new_footer)
		end

feature -- Constants

	Home_label: STRING = "Home"
	Home_page: STRING = "index.html"

	Blogs_label: STRING = "Blogs"
	Blogs_page: STRING = "blogs.html"

	Contact_us_label: STRING = "Contact us!"
	Contact_us_page: STRING = "contact.html"
	Contact_data_uri: STRING = "contact_data"
	Thank_you_uri: STRING = "thank_you"

	Whatis_label: STRING = "What is a Moonshot?"
	Whatis_page: STRING = "moonshotwhatis.html"

note
	design_intent: "[
		Common page features for all Moonshot Software pages.
		]"

end
