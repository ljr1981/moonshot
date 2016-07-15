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
	HTML_DIV
		redefine
			default_create
		end

	MS_PAGE_CONTAINER
		undefine
			default_create,
			out
		end

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			header_setup
			navigation_setup
			content_setup
			footer_setup
		end

feature {NONE} -- Basic Operations

	header_setup
			-- `header_setup'.
		do
			do_nothing
		end

	navigation_setup
			-- `navigation_setup'.
		deferred
		end

	content_setup
			-- `content_setup'.
		do
			do_nothing
		end

	footer_setup
			-- `footer_setup'.
		do
			do_nothing
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
