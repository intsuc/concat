data remove storage concat: result

# Fast path

function concat:concat/double with storage concat:
execute if data storage concat: result run return 1

function concat:concat/single with storage concat:
execute if data storage concat: result run return 1

# Slow path

data remove storage concat: parts

data modify storage concat: decompose set from storage concat: first
function concat:concat/decompose with storage concat:

data modify storage concat: decompose set from storage concat: second
function concat:concat/decompose with storage concat:

# TODO: Generate backslashes and concatenate parts
