data modify storage concat: left set from storage concat: parts[0][-1]
data modify storage concat: right set from storage concat: parts[1][0]
execute unless data storage concat: {left: '"'} \
        unless data storage concat: {left: '\\'} \
        unless data storage concat: {right: '"'} \
        unless data storage concat: {right: '\\'} \
        run function concat:concat/compose/joint.macro with storage concat:

data modify storage concat: tokens append from storage concat: parts[][]
data remove storage concat: parts

data modify storage concat: escape set value '\\'
execute store result score %length concat run data get storage concat: tokens
function concat:concat/compose/double_escape.macro with storage concat:
data modify storage concat: escape set string storage concat: escape 1

data modify storage concat: left set from storage concat: tokens[-2]
data modify storage concat: right set from storage concat: tokens[-1]
execute if data storage concat: {right: '"'} run function concat:concat/compose/escape_right.macro with storage concat:
execute if data storage concat: {right: '\\'} run function concat:concat/compose/escape_right.macro with storage concat:

execute if data storage concat: tokens[1] run function concat:concat/compose/iterate_left

data remove storage concat: left
data remove storage concat: right
data remove storage concat: escape
