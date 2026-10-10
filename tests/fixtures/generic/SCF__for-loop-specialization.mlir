#map = affine_map<()[s0, s1] -> (1024, s0 - s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<?xf32>, memref<?xf32>, memref<?xf32>, memref<?xf32>) -> (), sym_name = "for"}> ({
  ^bb0(%arg0: index, %arg1: memref<?xf32>, %arg2: memref<?xf32>, %arg3: memref<?xf32>, %arg4: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "memref.dim"(%arg1, %0) : (memref<?xf32>, index) -> index
    %3 = "affine.min"(%2, %arg0) <{map = #map}> : (index, index) -> index
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg5: index):
      %4 = "memref.load"(%arg2, %arg5) : (memref<?xf32>, index) -> f32
      %5 = "memref.load"(%arg3, %arg5) : (memref<?xf32>, index) -> f32
      %6 = "arith.addf"(%4, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "memref.store"(%6, %arg4, %arg5) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

