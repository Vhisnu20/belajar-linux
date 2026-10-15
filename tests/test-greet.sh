#!/bin/bash
# Tests for greet.sh

# Always run from repo root, wherever this script is called from
cd "$(dirname "$0")/.." || exit 1

PASS=0
FAIL=0

check() {
    local desc="$1"
    local expected="$2"
    local actual="$3"

    if [ "$expected" = "$actual" ]; then
        echo "PASS: $desc"
        PASS=$((PASS + 1))
    else
        echo "FAIL: $desc (expected '$expected', got '$actual')"
        FAIL=$((FAIL + 1))
    fi
}

# Test 1: no name given
output=$(./greet.sh)
code=$?
check "no name -> exit code 1" "1" "$code"
check "no name -> error message" "No name given" "$output"

# Test 2: name given
output=$(./greet.sh Fadhil)
code=$?
check "with name -> exit code 0" "0" "$code"
check "with name -> greeting" "Hello Fadhil" "$output"

echo "Result: $PASS passed, $FAIL failed"

if [ "$FAIL" -gt 0 ]; then
    exit 1
fi
