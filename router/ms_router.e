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
			map_uri_agent (uri_moonshot_buttons, agent moonshot_buttons_handler, no_request_methods)
			map_uri_agent (uri_moonshot_x, agent moonshot_x_handler, no_request_methods)
			map_uri_agent ("/kendo_grid", agent moonshot_kendo_grid, no_request_methods)
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
			l_body: HTML_BODY
		do
			create l_body
			l_body.add_content (create {MS_HOME})

			create l_page.make_standard (moonshot_title_text, "en", l_body)
			a_response.send (l_page)
		end

	moonshot_jumbotron_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_page' through `a_response' message based on `a_request'.
		local
			l_page: EWX_HTML_PAGE_TAG_RESPONSE
			l_body: HTML_BODY
		do
			create l_body
			l_body.add_content (create {MS_JUMBOTRON})

			create l_page.make_standard (moonshot_title_text, "en", l_body)
			a_response.send (l_page)
		end

	moonshot_buttons_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_page' through `a_response' message based on `a_request'.
		local
			l_page: EWX_HTML_PAGE_TAG_RESPONSE
			l_body: HTML_BODY
		do
			create l_body
			l_body.add_content (create {MS_BUTTONS})

			create l_page.make_standard (moonshot_title_text, "en", l_body)
			a_response.send (l_page)
		end

	moonshot_x_handler (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
			-- Send `l_page' through `a_response' message based on `a_request'.
		local
			l_page: EWX_HTML_PAGE_TAG_RESPONSE
			l_body: HTML_BODY
		do
			create l_body
			l_body.add_content (create {MS_EXPERIMENTAL})

			create l_page.make_standard (moonshot_title_text, "en", l_body)
			a_response.send (l_page)
		end

	moonshot_kendo_grid (a_request: WSF_REQUEST; a_response: WSF_RESPONSE)
		local
			l_page: EWX_HTML_PAGE_TAG_RESPONSE
		do
			create l_page.make_standard_with_raw_text ("", "en", home_page_html)
			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.common.min.css")
			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.default.min.css")
			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.default.mobile.min.css")
			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.blueopal.min.css")
			l_page.add_css_link ("http://kendo.cdn.telerik.com/2016.2.714/styles/kendo.blueopal.mobile.min.css")
			l_page.add_javascript_script ("http://kendo.cdn.telerik.com/2016.2.714/js/jquery.min.js")
			l_page.add_javascript_script ("http://kendo.cdn.telerik.com/2016.2.714/js/kendo.all.min.js")
			l_page.set_class_names ("k-black")
			a_response.send (l_page)
		end

feature {NONE} -- Constants

	home_page_html: STRING
		local
			l_file: PLAIN_TEXT_FILE
		do
			create l_file.make_open_read (".\design\html\kendo_grid.html")
			l_file.read_stream (l_file.count)
			Result := l_file.last_string.twin
			l_file.close
		end

	home_page_html_string: STRING = "[
<div id=%"example%">
    <div id=%"grid%"></div>
    <script>
        $(document).ready(function () {
            $(%"#grid%").kendoGrid({
                dataSource: {
                    type: %"odata%",
                    transport: {
                        read: %"//demos.telerik.com/kendo-ui/service/Northwind.svc/Customers%"
                    },
                    pageSize: 50
                },
                height: 850,
                groupable: true,
                sortable: true,
                pageable: {
                    refresh: true,
                    pageSizes: true,
                    buttonCount: 2
                },
                columns: [{
                    template: %"<div class='customer-photo'%" +
                                    %"style='background-image: url(http://demos.telerik.com/kendo-ui/content/web/Customers/#:data.CustomerID#.jpg);'></div>%" +
                                %"<div class='customer-name'>#: ContactName #</div>%",
                    field: %"ContactName%",
                    title: %"Contact Name%",
                    width: 240
                }, {
                    field: %"ContactTitle%",
                    title: %"Contact Title%"
                }, {
                    field: %"CompanyName%",
                    title: %"Company Name%"
                }, {
                    field: %"Country%",
                    width: 150
                }]
            });
        });
    </script>
</div>

<style type=%"text/css%">
    .customer-photo {
        display: inline-block;
        width: 32px;
        height: 32px;
        border-radius: 50%;
        background-size: 32px 35px;
        background-position: center center;
        vertical-align: middle;
        line-height: 32px;
        box-shadow: inset 0 0 1px #999, inset 0 0 10px rgba(0,0,0,.2);
        margin-left: 5px;
    }

    .customer-name {
        display: inline-block;
        vertical-align: middle;
        line-height: 32px;
        padding-left: 3px;
    }
</style>
]"

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
