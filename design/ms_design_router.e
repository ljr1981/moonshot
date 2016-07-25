note
	description: "[
		Representation of a {MS_ROUTER}.
		]"
class
	MS_DESIGN_ROUTER

inherit
	EWX_APP_EXECUTION
		redefine
			setup_router,
			execute
		end

create
	make

feature {NONE} -- Initialization

	setup_router
			-- <Precusor>
		do
			Precursor
			map_uri_agent ("/index.html", agent moonshot_home_handler, no_request_methods)
		end

feature -- Default Execution

	execute
			-- <Precursor>
		do
			Precursor
		end

feature -- Execution

	moonshot_home_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_page' through `a_response' message based on `a_request'.
		local
			l_page: EWX_HTML_PAGE_TAG_RESPONSE
		do
			create l_page.make_standard_with_raw_text ("", "en", home_page_html)
			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.common.min.css")
			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.default.min.css")
			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.default.mobile.min.css")
			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.blueopal.min.css")
			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.blueopal.mobile.min.css")
			l_page.add_css_link ("http://kendo-ui/content/shared/styles/examples.css")
			l_page.add_javascript_script ("http://kendo.cdn.telerik.com/2016.2.714/js/jquery.min.js")
			l_page.add_javascript_script ("http://kendo.cdn.telerik.com/2016.2.714/js/kendo.all.min.js")
			a_response.send (l_page)
		end

feature {NONE} -- Constants

	home_page_html: STRING
		local
			l_file: PLAIN_TEXT_FILE
		do
			create l_file.make_open_read (".\design\html\kendo_grid.html")
			l_file.read_stream (l_file.count)
			Result := l_file.last_string
			l_file.close
		end

end
