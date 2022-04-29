Scan() {
   a11ywatch scan --url "${PARAM_TO}" -s
}

ORB_TEST_ENV="bats-core"
if [ "${0#*$ORB_TEST_ENV}" == "$0" ]; then
    Scan
fi
