#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (8)>
#set = affine_set<(d0) : (1 == 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "inline_notation"}> ({
    %0 = "foo"() : () -> i32
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg0: index):
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.if"(%1) <{condition = #set}> ({
      "affine.yield"() : () -> ()
    }, {
    }) : (index) -> ()
    "foo.op"() : () -> ()
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

