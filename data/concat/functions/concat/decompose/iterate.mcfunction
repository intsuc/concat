execute store result storage concat: start int 1 run scoreboard players get %index concat
execute store result storage concat: end int 1 run scoreboard players add %index concat 1
function concat:concat/decompose/char_at.macro with storage concat:

execute if data storage concat: {char: '"'} run function concat:concat/decompose/split
execute if data storage concat: {char: '\\'} run function concat:concat/decompose/split

execute if score %index concat < %length concat run function concat:concat/decompose/iterate
