note
	description: "[
		Represenation of a {MS_HOME}
		]"
	desgin: "[
		See notes at bottom of class.
		]"

class
	MS_HOME

inherit
	MS_BASE_PAGE
		redefine
			content_setup
		end

feature {NONE} -- Initialization

	navigation_setup
			-- <Precursor>
		do
			do_nothing
		end

	content_setup
			-- <Precursor>
		local
			l_jt: BS_JUMBOTRON
			l_gallery: BS_IMAGE_GALLERY
			l_image: BS_IMAGE
			l_container: BS_CONTAINER
			l_images: BS_ROW
			l_well: BS_WELL
			l_size: INTEGER
			l_collection: BS_IMAGE_COLLECTION
		do
			create l_jt.make_center (True)

			l_jt.item.new_hx.set_text_content ("MOONSHOT")
			l_jt.item.last_new_hx.set_h1
			l_jt.item.add_content (l_jt.item.last_new_hx)

			l_jt.item.new_p.set_text_content ("Rocket Science for Everyone!")
			l_jt.item.add_content (l_jt.item.last_new_p)

			add_content (l_jt)

			create l_gallery.make_for_phone ("Microservices?", "A single monolithic executable vs. many executables working together.", <<
				[6, "Monolithic EXE", create {BS_IMAGE}.make_rounded ("executable.png", "Monolith", 400, 400)],
				[6, "Microservice EXEs", create {BS_IMAGE}.make_rounded ("executables.png", "Microservices", 400, 400)]
				>>)
			create l_container.make
			l_container.add_content (l_gallery)

			add_content (l_container)

			create l_container.make_fluid
			l_container.add_content (create {BS_HX_AND_SMALL}.make_with_primary_and_secondary_text (1, "MOONSHOT!", "Kittens for Everyone!"))
			l_container.add_content (create {BS_HX_AND_SMALL}.make_with_primary_and_secondary_text (3, "That's right ...!", "We said, kittens for Everyone!"))
			create l_collection.make_with_spans_images ([0,6,4,2], 125, <<
										["kitten_300.jpg", "Kitten One", "Fred"],
										["kitten_301.jpg", "Kitten Two", "Sally"],
										["kitten_302.jpg", "Kitten Three", "George"],
										["kitten_303.jpg", "Kitten Four", "Henry"],
										["kitten_304.jpg", "Kitten Five", "Mary"],
										["kitten_305.jpg", "Kitten Six", "Daisy"]
										>>)
			l_container.add_content (l_collection)
			add_content (l_container)
		end

note
	design: "[
		This is the Moonshot.com home page as object-coded HTML. The
		`default_create' (just above) is an example of building a page
		in Moonshot, where the HTML is generated by the objects and
		object calls.
		]"

end
