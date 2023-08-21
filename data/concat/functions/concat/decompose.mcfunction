scoreboard players set %index concat 0
execute store result score %length concat run data get storage concat: decompose
function concat:concat/decompose/iterate

execute unless data storage concat: {decompose: ""} run data modify storage concat: parts append from storage concat: decompose
