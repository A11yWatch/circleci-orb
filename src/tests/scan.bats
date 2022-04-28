# Runs prior to every test
setup() {
    # Load our script file.
    source ./src/scripts/scan.sh
}

@test '1: Scan a target website' {
    # Mock environment variables or functions by exporting them (after the script has been sourced)
    export PARAM_TO="https://a11ywatch.com"
    # Capture the output of our "Scan" function
    result=$(Scan)
    [ "$result" ]
}