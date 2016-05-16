note
	description: "Tests of {MOONSHOT}."
	testing: "type/manual"

class
	MOONSHOT_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

	TEST_SET_BRIDGE
		undefine
			default_create
		end

feature -- Test routines

	MOONSHOT_tests
			-- `MOONSHOT_tests'
		do
			do_nothing -- yet ...
		end

end
