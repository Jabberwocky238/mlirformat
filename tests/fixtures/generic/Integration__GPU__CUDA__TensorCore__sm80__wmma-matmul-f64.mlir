"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x4xf64>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xf64>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8xf64>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8xf64>
    %4 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %5 = "arith.constant"() <{value = 3.140000e+00 : f64}> : () -> f64
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index
    %7 = "arith.constant"() <{value = 8 : index}> : () -> index
    %8 = "arith.constant"() <{value = 4 : index}> : () -> index
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index
    %10 = "arith.constant"() <{value = 32 : index}> : () -> index
    "scf.for"(%6, %7, %9) ({
    ^bb0(%arg14: index):
      "scf.for"(%6, %8, %9) ({
      ^bb0(%arg15: index):
        "memref.store"(%4, %0, %arg14, %arg15) : (f64, memref<8x4xf64>, index, index) -> ()
        "memref.store"(%4, %1, %arg15, %arg14) : (f64, memref<4x8xf64>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%6, %7, %9) ({
    ^bb0(%arg12: index):
      "scf.for"(%6, %7, %9) ({
      ^bb0(%arg13: index):
        "memref.store"(%5, %2, %arg12, %arg13) : (f64, memref<8x8xf64>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %11 = "memref.cast"(%0) : (memref<8x4xf64>) -> memref<*xf64>
    %12 = "memref.cast"(%1) : (memref<4x8xf64>) -> memref<*xf64>
    %13 = "memref.cast"(%2) : (memref<8x8xf64>) -> memref<*xf64>
    %14 = "memref.cast"(%3) : (memref<8x8xf64>) -> memref<*xf64>
    "gpu.host_register"(%11) : (memref<*xf64>) -> ()
    "gpu.host_register"(%12) : (memref<*xf64>) -> ()
    "gpu.host_register"(%13) : (memref<*xf64>) -> ()
    "gpu.host_register"(%14) : (memref<*xf64>) -> ()
    "gpu.launch"(%9, %9, %9, %10, %9, %9) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      %15 = "gpu.subgroup_mma_load_matrix"(%0, %6, %6) <{leadDimension = 4 : index}> : (memref<8x4xf64>, index, index) -> !gpu.mma_matrix<8x4xf64, "AOp">
      %16 = "gpu.subgroup_mma_load_matrix"(%1, %6, %6) <{leadDimension = 8 : index}> : (memref<4x8xf64>, index, index) -> !gpu.mma_matrix<4x8xf64, "BOp">
      %17 = "gpu.subgroup_mma_load_matrix"(%2, %6, %6) <{leadDimension = 8 : index}> : (memref<8x8xf64>, index, index) -> !gpu.mma_matrix<8x8xf64, "COp">
      %18 = "gpu.subgroup_mma_compute"(%15, %16, %17) : (!gpu.mma_matrix<8x4xf64, "AOp">, !gpu.mma_matrix<4x8xf64, "BOp">, !gpu.mma_matrix<8x8xf64, "COp">) -> !gpu.mma_matrix<8x8xf64, "COp">
      "gpu.subgroup_mma_store_matrix"(%18, %3, %6, %6) <{leadDimension = 8 : index}> : (!gpu.mma_matrix<8x8xf64, "COp">, memref<8x8xf64>, index, index) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.call"(%14) <{callee = @printMemrefF64}> : (memref<*xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

