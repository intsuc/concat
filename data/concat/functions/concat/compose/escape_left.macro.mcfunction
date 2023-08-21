$data modify storage concat: tokens[-2] set value "$(escape)$(left)$(right)"
data remove storage concat: tokens[-1]

function concat:concat/compose/halve_escape.macro with storage concat:
