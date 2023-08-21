data remove storage concat: result

# Fast path

function concat:concat/double_quotes.macro with storage concat:
execute if data storage concat: result run return 1

function concat:concat/single_quotes.macro with storage concat:
execute if data storage concat: result run return 1

# Slow path

scoreboard objectives add concat dummy

data modify storage concat: parts set value [[], []]
data modify storage concat: decompose set from storage concat: first
function concat:concat/decompose with storage concat:

data modify storage concat: parts append value []
data modify storage concat: decompose set from storage concat: second
function concat:concat/decompose with storage concat:

function concat:concat/compose
data modify storage concat: result set from storage concat: tokens[0]
data remove storage concat: tokens

scoreboard players reset %index concat
scoreboard players reset %marker concat
scoreboard players reset %length concat
scoreboard objectives remove concat
