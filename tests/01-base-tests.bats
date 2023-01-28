#! /usr/bin/env bats
#
# Usage: ./base-tests.bats [script-under-test]
#
# Reusable basic tests for Bash scripts. Change the values of the variables
# as appropriate for the script under test. The name of the script under test
# can be passed as a command line argument, otherwise the default value is used.
#
# The idea is that these tests MUST all pass before we consider checking whether
# the script does what it is supposed to do.
#
# Author: Bert Van Vreckem <bert (dot) vanvreckem (at) hogent (dot) be>
# 

#---------- Variables ----------------------------------------------------------

# The script under test
SUT="${1:-hello-world.sh}"

#---------- Functions ----------------------------------------------------------

#---------- Tests --------------------------------------------------------------

@test "The script should exist" {
  [ -f "${SUT}" ]
}

@test "The script should be executable" {
  [ -x "${SUT}" ]
}

@test "The script should have a shebang on the first line" {
    head -n 1 "${SUT}" | grep '^#!'
}

@test "The script should have a shebang with a valid interpreter" {
    head -n 1 "${SUT}" | grep '^#!.*sh'
}

@test "The script should not have syntax errors" {
    # First, use Bash's built-in syntax checker
    bash -n "${SUT}"

    # Then, use ShellCheck to check for more advanced syntax errors
    shellcheck --severity=error "${SUT}"
}
