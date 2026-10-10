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
  "func.func"() <{function_type = () -> i32, sym_name = "fully_static_bounds_integers"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 17 : i32}> : () -> i32
    %4 = "scf.for"(%1, %3, %2, %0) ({
    ^bb0(%arg0: i32, %arg1: i32):
      %5 = "arith.index_cast"(%3) : (i32) -> index
      %6 = "arith.index_cast"(%arg0) : (i32) -> index
      %7 = "arith.index_cast"(%2) : (i32) -> index
      %8 = "affine.min"(%5, %6, %7) <{map = #map}> : (index, index, index) -> index
      %9 = "arith.index_cast"(%8) : (index) -> i32
      %10 = "arith.addi"(%arg1, %9) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%10) : (i32) -> ()
    }) : (i32, i32, i32, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> i32, sym_name = "dynamic_upper_bound"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "scf.for"(%1, %arg0, %2, %0) ({
    ^bb0(%arg1: index, %arg2: i32):
      %4 = "affine.min"(%arg0, %arg1, %2) <{map = #map}> : (index, index, index) -> index
      %5 = "arith.index_cast"(%4) : (index) -> i32
      %6 = "arith.addi"(%arg2, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%6) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%3) : (i32) -> ()
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
#map1 = affine_map<(d0, d1)[s0] -> (d0 - d1 + 1, s0)>
#map2 = affine_map<(d0, d1)[s0] -> (s0 + 1, d0 - d1 + 1)>
#map3 = affine_map<(d0, d1)[s0] -> (s0, d0 - d1 - 1)>
#map4 = affine_map<(d0, d1, d2)[s0] -> (s0, d0 - d1, d2)>
#map5 = affine_map<(d0, d1)[s0] -> (-s0, -d0 + d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, memref<?xindex>, index) -> (), sym_name = "test_affine_op_rewrite"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<?xindex>, %arg4: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 5 : index}> : () -> index
    "scf.for"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg5: index):
      %6 = "affine.min"(%arg1, %arg5, %arg2) <{map = #map}> : (index, index, index) -> index
      "memref.store"(%6, %arg3, %0) : (index, memref<?xindex>, index) -> ()
      %7 = "affine.min"(%arg1, %arg5, %arg2) <{map = #map1}> : (index, index, index) -> index
      "memref.store"(%7, %arg3, %1) : (index, memref<?xindex>, index) -> ()
      %8 = "affine.min"(%arg1, %arg5, %arg2) <{map = #map2}> : (index, index, index) -> index
      "memref.store"(%8, %arg3, %2) : (index, memref<?xindex>, index) -> ()
      %9 = "affine.min"(%arg1, %arg5, %arg2) <{map = #map3}> : (index, index, index) -> index
      "memref.store"(%9, %arg3, %3) : (index, memref<?xindex>, index) -> ()
      %10 = "affine.min"(%arg1, %arg5, %arg4, %arg2) <{map = #map4}> : (index, index, index, index) -> index
      "memref.store"(%10, %arg3, %4) : (index, memref<?xindex>, index) -> ()
      %11 = "affine.max"(%arg1, %arg5, %arg2) <{map = #map5}> : (index, index, index) -> index
      "memref.store"(%11, %arg3, %5) : (index, memref<?xindex>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, index) -> i32, sym_name = "nested_loops"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "scf.for"(%arg0, %arg2, %arg4, %0) ({
    ^bb0(%arg5: index, %arg6: i32):
      %2 = "scf.for"(%arg1, %arg3, %arg4, %arg6) ({
      ^bb0(%arg7: index, %arg8: i32):
        %4 = "affine.min"(%arg3, %arg7, %arg4) <{map = #map}> : (index, index, index) -> index
        %5 = "arith.index_cast"(%4) : (index) -> i32
        %6 = "arith.addi"(%arg8, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "scf.yield"(%6) : (i32) -> ()
      }) : (index, index, index, i32) -> i32
      %3 = "arith.addi"(%arg6, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "scf.yield"(%3) : (i32) -> ()
    }) : (index, index, index, i32) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0 * s0)>
#map1 = affine_map<(d0)[s0] -> (s0, -d0 + s0 * s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>, index) -> (), sym_name = "regression"}> ({
  ^bb0(%arg0: memref<i64>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "affine.apply"(%arg1) <{map = #map}> : (index) -> index
    "scf.for"(%0, %1, %arg1) ({
    ^bb0(%arg2: index):
      %2 = "affine.min"(%arg2, %arg1) <{map = #map1}> : (index, index) -> index
      %3 = "arith.index_cast"(%1) : (index) -> i64
      "memref.store"(%3, %arg0) : (i64, memref<i64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i64>) -> (), sym_name = "zero_step"}> ({
  ^bb0(%arg0: memref<i64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.subi"(%1, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "scf.for"(%0, %1, %2) ({
    ^bb0(%arg1: index):
      %3 = "arith.index_cast"(%arg1) : (index) -> i64
      "memref.store"(%3, %arg0) : (i64, memref<i64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

