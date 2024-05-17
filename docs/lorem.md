---
sidebar_position: 6
title: Lorem Ipsum
---

# Lorem Ipsum Example Container

This is an example container that generates a lot of text using the Lorem Ipsum generator.

## Environment variables

- `LOREM`: The arguments for lipsum.sh. (default: "paragraphs 10 -m 4 -M 6 -w 8 -W 10")
- `REPEAT`: The number of times to repeat the lorem output. (default: 1)
- `INFINITE`: If set to `true`, the dice will roll forever. (default: false)
- `SLEEP`: The duration between each roll in seconds. (default: 0.2)
- `QUIET`: If set to `true`, the dice will not output the result of each roll. (default: false)
- `LOG_JSON`: If set to `true`, the dice will output the result of each roll in JSON format. (default: false)
- 'LOG_COLOR': If set to `true`, the dice will output the result of each roll in color. Ignored if `LOG_JSON` is set. (default: false)
- `TERMINATE_SLEEP`: The duration to sleep before terminating the job. (default: 0)

For `lipsum.sh` see [lipsum-shell](https://github.com/alexchantastic/lipsum-shell) or following.

## Running with docker

```bash
docker run --rm mhus/example-lorem:latest
```

## Running with kubernetes

```bash
kubectl run dice --image=mhus/example-lorem:latest --restart=Never
```

## lipsum-shell Usage

```sh
lipsum <command> [count] [-m|M|w|W|h|v]

# Generate 10 characters
lipsum characters 10

# Generate 10 words
lipsum words 10

# Generate 10 sentences with 8 to 12 words
lipsum sentences 10 -m 8 -M 12

# Generate 10 paragraphs with 4 to 6 sentences that are 8 to 10 words
lipsum paragraphs 10 -m 4 -M 6 -w 8 -W 10
```

### Commands

| Command | Description |
| --- | --- |
| `characters` | Generate characters |
| `words` | Generated words |
| `sentences` | Generate sentences |
| `paragraphs` | Generate paragraphs |
| `help` | Show help |
| `version` | Show version |

Structure commands also have the following aliases:

| Type | Aliases |
| --- | --- |
| Characters | `characters`, `character`, `char`, `c` |
| Words | `words`, `word`, `w` |
| Sentences | `sentences`, `sentence`, `sent`, `s` |
| Paragraphs | `paragraphs`, `paragraph`, `para`, `p` |

### Arguments

| Argument | Description | Default |
| --- | --- | --- |
| `count` | Number of structures to generate | `1` |

### Options

| Name | Description |
| --- | --- |
| `-m` | Minimum number of structures to generate (applies to sentence and paragraph only) |
| `-M` | Maximum number of structures to generate (applies to sentence and paragraph only) |
| `-w` | Minimum number of words to generate per sentence (applies to paragraph only) |
| `-W` | Maximum number of words to generate per sentence (applies to paragraph only) |
| `-v` | Print version |
| `-h` | Print help |

#### Defaults

| Type | Option | Value |
| --- | --- | --- |
| Sentences | `-m` | 4 |
| Sentences | `-M` | 8 |
| Paragraphs | `-m` | 5 |
| Paragraphs | `-M` | 10 |
| Paragraphs | `-w` | 4 |
| Paragraphs | `-W` | 8 |

## lipsum-shell License

Code released under the [MIT License](https://github.com/alexchantastic/lipsum-shell/blob/master/LICENSE).


