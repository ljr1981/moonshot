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

	LE_LOGGING_AWARE

create
	make

feature {NONE} -- Initialization

	setup_router
			-- <Precusor>
		do
			logger.write_information ("START: {" + generating_type.out + "}.setup_router")
			Precursor
			map_uri_agent (uri_moonshot_home, agent moonshot_home_handler, no_request_methods)
			map_uri_agent (uri_moonshot_home_index_html, agent moonshot_home_handler, no_request_methods)
			map_uri_agent (uri_moonshot_jumbotron, agent moonshot_jumbotron_handler, no_request_methods)
			map_uri_agent (uri_moonshot_buttons, agent moonshot_buttons_handler, no_request_methods)
			map_uri_agent (uri_moonshot_x, agent moonshot_x_handler, no_request_methods)
			map_uri_agent ("/kendo_grid", agent moonshot_kendo_grid, no_request_methods)
			logger.write_information ("END: {" + generating_type.out + "}.setup_router")
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
			l_page: MS_HOME
		do
			logger.write_information ("START: {" + generating_type.out + "}.moonshot_home_handler")
			print (a_request.request_uri + "%N")
			create l_page.make_standard (moonshot_title_text, "en", create {HTML_DIV})
			logger.write_information ("SEND: {" + generating_type.out + "}.moonshot_home_handler")
			a_response.send (l_page)
			logger.write_information ("END: {" + generating_type.out + "}.moonshot_home_handler")
		end

	moonshot_jumbotron_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_page' through `a_response' message based on `a_request'.
		local
--			l_page: EWX_HTML_PAGE_TAG_RESPONSE
--			l_body: HTML_BODY
		do
--			create l_body
--			l_body.add_content (create {MS_JUMBOTRON})

--			create l_page.make_standard (moonshot_title_text, "en", l_body)
--			a_response.send (l_page)
		end

	moonshot_buttons_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_page' through `a_response' message based on `a_request'.
		local
--			l_page: EWX_HTML_PAGE_TAG_RESPONSE
--			l_body: HTML_BODY
		do
--			create l_body
--			l_body.add_content (create {MS_BUTTONS})

--			create l_page.make_standard (moonshot_title_text, "en", l_body)
--			a_response.send (l_page)
		end

	moonshot_x_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_page' through `a_response' message based on `a_request'.
		local
--			l_page: EWX_HTML_PAGE_TAG_RESPONSE
--			l_body: HTML_BODY
		do
--			create l_body
--			l_body.add_content (create {MS_EXPERIMENTAL})

--			create l_page.make_standard (moonshot_title_text, "en", l_body)
--			a_response.send (l_page)
		end

	moonshot_kendo_grid (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
		local
--			l_page: EWX_HTML_PAGE_TAG_RESPONSE
		do
--			create l_page.make_standard_with_raw_text ("", "en", home_page_html)
--			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.common.min.css")
--			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.default.min.css")
--			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.default.mobile.min.css")
--			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.blueopal.min.css")
--			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.blueopal.mobile.min.css")
--			l_page.add_javascript_script ("http://kendo.cdn.telerik.com/2016.2.714/js/jquery.min.js")
--			l_page.add_javascript_script ("http://kendo.cdn.telerik.com/2016.2.714/js/kendo.all.min.js")
--			l_page.set_class_names ("k-black")
--			a_response.send (l_page)
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

	uri_moonshot_buttons: STRING once Result := "/buttons" end
			-- `uri_moonshot_buttons' for the buttons router template map.

	uri_moonshot_x: STRING once Result := "/x" end
			-- `uri_moonshot_x' for the x router template map.

;note
	design: "[
		This is the primary Client-browser/device request router. The intent is to
		provide space for immediate handling of the web-site home-page, but then
		also for other pages (in other classes that handle the request executation).
		]"

end
