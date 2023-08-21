$data modify storage concat: escape set value "$(escape)$(escape)$(escape)$(escape)"
scoreboard players remove %length concat 1
execute if score %length concat matches 2.. run function concat:concat/compose/double_escape.macro with storage concat:
