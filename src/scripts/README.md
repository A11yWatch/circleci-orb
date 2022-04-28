# scripts/

This is where any scripts you wish to include in your orb can be kept. This is encouraged to ensure your orb can have all aspects tested, and is easier to author, since we sacrifice most features an editor offers when editing scripts as text in YAML.

As a part of keeping things seperate, it is encouraged to use environment variables to pass through parameters, rather than using the `<< parameter. >>` syntax that CircleCI offers.

# Including Scripts

Utilizing the `circleci orb pack` CLI command, it is possible to import files (such as _shell scripts_), using the `<<include(scripts/script_name.sh)>>` syntax in place of any config key's value. Make sure to have the `a11ywatch_cli` installed before running.

```yaml
# commands/scan.yml
description: >
  This command runs a11ywatch scan against a website
parameters:
  to:
    type: string
    default: "www.a11ywatch.com"
    description: "A website url"
steps:
  - run:
      environment:
        PARAM_TO: <<parameters.to>
      name: Hello <<parameters.to>
      command: <<include(scripts/scan.sh)>>
```

```shell
# scripts/scan.sh
Scan() {
   a11ywatch scan --url "${PARAM_TO}" -s
}

# Will not run if sourced from another script. This is done so this script may be tested.
# View src/tests for more information.
if [[ "$_" == "$0" ]]; then
    Scan
fi
```
