"builtin.module"() ({
  "func.func"() <{function_type = () -> (i32, i32), sym_name = "fold_and_merge"}> ({
    %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    %3 = "arith.constant"() <{value = 6 : i32}> : () -> i32
    "func.return"(%2, %3) : (i32, i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (f32, f32), sym_name = "materialize_different_dialect"}> ({
    %0 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %1 = "math.absf"(%0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
    %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "func.return"(%1, %2) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (8)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8xi32>) -> (), sym_name = "materialize_in_front"}> ({
  ^bb0(%arg0: memref<8xi32>):
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg1: index):
      %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %1 = "arith.constant"() <{value = 5 : i32}> : () -> i32
      %2 = "arith.addi"(%0, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%2, %arg0, %arg1) : (i32, memref<8xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

