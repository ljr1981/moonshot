note
	description: "[
		Representation of an effected {MS_JUMBOTRON}.
		]"

class
	MS_JUMBOTRON

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
			add_content (getting_routed)
			add_content (jumbotron_creation)
			add_content (and_in_case_you_are_wondering)
			add_content (final_result)
		end

	jumbotron: HTML_A
		local
			l_jumbo: BS_JUMBOTRON
		do
			create Result.make_with_id_and_href ("", "index.html")
			create l_jumbo.make_content_centered ({BS}.bleed_to_edge)

			l_jumbo.item.new_hx.set_text_content ("JUMBOTRON")
			l_jumbo.item.last_new_hx.set_h1
			l_jumbo.item.add_content (l_jumbo.item.last_new_hx)

			l_jumbo.item.new_p.set_text_content ("The making of a page header ... or ... whatever!")
			l_jumbo.item.add_content (l_jumbo.item.last_new_p)

			Result.add_content (l_jumbo)
		end

	getting_routed: BS_CONTAINER
		do
			Result := standard_container ("jumbotron_getting_routed.png",
									"router setup",
									"EXAMPLE #1: Getting Routed",
									"Setting of page routing in the router class",
									getting_routed_paragraph,
									900, 900)
		end

	jumbotron_creation: BS_CONTAINER
		do
			Result := standard_container ("jumbotron_creation.png",
									"creation process",
									"EXAMPLE #2: Jumbotron Creation",
									"Creation of the Jumbotron (above)",
									creation_paragraph,
									900, 900)
		end

	and_in_case_you_are_wondering: BS_CONTAINER
		do
			Result := standard_container ("jumbotron_all_together.png",
									"setup process",
									"EXAMPLE #3: Jumbotron Page Setup",
									"Creation of the Jumbotron (above)",
									and_in_case_you_are_wondering_paragraph,
									900, 700)
		end

	final_result: BS_CONTAINER
		do
			Result := standard_container ("jumbotron_html.png",
									"the resulting html",
									"EXAMPLE #4: Jumbotron Page HTML",
									"And the generated HTML looks like?",
									prettified_html_results_paragraph,
									900, 900)
		end

feature {NONE} -- Paragraphs

	getting_routed_paragraph: STRING = "[
This is an example of a request message being routed. In the example below, the program is routing a message "jumbotron" 
to the correct routine in {MS_ROUTER} (i.e. `moonshot_jumbotron_handler').
]"

	creation_paragraph: STRING = "[
In the MS_JUMBOTRON class we have a feature called `jumbotron' (see graphic). This feature is of type {BS_JUMBOTRON}.
All we really have to do is create an instance and then add the primary and secondary text parts. Be sure to note that
we must access the Result.item.add_content for each item we want to add to our Jumbotron. Also note that we could add
any number of items and not just primary and secondary text.
]"

	and_in_case_you_are_wondering_paragraph: STRING = "[
If you're wondering how it all comes together: Here is this entire page being built.
]"

	prettified_html_results_paragraph: STRING = "[
If you right-click this page and "view source" you will see a not-so-pretty version of this page. Running it through
a prettify-processor and then pasting into an HTML editor, we now get the result shown in the graphic.
]"

note
	design_intent: "[
		Your_text_goes_here
		]"

end
