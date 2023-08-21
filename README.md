# <samp>concat</samp>

Concatenates two strings in storage.

## Usage

```mcfunction
data modify storage concat: first set value "'hello' \\ "
data modify storage concat: second set value '"world"'
function concat:concat

data get storage concat: result
#> Storage concat: has the following contents: "'hello' \\ \"world\""
```

## Algorithm

### Fast path

1. Attempt concatenation with double quotes using the macro `"$(first)$(second)"`.
2. Attempt concatenation with single quotes using the macro `'$(first)$(second)'`.

### Slow path

1. Decompose `first` and `second` into substrings containing only characters that need not to be escaped or a character that needs to be escaped (`"` and/or `\`).
2. If the last part of `first` and the first part of `second` are both substrings that don't need to be escaped, compose them.
3. Generate an escaping string containing only backslashes (`\`) of a length that exactly *survives* the composition of these substrings.
4. Compose the substrings two by two from the end.
    1. There are three ways of composition: adding the escaping string to the left side only, adding the escaping string to the right side only, and adding the escaping string to neither side.
    2. Halve the length of the escaping string after each composition.
5. Once there is only one substring left, this is the result.

## Complexity

> TODO
