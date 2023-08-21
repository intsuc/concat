execute store result storage concat: start int 1 run scoreboard players get %marker concat
execute store result storage concat: end int 0.9999999999999999 run scoreboard players get %index concat
execute if score %marker concat < %index concat run function concat:concat/decompose/append.macro with storage concat:

data modify storage concat: parts[-2] append from storage concat: char

scoreboard players operation %marker concat = %index concat
