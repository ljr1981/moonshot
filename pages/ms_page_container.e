note
	description: "[
		Abstraction notion of a {MS_PAGE_CONTAINER}.
		]"

deferred class
	MS_PAGE_CONTAINER

feature {NONE} --

	standard_container (a_src, a_alt, a_caption, a_link_caption, a_para: STRING; a_height, a_width: INTEGER): BS_CONTAINER
		local
			l_container: BS_CONTAINER
			l_row: BS_ROW
			l_image: BS_IMAGE
			l_gallery: BS_IMAGE_GALLERY
		do
			create l_row.make_for_phone (<<12>>)
			create Result.make_with_rows (<<l_row>>)
			create l_image.make_responsive (a_src, a_alt, a_height, a_width)
			create l_gallery.make_for_phone (a_caption, a_para, <<
							[12, a_link_caption,	l_image]
						>>)
			l_row.add_content (l_gallery)
		end

note
	design_intent: "[
		Your_text_goes_here
		]"

end
