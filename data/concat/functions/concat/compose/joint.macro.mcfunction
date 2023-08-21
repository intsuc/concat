$data modify storage concat: parts[1][0] set value "$(left)$(right)"
data remove storage concat: parts[0][-1]
