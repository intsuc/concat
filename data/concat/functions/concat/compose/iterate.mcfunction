data modify storage concat: left set from storage concat: tokens[-2]
data modify storage concat: right set from storage concat: tokens[-1]

execute if data storage concat: {left: '"'} run function concat:concat/compose/escape_left.macro with storage concat:
execute if data storage concat: {left: '\\'} run function concat:concat/compose/escape_left.macro with storage concat:
execute if data storage concat: {right: '"'} run function concat:concat/compose/escape_right.macro with storage concat:
execute if data storage concat: {right: '\\'} run function concat:concat/compose/escape_right.macro with storage concat:
execute unless data storage concat: {left: '"'} \
        unless data storage concat: {left: '\\'} \
        unless data storage concat: {right: '"'} \
        unless data storage concat: {right: '\\'} \
        run function concat:concat/compose/escape_neither.macro with storage concat:

function concat:concat/compose/halve_escape.macro with storage concat:

data remove storage concat: tokens[-1]
execute if data storage concat: tokens[1] run function concat:concat/compose/iterate
