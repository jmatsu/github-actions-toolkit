# Github Actions Toolkit for ShellScript

The ShellScript flavor of https://github.com/actions/toolkit

## Usage

Use submodule, subtree or download `toolkit.sh` and run `source /path/to/toolkit.sh` in your project sources or your Dockerfile.

## References

- https://help.github.com/en/articles/development-tools-for-github-actions

## Known limitations

For now, behaviours are tested on Bash. However, some of statements may not be POSIX compatible so this toolkit won't work on some shells. 

## Development

No special step is required to set up.
Please modify `test/*.bats` to assure the validity of your changes and make sure `bin/run_test.bash` succeeds.

### Commands

**github::set_env**

```bash
github::set_env <name> <value>
cat<<EOF | github::set_env
<name> <value>
<name> <value>
...
EOF
```

ref: https://help.github.com/en/articles/development-tools-for-github-actions#set-an-environment-variable-set-env

**github::set_output**

```bash
github::set_output <name> <value>
cat<<EOF | github::set_output
<name> <value>
<name> <value>
...
EOF
```

ref: https://help.github.com/en/articles/development-tools-for-github-actions#set-an-output-parameter-set-output

**github::debug**

```bash
[file=</path/to/file> [line=<line number>]] github::debug <log message>
cat<<EOF | [file=</path/to/file> [line=<line number>]] github::debug
<log message>
<log message>
...
EOF
```

ref: https://help.github.com/en/articles/development-tools-for-github-actions#set-a-debug-message-debug

**github::warning**

```bash
[file=</path/to/file> [line=<line number> [col=<column number>]]] github::warning <log message>
cat<<EOF | [file=</path/to/file> [line=<line number> [col=<column number>]]] github::warning
<log message>
<log message>
...
EOF
```

ref: https://help.github.com/en/articles/development-tools-for-github-actions#set-a-warning-message-debug

**github::error**

```bash
[file=</path/to/file> [line=<line number> [col=<column number>]]] github::error <log message>
cat<<EOF | [file=</path/to/file> [line=<line number> [col=<column number>]]] github::error
<log message>
<log message>
...
EOF
```

ref: https://help.github.com/en/articles/development-tools-for-github-actions#set-a-error-message-debug

**github::add_mask**

```bash
github::add_mask <a value to be masked>
echo <a value to be masked> | github::add_mask # only first line will be masked
```

ref: https://help.github.com/en/articles/development-tools-for-github-actions#mask-a-value-in-log-add-mask

**github::stop_commands**

```bash
github::stop_commands <endtoken>
```

ref: https://help.github.com/en/articles/development-tools-for-github-actions#stop-and-start-log-commands-stop-commands

**github::resume_commands**

```bash
github::resume_commands <endtoken>
```

ref: https://help.github.com/en/articles/development-tools-for-github-actions#example-starting-log-commands

**github::success**

```bash
github::success # exit with zero code
```

**github::failure**

```bash
github::failure [exit_status] # exit with (exit_status || 1)
```
