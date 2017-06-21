note
	description: "[
		Representation of an effected {MS_BLOG}.
		]"

class
	MS_BLOG

inherit
	JSON_SERIALIZABLE

	JSON_DESERIALIZABLE

create
	make_from_json

feature {NONE} -- Initialization

		make_from_json (a_json: STRING)
				-- <Precursor>
			require else
				implemented: True
			local
				l_object: detachable JSON_OBJECT
				l_any: detachable ANY
			do
				l_object := json_string_to_json_object (a_json)
				check attached_object: attached l_object end

				title := json_object_to_json_string_representation_attached ("title", l_object)
				author := json_object_to_json_string_representation_attached ("author", l_object)
				date := json_object_to_json_string_representation_attached ("date", l_object)
				entry := json_object_to_json_string_representation_attached ("entry", l_object)
			end

feature {NONE} -- Implementation: JSON

	convertible_features (a_current: ANY): ARRAY [STRING]
			-- <Precursor>
		once
			Result := <<
						"title",
						"author",
						"date",
						"entry"
						>>
		end

	metadata (a_current: ANY): ARRAY [JSON_METADATA]
		do
			Result := <<
						create {JSON_METADATA}.make_text_default,
						create {JSON_METADATA}.make_text_default,
						create {JSON_METADATA}.make_text_default,
						create {JSON_METADATA}.make_text_default
						>>
		end

feature -- Access

	title,
	author,
	date,
	entry: STRING
			-- `entry' as {MS_BLOG} for {MS_BLOGS} page.
		attribute
			create Result.make_empty
		end

note
	design_intent: "[
		This is a blog-entry for Moonshot.
		]"

end
