#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "fully_static_bounds"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 17 : index}> : () -> index
    %4 = "scf.for"(%1, %3, %2, %0) ({
    ^bb0(%arg0: index, %arg1: i32):
      %5 = "affine.min"(%3, %arg0, %2) <{map = #map}> : (index, index, index) -> index
      %6 = "arith.index_cast"(%5) : (index) -> i32
      %7 = "arith.addi"(%arg1, %6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%7) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi32>) -> i32, sym_name = "static_two_iterations_ub_used_in_loop"}> ({
  ^bb0(%arg0: memref<1xi32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 7 : index}> : () -> index
    %4 = "scf.for"(%1, %3, %2, %0) ({
    ^bb0(%arg1: index, %arg2: i32):
      %5 = "affine.min"(%3, %arg1, %2) <{map = #map}> : (index, index, index) -> index
      %6 = "arith.index_cast"(%5) : (index) -> i32
      %7 = "arith.addi"(%arg2, %6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %8 = "memref.load"(%arg0, %3) : (memref<1xi32>, index) -> i32
      %9 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%9) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<i32>) -> (), sym_name = "no_loop_results"}> ({
  ^bb0(%arg0: index, %arg1: memref<i32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    "scf.for"(%1, %arg0, %2) ({
    ^bb0(%arg2: index):
      %3 = "affine.min"(%arg0, %arg2, %2) <{map = #map}> : (index, index, index) -> index
      %4 = "memref.load"(%arg1) : (memref<i32>) -> i32
      %5 = "arith.index_cast"(%3) : (index) -> i32
      %6 = "arith.addi"(%4, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%6, %arg1) : (i32, memref<i32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> i32, sym_name = "fully_dynamic_bounds"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "scf.for"(%arg0, %arg1, %arg2, %0) ({
    ^bb0(%arg3: index, %arg4: i32):
      %2 = "affine.min"(%arg1, %arg3, %arg2) <{map = #map}> : (index, index, index) -> index
      %3 = "arith.index_cast"(%2) : (index) -> i32
      %4 = "arith.addi"(%arg4, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%4) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "two_iteration_example"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 8 : index}> : () -> index
    %4 = "scf.for"(%1, %3, %2, %0) ({
    ^bb0(%arg0: index, %arg1: i32):
      %5 = "affine.min"(%3, %arg0, %2) <{map = #map}> : (index, index, index) -> index
      %6 = "arith.index_cast"(%5) : (index) -> i32
      %7 = "arith.addi"(%arg1, %6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%7) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "no_peeling_front"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "scf.for"(%1, %3, %2, %0) ({
    ^bb0(%arg0: index, %arg1: i32):
      %5 = "affine.min"(%3, %arg0, %2) <{map = #map}> : (index, index, index) -> index
      %6 = "arith.index_cast"(%5) : (index) -> i32
      %7 = "arith.addi"(%arg1, %6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%7) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

