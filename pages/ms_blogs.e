note
	description: "[

		]"

class
	MS_BLOGS

inherit
	MS_BASE_PAGE
		redefine
			content_setup
		end

feature {NONE} -- Initialization

	navigation_setup
			-- <Precursor>
		do
			last_new_nav.add_link_and_text ({MS_BASE_PAGE}.whatis_page, {MS_BASE_PAGE}.whatis_label)
			last_new_nav.add_link_and_text ({MS_BASE_PAGE}.contact_us_page, {MS_BASE_PAGE}.contact_us_label)
		end

	content_setup
			-- <Precursor>
		do
			Precursor
			last_new_article.set_class_names ("content-scrollable")
			last_new_article.add_text_content (ipsum_lorem)
		end

	ipsum_lorem: STRING = "[
<p>
Lorem Ipsum
</p>
<p>
"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
</p>
<p>
"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."
</p>
<p>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi in ante mauris. Phasellus tincidunt metus a pulvinar ornare. Proin tempus finibus volutpat. Fusce semper ipsum vestibulum aliquam commodo. In venenatis nisi fermentum congue lacinia. Nam et augue tellus. Donec sed lorem eget ligula euismod maximus ultricies vitae justo. Vestibulum id dignissim ipsum. Sed luctus eleifend nibh, et placerat diam egestas a. Fusce accumsan, diam a dapibus finibus, mi felis laoreet nulla, mollis convallis erat enim vel massa. Vestibulum luctus feugiat ipsum vitae varius. Praesent ut euismod massa.
</p>
<p>
Fusce elementum euismod dui ut placerat. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer vitae sem risus. Curabitur nulla odio, laoreet in diam sed, elementum fringilla dolor. In egestas mollis euismod. Proin dolor libero, vestibulum eu luctus vitae, laoreet ac dolor. Fusce arcu tellus, scelerisque eu risus et, blandit auctor elit. Etiam rhoncus erat sapien. Nam quis leo semper, rutrum dolor nec, suscipit metus. Pellentesque suscipit orci ut ligula ultrices, iaculis lobortis velit blandit. Proin imperdiet nulla ut laoreet commodo. Nullam vel quam vel sapien blandit egestas in et ex. Vestibulum viverra quam non mi bibendum gravida.
</p>
<p>
Sed tincidunt molestie iaculis. Maecenas in velit eget elit fringilla lacinia. Fusce fermentum accumsan dolor, sed finibus eros rhoncus sit amet. Fusce ante nunc, convallis id consequat at, rhoncus et tortor. Mauris sit amet nisl enim. Praesent et ultrices risus. Sed nec massa quis metus ultrices facilisis eget non metus. In purus libero, vulputate quis tincidunt sit amet, luctus sed ex. Donec fringilla aliquam lacus. Vivamus suscipit diam nec quam ullamcorper finibus. Mauris quis nulla sit amet velit posuere tincidunt. Morbi ipsum ex, lacinia id egestas non, elementum vel ligula. Vivamus bibendum augue odio, auctor elementum augue vestibulum ultrices. Nam eget lacus vitae sem blandit volutpat ac vel tortor. Donec sed sagittis orci.
</p>
<p>
Quisque commodo commodo dolor, non placerat ligula dignissim sit amet. Donec vel nulla tempus, interdum libero nec, maximus massa. Sed urna risus, pellentesque quis auctor non, convallis id lorem. Nullam at dapibus orci. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In tristique, nibh in tincidunt cursus, velit est dictum magna, quis posuere diam purus sed augue. Proin in nibh venenatis, laoreet nunc nec, vestibulum augue. Morbi sed bibendum massa. Maecenas in enim sit amet mi tincidunt feugiat. Curabitur condimentum ornare purus. Vestibulum elit elit, feugiat id turpis eget, ultrices mattis massa. Integer eget vehicula ante.
</p>
<p>
Sed at sollicitudin diam. Aenean sed dui et eros eleifend sollicitudin. Proin et scelerisque orci, quis condimentum nisl. Nam pretium diam magna, non maximus massa posuere ut. Nulla facilisi. Sed bibendum nulla eu massa vehicula fermentum non ut lectus. Mauris gravida lorem rutrum vestibulum vestibulum. Duis eget pretium ante. Sed non leo enim.
</p>
]"

;note
	design_intent: "[
		Intended for blogging!
		]"

end
