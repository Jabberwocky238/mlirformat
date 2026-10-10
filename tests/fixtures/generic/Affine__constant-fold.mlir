#map = affine_map<(d0, d1)[s0] -> (d0 floordiv 128 + s0 + d1 mod 128)>
#map1 = affine_map<(d0, d1)[s0] -> ((s0 ceildiv 128) * 128)>
#map2 = affine_map<(d0) -> (42)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index, index), sym_name = "affine_apply"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 177 : index}> : () -> index
    %1 = "arith.constant"() <{value = 211 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1075 : index}> : () -> index
    %3 = "affine.apply"(%0, %1, %2) <{map = #map}> : (index, index, index) -> index
    %4 = "affine.apply"(%0, %1, %2) <{map = #map1}> : (index, index, index) -> index
    %5 = "affine.apply"(%arg0) <{map = #map2}> : (index) -> index
    "func.return"(%3, %4, %5) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index), sym_name = "affine_min"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 42 : index}> : () -> index
    %1 = "arith.constant"() <{value = 44 : index}> : () -> index
    %2 = "affine.min"(%0, %arg0) <{map = #map}> : (index, index) -> index
    %3 = "affine.min"(%0, %1) <{map = #map}> : (index, index) -> index
    "func.return"(%2, %3) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index), sym_name = "affine_min"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 42 : index}> : () -> index
    %1 = "arith.constant"() <{value = 44 : index}> : () -> index
    %2 = "affine.max"(%0, %arg0) <{map = #map}> : (index, index) -> index
    %3 = "affine.max"(%0, %1) <{map = #map}> : (index, index) -> index
    "func.return"(%2, %3) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (d0 mod 0)>
#map1 = affine_map<(d0)[s0] -> (d0 floordiv 0)>
#map2 = affine_map<(d0)[s0] -> (d0 ceildiv 0)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "affine_apply_poison_division_zero"}> ({
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> index
    %1 = "arith.constant"() <{value = 16 : index}> : () -> index
    %2 = "affine.apply"(%1, %1) <{map = #map}> : (index, index) -> index
    %3 = "affine.apply"(%1, %1) <{map = #map1}> : (index, index) -> index
    %4 = "affine.apply"(%1, %1) <{map = #map2}> : (index, index) -> index
    %5 = "memref.alloc"(%2, %3, %4) <{operandSegmentSizes = array<i32: 3, 0>}> : (index, index, index) -> memref<?x?x?xi1>
    %6 = "affine.load"(%5, %2, %3, %4) <{map = #map3}> : (memref<?x?x?xi1>, index, index, index) -> i1
    "affine.store"(%6, %5, %2, %3, %4) <{map = #map3}> : (i1, memref<?x?x?xi1>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (d0 mod 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "affine_apply_poison_division_zero_2"}> ({
    %0 = "arith.constant"() <{value = 16 : index}> : () -> index
    %1 = "affine.apply"(%0, %0) <{map = #map}> : (index, index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

