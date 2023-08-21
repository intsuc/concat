scoreboard players set %marker concat 0
scoreboard players set %index concat 0
execute store result score %length concat run data get storage concat: decompose
function concat:concat/decompose/iterate

execute store result storage concat: start int 1 run scoreboard players get %marker concat
execute store result storage concat: end int 1 run scoreboard players get %length concat
execute if score %marker concat < %length concat run function concat:concat/decompose/append.macro with storage concat:

data remove storage concat: start
data remove storage concat: end
data remove storage concat: char
data remove storage concat: decompose
