note
	description: "[
		Representation of a {MS_ROUTER}.
		]"
	design: "[
		See notes at the end of this class.
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
			map_uri_agent (uri_moonshot_contact_us, agent moonshot_contact_us_handler, no_request_methods)
			map_uri_agent (uri_moonshot_contact_data, agent moonshot_contact_data_handler, post_method_request)
			map_uri_agent (uri_moonshot_blogs, agent moonshot_blogs_handler, no_request_methods)
			map_uri_agent (uri_moonshot_whatis, agent moonshot_whatis_handler, no_request_methods)
		end

feature -- Default Execution

	execute
			-- <Precursor>
		do
			Precursor
			print ((create {DATE_TIME}.make_now).out + ": " + request.request_uri.out + "%N")
		end

feature -- Execution

	moonshot_home_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_page' through `a_response' message based on `a_request'.
		local
			l_page: EWX_HTML_PAGE_RESPONSE
		do
			create l_page.make_standard (moonshot_title_text, "en", create {MS_HOME})
			l_page.add_js_file_script (jquery_2_2_3_js_file_name)
			l_page.add_css_file_link (stylesheet_css_file_name)
			a_response.send (l_page)
		end

	moonshot_contact_us_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_page' through `a_response' message based on `a_request'.
		local
			l_page: EWX_HTML_PAGE_RESPONSE
		do
			create l_page.make_standard (moonshot_title_text, "en", create {MS_CONTACT_US}.make_restful_on_class ("contact-us", "/contact_data"))
			l_page.add_js_file_script (jquery_2_2_3_js_file_name)
			l_page.add_css_file_link (stylesheet_css_file_name)
			a_response.send (l_page)
		end

	moonshot_contact_data_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_page' through `a_response' message based on `a_request'.
		local
			l_json: STRING
			l_contact: MS_CONTACT
			l_file: PLAIN_TEXT_FILE
		do
				-- Fetch JSON from `a_request' and create an object from it.
			create l_json.make_empty
			a_request.read_input_data_into (l_json)
			create l_contact.make_from_json (l_json)

				-- Save JSON entity to disk file
			create l_file.make_create_read_write ((create {EXECUTION_ENVIRONMENT}).current_working_path.name.out + "\data\pid_" + l_contact.first_name + "_" + l_contact.last_name + ".json")
			l_file.put_string (l_contact.representation_from_current (l_contact))
			l_file.close

			print ("Content-length  : " + a_request.content_length_value.out + "%N")
			print ("Data            : " + l_json + "%N")
		end

	moonshot_blogs_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_page' through `a_response' message based on `a_request'.
		local
			l_page: EWX_HTML_PAGE_RESPONSE
		do
			create l_page.make_standard (moonshot_title_text, "en", create {MS_BLOGS})
			l_page.add_js_file_script (jquery_2_2_3_js_file_name)
			l_page.add_css_file_link (stylesheet_css_file_name)
			a_response.send (l_page)
		end

	moonshot_whatis_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_page' through `a_response' message based on `a_request'.
		local
			l_page: EWX_HTML_PAGE_RESPONSE
		do
			create l_page.make_standard (moonshot_title_text, "en", create {MS_WHAT_IS_A_MOONSHOT})
			l_page.add_js_file_script (jquery_2_2_3_js_file_name)
			l_page.add_css_file_link (stylesheet_css_file_name)
			a_response.send (l_page)
		end

feature {NONE} -- Implementation: Constants

	moonshot_title_text: STRING = "Moonshot | Rocket Science for Everyone!"

	jquery_2_2_3_js_file_name: STRING = "jquery-2.2.3.js"

	stylesheet_css_file_name: STRING = "stylesheet.css"

	uri_moonshot_home: STRING = "/"
			-- `uri_moonshot_home' router template map.

	uri_moonshot_home_index_html: STRING once Result := "/" + {MS_BASE_PAGE}.Home_page end
			-- `uri_moonshot_home_index_html' router template map.
			-- Takes you to the same place as `uri_moonshot_home',
			-- but is here for links in the page, whereas the other
			-- is for the first access (e.g. www.moonshot.com).

	uri_moonshot_contact_us: STRING once Result := "/" + {MS_BASE_PAGE}.Contact_us_page end
			-- `uri_moonshot_contact_us' for the Contact-us router template map.

	uri_moonshot_contact_data: STRING once Result := "/contact_data" end
			-- `uri_moonshot_contact_data' for the Contact-data router template map.

	uri_moonshot_blogs: STRING once Result := "/" + {MS_BASE_PAGE}.Blogs_page end
			-- `uri_moonshot_blogs' for the Blogs router template map.

	uri_moonshot_whatis: STRING once Result := "/" + {MS_BASE_PAGE}.Whatis_page end
			-- `uri_moonshot_whatis' for the What is a Moonshot? router template map.

;note
	design: "[
		This is the primary Client-browser/device request router. The intent is to
		provide space for immediate handling of the web-site home-page, but then
		also for other pages (in other classes that handle the request executation).
		]"

end
