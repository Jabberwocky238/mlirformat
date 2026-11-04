"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "num_worker_threads"}> ({
  ^bb0(%arg0: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 100 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.parallel"(%0, %1, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>}> ({
    ^bb0(%arg1: index):
      %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      "memref.store"(%3, %arg0, %arg1) : (f32, memref<?xf32>, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

