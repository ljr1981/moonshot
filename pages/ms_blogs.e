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
		local
			l_file: PLAIN_TEXT_FILE
			l_blog: MS_BLOG
			l_blog_entry_as_json: STRING
			l_directory: DIRECTORY
			l_path: PATH
			l_env: EXECUTION_ENVIRONMENT
		do
			create l_env
			create l_path.make_from_string (".\blogs")
			create l_directory.make_with_path (l_path)

			new_article.set_class_names ("content-scrollable")

			across
				l_directory.entries as ic_entries
			loop
				if
					attached {PATH} ic_entries.item as al_entry and then
					attached al_entry.extension as al_ext and then
					al_ext.same_string ("json")
				then
						-- Fetch json blog entry content
					create l_file.make_open_read (l_env.current_working_path.name + "\blogs\" + al_entry.name)
					l_file.read_stream (l_file.count)
					l_blog_entry_as_json := l_file.last_string
					l_file.close
						-- Build blog entry
					create l_blog.make_from_json (l_blog_entry_as_json)
					new_hx.as_h1
					last_new_hx.add_text_content (l_blog.title)
					last_new_article.add_content (last_new_hx)

					new_hx.as_h5
					last_new_hx.add_text_content (l_blog.author)
					last_new_article.add_content (last_new_hx)

					new_hx.as_h6
					last_new_hx.add_text_content (l_blog.date)
					last_new_article.add_content (last_new_hx)

					last_new_article.add_content (new_hr)
					last_new_article.add_text_content (l_blog.entry)
					last_new_article.add_content (new_hr)
				end
			end

			add_content (last_new_article)
		end

note
	design_intent: "[
		Intended for blogging!
		]"

end
