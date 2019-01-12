#!/usr/bin/env bats

load test_helper

@test "${FEATURE}: verbose" {
    run getopts-${BATS_TEST_DESCRIPTION##* }
    local expected_output="${output}"
    local expected_status=${status}

    run getopts_long-${BATS_TEST_DESCRIPTION##* }
    local actual_output="${output}"
    local actual_status=${status}

    test "${expected_output}" == "${actual_output}"
    test "${expected_status}" == "${actual_status}"
}

@test "${FEATURE}: silent" {
    run getopts-${BATS_TEST_DESCRIPTION##* }
    local expected_output="${output}"
    local expected_status=${status}

    run "getopts_long-${BATS_TEST_DESCRIPTION##* }"
    local actual_output="${output}"
    local actual_status=${status}

    test "${expected_output}" == "${actual_output}"
    test "${expected_status}" == "${actual_status}"
}

@test "${FEATURE}: extra arguments, verbose" {
    run getopts-${BATS_TEST_DESCRIPTION##* }  command_line_argument
    local expected_output="${output}"
    local expected_status=${status}

    run getopts_long-${BATS_TEST_DESCRIPTION##* } command_line_argument
    local actual_output="${output}"
    local actual_status=${status}

    show_output

    test "${expected_output}" == "${actual_output}"
    test "${expected_status}" == "${actual_status}"
}

@test "${FEATURE}: extra arguments, silent" {
    run getopts-${BATS_TEST_DESCRIPTION##* } command_line_argument
    local expected_output="${output}"
    local expected_status=${status}

    run getopts_long-${BATS_TEST_DESCRIPTION##* } command_line_argument
    local actual_output="${output}"
    local actual_status=${status}

    test "${expected_output}" == "${actual_output}"
    test "${expected_status}" == "${actual_status}"
}
