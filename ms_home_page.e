note
	description: "[

		]"

class
	MS_HOME_PAGE

inherit
	HTML_DIV
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			Precursor
			add_text_content (home_page_div)
		end

feature {NONE} -- Implementation: Constants

	home_page_div: STRING = "[
<div class="stars">
	<header>
		<a href="#" id="logo"></a>
	
	<nav>
		<ul>
			<li><a href="#">What Is a Moonshot?</li>
			<li><a href="#">Blog</li>
			<li><a href="#">Contact Us</li>
		</ul>
	<nav>

	</header>
	
	<div class="content">
	</div>
	
	<div class="footer">
	</div>

</div>
]"

end
