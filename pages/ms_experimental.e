note
	description: "[
		Representation of an effected {MS_EXPERIMENTAL}.
		]"

class
	MS_EXPERIMENTAL

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
		do
			add_content (jumbotron)
			add_content (menu)
			add_content (jumbo_2)
		end

	jumbotron: BS_JUMBOTRON
		do
			create Result.make_content_centered ({BS}.bleed_to_edge)

			Result.item.new_hx.set_text_content ("EXPERIMENTAL")
			Result.item.last_new_hx.set_h1
			Result.item.add_content (Result.item.last_new_hx)

			Result.item.new_p.set_text_content ("THIS is the experiment you're looking for!")
			Result.item.add_content (Result.item.last_new_p)

			Result.item.add_content (create {HTML_P}.make_with_raw_text ("(The droids went that way -->)"))
		end

	menu: BS_NAVBAR
		do
			create Result.make_menu (<<
								["jumbotron", "Jumbotron", <<>>],
								["buttons", "Buttons", <<>>],
								["#", "Pages", <<
									["index.html", "Home", <<>>],
									["jumbotron", "Jumbotron", <<>>],
									["buttons", "Buttons", <<>>]
									>>]
							>>, {BS}.navbar_is_inverse, ["index.html", "Home"])
		end

	jumbo_2: BS_CONTAINER
		local
			l_jumbo: BS_JUMBOTRON
			l_row: BS_ROW
		do
			create Result.make_fluid
			create l_jumbo.make_content_centered ({BS}.bleed_to_edge)

			create l_row.make_for_all_same (12, [0,6,4,2])
			l_row.columns [1].add_content (create {BS_LINK_IMAGE}.make_with_rounded_image ("home.png", "index.html", 100, 100))
			l_row.columns [2].add_content (create {BS_LINK_IMAGE}.make_with_rounded_image ("moonlanding.png", "buttons", 100, 100))
			l_jumbo.add_content (l_row)

			l_jumbo.add_content (create {BS_ALERT}.make_success ("is inevitable", {BS}.is_closable))

			Result.add_content (l_jumbo)
		end

feature {NONE} -- Paragraphs



note
	design_intent: "[
		Your_text_goes_here
		]"

end
