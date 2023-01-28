#! /usr/bin/env bats
#
# Usage: ./base-tests.bats [script-under-test]
#
# This is a BATS test suite that checks some requirements for the script under
# test, like the existence of certain functions and variables. If you don't want
# to test for these things, just add the "skip" command to the test.
#
# Author: Bert Van Vreckem <bert (dot) vanvreckem (at) hogent (dot) be>

#---------- Variables ----------------------------------------------------------

# The script under test
SUT="${1:-hello-world.sh}"

# List of variable names that are expected to be declared in the script
# WARNING: This test is not foolproof. It will not fail on local variables that
#   are declared within a function.
expected_variables=(
    name
)

# List of function names that are expected to be present in the script
expected_functions=(
    usage
    main
)

#---------- Functions ----------------------------------------------------------

#---------- Tests --------------------------------------------------------------


@test "The script should contain the expected functions" {
    echo "Checking for functions: ${expected_functions[*]}"

    for function in "${expected_functions[@]}"; do
        echo "Checking for function ${function}()"

        # Check for two variants of function declaration:
        #  - foo() { ... }
        #  - function foo { ... }
        grep -nH "^${function}()" "${SUT}" \
            || grep -nH "^function ${function}" "${SUT}"
    done
}

@test "The script should contain the expected variables" {
    echo "Checking for variables: ${expected_variables[*]}"

    for variable in "${expected_variables[@]}"; do
        echo "Searching for assignment of variable ${variable}"
        grep -nH "${variable}=[^ ]" "${SUT}"
    done
}