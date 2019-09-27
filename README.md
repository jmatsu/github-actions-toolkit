# Github Actions Toolkit for ShellScript

The ShellScript flavor of https://github.com/actions/toolkit

## Usage

Use submodule, subtree or download `toolkit.sh` and run `source /path/to/toolkit.sh` in your project sources or your Dockerfile.

### Commands

**github::set_env**

```bash
github::set_env <name> <value>
echo_multilines <name_and_value_separated_by_a_single_space...> | github::set_env
```

ref: https://help.github.com/en/articles/development-tools-for-github-actions#set-an-environment-variable-set-env

**github::set_output**

```bash
github::set_output <name> <value>
echo_multilines <name_and_value_separated_by_a_single_space...> | github::set_output
```

ref: https://help.github.com/en/articles/development-tools-for-github-actions#set-an-output-parameter-set-output

**github::debug**

```bash
[file=</path/to/file> [line=<line number>]] github::debug <log message>
echo_multilines <log messages...> | [file=</path/to/file> [line=<line number>]] github::debug
```

ref: https://help.github.com/en/articles/development-tools-for-github-actions#set-a-debug-message-debug

**github::warning**

```bash
[file=</path/to/file> [line=<line number> [col=<column number>]]] github::warning <log message>
echo_multilines <log messages...> | [file=</path/to/file> [line=<line number> [col=<column number>]]] github::warning
```

ref: https://help.github.com/en/articles/development-tools-for-github-actions#set-a-warning-message-debug

**github::error**

```bash
[file=</path/to/file> [line=<line number> [col=<column number>]]] github::error <log message>
echo_multilines <log messages...> | [file=</path/to/file> [line=<line number> [col=<column number>]]] github::error
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
github::success # exist with zero code
```

**github::failure**

```bash
github::failure [exit_status] # exist with (exit_status || 1)
```

## Known limitations

For now, behaviours are tested on Bash and Zsh. And also, some of statements are not POSIX compatible so this toolkit may not work on some shells. 

## References

- https://help.github.com/en/articles/development-tools-for-github-actions