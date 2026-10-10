#map = affine_map<()[s0, s1] -> (1024, s0 - s1)>
#map1 = affine_map<()[s0, s1] -> (64, s0 - s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "parallel_loop"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: memref<?x?xf32>, %arg3: memref<?x?xf32>, %arg4: memref<?x?xf32>, %arg5: memref<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "memref.dim"(%arg2, %0) : (memref<?x?xf32>, index) -> index
    %3 = "memref.dim"(%arg2, %1) : (memref<?x?xf32>, index) -> index
    %4 = "affine.min"(%2, %arg0) <{map = #map}> : (index, index) -> index
    %5 = "affine.min"(%3, %arg1) <{map = #map1}> : (index, index) -> index
    "scf.parallel"(%0, %0, %4, %5, %1, %1) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg6: index, %arg7: index):
      %6 = "memref.load"(%arg3, %arg6, %arg7) : (memref<?x?xf32>, index, index) -> f32
      %7 = "memref.load"(%arg4, %arg6, %arg7) : (memref<?x?xf32>, index, index) -> f32
      %8 = "arith.addf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%8, %arg5, %arg6, %arg7) : (f32, memref<?x?xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

