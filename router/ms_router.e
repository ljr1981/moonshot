note
	description: "[
		Representation of a {MS_ROUTER}.
		]"
class
	MS_ROUTER

inherit
	EWX_APP_EXECUTION
		redefine
			setup_router,
			execute
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
			map_uri_agent (uri_moonshot_home_index_html, agent moonshot_home_handler, no_request_methods)
			map_uri_agent (uri_moonshot_jumbotron, agent moonshot_jumbotron_handler, no_request_methods)
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
			l_page: EWX_HTML_PAGE_RESPONSE
			l_meta: HTML_META
		do
			create l_page.make_standard (moonshot_title_text, "en", create {MS_HOME})
			create l_meta
			l_meta.set_name ("viewport")
			l_meta.set_content ("width=device-width, initial-scale=1")
			a_response.send (l_page)
		end

	moonshot_jumbotron_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_page' through `a_response' message based on `a_request'.
		local
			l_page: EWX_HTML_PAGE_RESPONSE
			l_meta: HTML_META
		do
			create l_page.make_standard (moonshot_title_text, "en", create {MS_JUMBOTRON})
			create l_meta
			l_meta.set_name ("viewport")
			l_meta.set_content ("width=device-width, initial-scale=1")
			a_response.send (l_page)
		end

feature {NONE} -- Implementation: Constants

	moonshot_title_text: STRING = "Moonshot | Rocket Science for Everyone!"

	uri_moonshot_home: STRING = "/"
			-- `uri_moonshot_home' router template map.

	uri_moonshot_home_index_html: STRING once Result := "/" + {MS_BASE_PAGE}.Home_page end
			-- `uri_moonshot_home_index_html' router template map.
			-- Takes you to the same place as `uri_moonshot_home',
			-- but is here for links in the page, whereas the other
			-- is for the first access (e.g. www.moonshot.com).

	uri_moonshot_jumbotron: STRING once Result := "/jumbotron" end
			-- `uri_moonshot_jumbotron' for the Jumbotron router template map.

;note
	design: "[
		This is the primary Client-browser/device request router. The intent is to
		provide space for immediate handling of the web-site home-page, but then
		also for other pages (in other classes that handle the request executation).
		]"

end
