module [fromList, toList]

Tree : [Leaf U8, Left Tree, Right Tree]

fromList : List U8 -> Tree
fromList = \elements ->
    crash "Please implement 'toTree'"

toList : Tree -> List U8
toList = \tree ->
    crash "Please implement 'toList'"
