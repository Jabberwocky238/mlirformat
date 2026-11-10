"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32>
    %2 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 16 : index}> : () -> index
    %6 = "arith.constant"() <{value = 32 : index}> : () -> index
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%4, %5, %7) ({
    ^bb0(%arg14: index):
      "scf.for"(%4, %5, %7) ({
      ^bb0(%arg15: index):
        "memref.store"(%2, %0, %arg14, %arg15) : (f16, memref<16x16xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%4, %5, %7) ({
    ^bb0(%arg12: index):
      "scf.for"(%4, %5, %7) ({
      ^bb0(%arg13: index):
        "memref.store"(%3, %1, %arg12, %arg13) : (f32, memref<16x16xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %8 = "gpu.wait"() : () -> !gpu.async.token
    %9:2 = "gpu.alloc"(%8) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<16x16xf16>, !gpu.async.token)
    %10:2 = "gpu.alloc"(%8) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<16x16xf32>, !gpu.async.token)
    %11 = "gpu.memcpy"(%8, %9#0, %0) : (!gpu.async.token, memref<16x16xf16>, memref<16x16xf16>) -> !gpu.async.token
    %12 = "gpu.memcpy"(%8, %10#0, %1) : (!gpu.async.token, memref<16x16xf32>, memref<16x16xf32>) -> !gpu.async.token
    "gpu.launch"(%7, %7, %7, %6, %7, %7) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      %15 = "gpu.subgroup_mma_load_matrix"(%9#0, %4, %4) <{leadDimension = 16 : index}> : (memref<16x16xf16>, index, index) -> !gpu.mma_matrix<16x16xf16, "AOp">
      %16 = "gpu.subgroup_mma_load_matrix"(%9#0, %4, %4) <{leadDimension = 16 : index}> : (memref<16x16xf16>, index, index) -> !gpu.mma_matrix<16x16xf16, "BOp">
      %17 = "gpu.subgroup_mma_load_matrix"(%10#0, %4, %4) <{leadDimension = 16 : index}> : (memref<16x16xf32>, index, index) -> !gpu.mma_matrix<16x16xf32, "COp">
      %18 = "gpu.subgroup_mma_compute"(%15, %16, %17) : (!gpu.mma_matrix<16x16xf16, "AOp">, !gpu.mma_matrix<16x16xf16, "BOp">, !gpu.mma_matrix<16x16xf32, "COp">) -> !gpu.mma_matrix<16x16xf32, "COp">
      "gpu.subgroup_mma_store_matrix"(%18, %10#0, %4, %4) <{leadDimension = 16 : index}> : (!gpu.mma_matrix<16x16xf32, "COp">, memref<16x16xf32>, index, index) -> ()
      "gpu.printf"() <{format = "Success\0A"}> : () -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    %13 = "gpu.dealloc"(%8, %9#0) : (!gpu.async.token, memref<16x16xf16>) -> !gpu.async.token
    %14 = "gpu.dealloc"(%8, %10#0) : (!gpu.async.token, memref<16x16xf32>) -> !gpu.async.token
    "gpu.wait"(%8) : (!gpu.async.token) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

