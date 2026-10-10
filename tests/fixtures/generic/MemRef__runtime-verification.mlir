"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index) -> memref<?x5xf32>, sym_name = "expand_shape"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: index):
    %0 = "memref.expand_shape"(%arg0, %arg1) <{reassociation = [[0, 1]], static_output_shape = array<i64: -9223372036854775808, 5>}> : (memref<?xf32>, index) -> memref<?x5xf32>
    "func.return"(%0) : (memref<?x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

