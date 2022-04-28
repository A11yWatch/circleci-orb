# Commands

Easily add and author [Reusable Commands](https://circleci.com/docs/2.0/reusing-config/#authoring-reusable-commands) to the `src/commands` directory. Make sure to have the A11yWatch cli installed by running
`cargo install a11ywatch_cli` first.

Each _YAML_ file within this directory will be treated as an orb command, with a name which matches its filename.

View the included _[scan.yml](./scan.yml)_ example.

```yaml
description: >
  Replace this text with a description for this command.
  # What will this command do?
  # Descriptions should be short, simple, and clear.
parameters:
  to:
    type: string
    default: "https://a11ywatch.com"
    description: "A website url to scan"
steps:
  - run:
      name: Scan
      command: a11ywatch scan << parameters.to >>
```

## See:

- [Orb Author Intro](https://circleci.com/docs/2.0/orb-author-intro/#section=configuration)
- [How to author commands](https://circleci.com/docs/2.0/reusing-config/#authoring-reusable-commands)
