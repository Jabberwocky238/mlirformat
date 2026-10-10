"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, f32, index) -> (f32, f32), sym_name = "atomic_rmw_no_conversion"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: f32, %arg2: index):
    %0 = "memref.atomic_rmw"(%arg1, %arg0, %arg2) <{kind = 0 : i64}> : (f32, memref<10xf32>, index) -> f32
    %1 = "memref.atomic_rmw"(%arg1, %arg0, %arg2) <{kind = 4 : i64}> : (f32, memref<10xf32>, index) -> f32
    "func.return"(%0, %1) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>, memref<3xi32>) -> memref<?x?x8xf32>, sym_name = "memref_reshape"}> ({
  ^bb0(%arg0: memref<*xf32>, %arg1: memref<3xi32>):
    %0 = "memref.reshape"(%arg0, %arg1) : (memref<*xf32>, memref<3xi32>) -> memref<?x?x8xf32>
    "func.return"(%0) : (memref<?x?x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

