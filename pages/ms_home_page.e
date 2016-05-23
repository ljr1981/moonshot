note
	description: "[
		Represenation of a {MS_HOME_PAGE}
		]"
	desgin: "[
		See notes at bottom of class.
		]"

class
	MS_HOME_PAGE

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
				-- Header
			new_header.set_id_and_href ("logo", "index.html")
			add_to_current (last_new_header)
				-- Navigation
			new_nav.add_link_and_text ("index.html", "Home")
			last_new_nav.add_link_and_text ("moonshot.html", "What is a Moonshot?")
			last_new_nav.add_link_and_text ("blogs.html", "Blogs")
			last_new_nav.add_link_and_text ("contact.html", "Contact us")
			last_new_header.add_content (last_new_nav)
				-- Contents
			new_article.set_class ("content")
			new_video.set_src_type_height_width_with_controls ("moonshot_small.mp4", "video/mp4", 640, 480)
			last_new_video.set_looped_auto_play
			last_new_article.add_content (last_new_video)
			add_to_current (last_new_article)
				-- Footer
			new_footer.add_image (new_image.with_id_and_src ("large-footer", "Moonshot-Website-Footer-640px.png"))
			last_new_footer.add_image (new_image.with_id_and_src ("small-footer", "Moonshot-Website-Footer-329px.png"))
			add_to_current (last_new_footer)
		end

note
	design: "[
		This is the Moonshot.com home page as object-coded HTML. The
		`default_create' (just above) is an example of building a page
		in Moonshot, where the HTML is generated by the objects and
		object calls.
		]"

end