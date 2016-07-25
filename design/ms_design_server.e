note
	description: "[
		Representation of a template Web Server {MS_SERVER}  
			as a {WSF_DEFAULT_SERVICE} using {MS_ROUTER} as
			a router/responder.
		]"

class
	MS_DESIGN_SERVER

inherit
	WSF_DEFAULT_SERVICE [MS_DESIGN_ROUTER]
		redefine
			initialize
		end

create
	make_and_launch

feature {NONE} -- Initialization

	initialize
			-- `initialize' Current with optional "options".
		do
			create {WSF_SERVICE_LAUNCHER_OPTIONS} service_options.make_from_array (<<["port", 80]>>)
			Precursor
		end

note
	design: "[
		This class inherits: WSF_DEFAULT_SERVICE [APP_EXECUTION], 
		which answers two important questions:
		
		(1) What process (program) will be the Web Server (httpd)? 	--> {WSF_DEFAULT_SERVICE}
		(2) What process (program) will route request messages 
				coming through the Web Server and then serve up
				responses to the Web Client?						--> {MS_ROUTER}
		
		See the {MS_ROUTER} class for more details about request
		routing and reponse building-and-sending.
		]"

end
