scoreboard objectives add concat dummy

# Fast path

data remove storage concat: result

execute store result score %expected concat run data get storage concat: first
execute store result score %actual concat run data get storage concat: second
scoreboard players operation %expected concat += %actual concat

function concat:concat/single_quotes.macro with storage concat:
execute store result score %actual concat run data get storage concat: result
execute if score %expected concat = %actual concat if data storage concat: result run return 1

function concat:concat/double_quotes.macro with storage concat:
execute store result score %actual concat run data get storage concat: result
execute if score %expected concat = %actual concat if data storage concat: result run return 2

# Slow path

data modify storage concat: parts set value [[], []]
data modify storage concat: decompose set from storage concat: first
function concat:concat/decompose with storage concat:

data modify storage concat: parts append value []
data modify storage concat: decompose set from storage concat: second
function concat:concat/decompose with storage concat:

function concat:concat/compose
data modify storage concat: result set from storage concat: tokens[0]
data remove storage concat: tokens
