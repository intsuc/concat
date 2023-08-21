data modify storage concat: left set from storage concat: tokens[-2]
data modify storage concat: right set from storage concat: tokens[-1]

function concat:concat/compose/escape_left.macro with storage concat:

execute if data storage concat: tokens[1] run function concat:concat/compose/iterate_neither
