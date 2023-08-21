data modify storage concat: start set value 0
execute store result storage concat: end int 0.9999999999999999 run scoreboard players get %index concat
execute if score %index concat matches 2.. run function concat:concat/decompose/append with storage concat:

data modify storage concat: parts append from storage concat: char
execute store result storage concat: start int 1 run scoreboard players get %index concat
function concat:concat/decompose/shift with storage concat:
