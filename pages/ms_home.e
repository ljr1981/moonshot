﻿note
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
			l_jumbotron: BS_JUMBOTRON
			l_image: BS_LINK_IMAGE
			l_container: BS_CONTAINER
			l_row: BS_ROW
			l_col: BS_COLUMN
			l_well: BS_WELL
			l_collection: BS_IMAGE_COLLECTION
			l_size: INTEGER
		do
			create l_jumbotron.make_content_centered ({BS}.bleed_to_edge)

			l_jumbotron.item.new_hx.set_text_content ("MOONSHOT")
			l_jumbotron.item.last_new_hx.set_h1
			l_jumbotron.item.add_content (l_jumbotron.item.last_new_hx)

			l_jumbotron.item.new_p.set_text_content ("Rocket Science for Everyone!")
			l_jumbotron.item.add_content (l_jumbotron.item.last_new_p)

			add_content (l_jumbotron)

			create l_container.make

			create l_row.make_for_all_same (6, [0,6,4,2])

			l_size := 100
			l_col := l_row.columns [1]
			create l_image.make_with_rounded_image ("jumbotron.png", "jumbotron", l_size, l_size)
			l_col.add_content (l_image)

			l_col := l_row.columns [2]
			create l_image.make_with_rounded_image ("button.png", "buttons", l_size, l_size)
			l_col.add_content (l_image)

			l_col := l_row.columns [3]
			create l_image.make_with_rounded_image ("x.png", "x", l_size, l_size)
			l_col.add_content (l_image)

			l_container.add_content (l_row)

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
