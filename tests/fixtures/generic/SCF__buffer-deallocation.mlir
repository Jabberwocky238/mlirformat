"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "parallel_insert_slice"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    "scf.forall"(%arg0) <{operandSegmentSizes = array<i32: 0, 1, 0, 0>, staticLowerBound = array<i64: 0>, staticStep = array<i64: 1>, staticUpperBound = array<i64: -9223372036854775808>}> ({
    ^bb0(%arg1: index):
      %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
      %3 = "memref.load"(%1, %0) : (memref<2xf32>, index) -> f32
      "linalg.fill"(%3, %2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg2: f32, %arg3: f32):
        "linalg.yield"(%arg2) : (f32) -> ()
      }) : (f32, memref<2xf32>) -> ()
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<100xf32>) -> (), sym_name = "reduce"}> ({
  ^bb0(%arg0: memref<100xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "scf.parallel"(%1, %2, %2, %0) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> ({
    ^bb0(%arg1: index):
      %4 = "memref.load"(%arg0, %arg1) : (memref<100xf32>, index) -> f32
      "scf.reduce"(%4) ({
      ^bb0(%arg2: f32, %arg3: f32):
        %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
        "memref.store"(%arg2, %5, %1) : (f32, memref<2xf32>, index) -> ()
        "memref.store"(%arg3, %5, %2) : (f32, memref<2xf32>, index) -> ()
        %6 = "memref.load"(%5, %1) : (memref<2xf32>, index) -> f32
        %7 = "memref.load"(%5, %2) : (memref<2xf32>, index) -> f32
        %8 = "arith.addf"(%6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "scf.reduce.return"(%8) : (f32) -> ()
      }) : (f32) -> ()
    }) : (index, index, index, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

