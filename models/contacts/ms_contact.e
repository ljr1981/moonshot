note
	description: "[
		Representation of an effected {MS_CONTACT}.
		]"

class
	MS_CONTACT

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

				first_name := json_object_to_json_string_representation_attached ("first_name", l_object)
				last_name := json_object_to_json_string_representation_attached ("last_name", l_object)

				quote := json_object_to_json_string_representation ("quote", l_object)
				response_needed := json_object_to_json_string_representation ("response_needed", l_object)
				interests := fill_favorite_foods (json_object_to_tuple_as_json_array ("interests", l_object))
			end

feature -- Setters

		fill_favorite_foods (a_json_array: JSON_ARRAY): ARRAY [STRING_8]
				-- Sets `my_list' from  `a_json_array'.
			local
				i: INTEGER
			do
				create Result.make_empty
				from i := 1
				until i > a_json_array.count
				loop
					Result.force (strip_json_quotes (a_json_array.i_th (i).representation.twin), i)
					i := i + 1
				end
			end

feature {NONE} -- Implementation: JSON

	convertible_features (a_current: ANY): ARRAY [STRING]
			-- <Precursor>
		once
			Result := <<"first_name",
						"last_name",
						"quote",
						"interests",
						"response_needed"
						>>
		end

	metadata (a_current: ANY): ARRAY [JSON_METADATA]
		do
			Result := <<
						create {JSON_METADATA}.make_text_default,
						create {JSON_METADATA}.make_text_default,
						create {JSON_METADATA}.make_text_default,
						create {JSON_METADATA}.make_text_default,
						create {JSON_METADATA}.make_text_default
						>>
		end

feature -- Access

	first_name: STRING attribute create Result.make_empty end
	last_name: STRING attribute create Result.make_empty end
	quote: detachable STRING attribute create Result.make_empty end
	interests: ARRAY [STRING] attribute create Result.make_empty end
	response_needed: detachable STRING attribute create Result.make_empty end

note
	design_intent: "[
		This class is intended to model a Moonshot Software visitor who wants to contact us.
		]"

end
