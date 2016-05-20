note
	description: "[
		Representation of a {MS_APP_EXECUTION}.
		]"
	design: "[
		See notes at the end of this class.
		]"

class
	MS_APP_EXECUTION

inherit
	EWX_APP_EXECUTION
		redefine
			setup_router
		end

	MS_ANY
		undefine
			default_create
		end

create
	make

feature {NONE} -- Initialization

	setup_router
			-- <Precusor>
		do
			Precursor
			map_uri_agent (uri_moonshot_home, agent moonshot_home_handler, no_request_methods)
		end

feature -- Execution

	moonshot_home_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_html_page_response' through `a_response' message based on `a_request'.
		local
			l_page: EWX_HTML_PAGE_RESPONSE
		do
			create l_page.make_standard ("Moonshot Home Page", "en", create {MS_HOME_PAGE})
			l_page.add_js_file_script ("javascript.js")
			l_page.add_css_file_link ("stylesheet.css")
			a_response.send (l_page)
		end

feature {NONE} -- Implementation: Constants

	uri_moonshot_home: STRING = "/index.html"
			-- `uri_moonshot_home' router template map.

;note
	design: "[
		]"

end
