"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16> loc("<stdin>":3:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32> loc("<stdin>":4:10)
    %2 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16 loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:10)
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %5 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":8:10)
    %6 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":9:10)
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":10:10)
    "scf.for"(%4, %5, %7) ({
    ^bb0(%arg14: index loc("<stdin>":12:10)):
      "scf.for"(%4, %5, %7) ({
      ^bb0(%arg15: index loc("<stdin>":14:12)):
        "memref.store"(%2, %0, %arg14, %arg15) : (f16, memref<16x16xf16>, index, index) -> () loc("<stdin>":15:9)
        "scf.yield"() : () -> () loc("<stdin>":16:9)
      }) : (index, index, index) -> () loc("<stdin>":13:7)
      "scf.yield"() : () -> () loc("<stdin>":18:7)
    }) : (index, index, index) -> () loc("<stdin>":11:5)
    "scf.for"(%4, %5, %7) ({
    ^bb0(%arg12: index loc("<stdin>":21:10)):
      "scf.for"(%4, %5, %7) ({
      ^bb0(%arg13: index loc("<stdin>":23:12)):
        "memref.store"(%3, %1, %arg12, %arg13) : (f32, memref<16x16xf32>, index, index) -> () loc("<stdin>":24:9)
        "scf.yield"() : () -> () loc("<stdin>":25:9)
      }) : (index, index, index) -> () loc("<stdin>":22:7)
      "scf.yield"() : () -> () loc("<stdin>":27:7)
    }) : (index, index, index) -> () loc("<stdin>":20:5)
    %8 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":29:10)
    %9:2 = "gpu.alloc"(%8) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<16x16xf16>, !gpu.async.token) loc("<stdin>":30:12)
    %10:2 = "gpu.alloc"(%8) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (!gpu.async.token) -> (memref<16x16xf32>, !gpu.async.token) loc("<stdin>":31:13)
    %11 = "gpu.memcpy"(%8, %9#0, %0) : (!gpu.async.token, memref<16x16xf16>, memref<16x16xf16>) -> !gpu.async.token loc("<stdin>":32:11)
    %12 = "gpu.memcpy"(%8, %10#0, %1) : (!gpu.async.token, memref<16x16xf32>, memref<16x16xf32>) -> !gpu.async.token loc("<stdin>":33:11)
    "gpu.launch"(%7, %7, %7, %6, %7, %7) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":35:10), %arg1: index loc("<stdin>":35:24), %arg2: index loc("<stdin>":35:38), %arg3: index loc("<stdin>":35:52), %arg4: index loc("<stdin>":35:66), %arg5: index loc("<stdin>":35:80), %arg6: index loc("<stdin>":35:94), %arg7: index loc("<stdin>":35:108), %arg8: index loc("<stdin>":35:122), %arg9: index loc("<stdin>":35:136), %arg10: index loc("<stdin>":35:150), %arg11: index loc("<stdin>":35:165)):
      %15 = "gpu.subgroup_mma_load_matrix"(%9#0, %4, %4) <{leadDimension = 16 : index}> : (memref<16x16xf16>, index, index) -> !gpu.mma_matrix<16x16xf16, "AOp"> loc("<stdin>":36:13)
      %16 = "gpu.subgroup_mma_load_matrix"(%9#0, %4, %4) <{leadDimension = 16 : index}> : (memref<16x16xf16>, index, index) -> !gpu.mma_matrix<16x16xf16, "BOp"> loc("<stdin>":37:13)
      %17 = "gpu.subgroup_mma_load_matrix"(%10#0, %4, %4) <{leadDimension = 16 : index}> : (memref<16x16xf32>, index, index) -> !gpu.mma_matrix<16x16xf32, "COp"> loc("<stdin>":38:13)
      %18 = "gpu.subgroup_mma_compute"(%15, %16, %17) : (!gpu.mma_matrix<16x16xf16, "AOp">, !gpu.mma_matrix<16x16xf16, "BOp">, !gpu.mma_matrix<16x16xf32, "COp">) -> !gpu.mma_matrix<16x16xf32, "COp"> loc("<stdin>":39:13)
      "gpu.subgroup_mma_store_matrix"(%18, %10#0, %4, %4) <{leadDimension = 16 : index}> : (!gpu.mma_matrix<16x16xf32, "COp">, memref<16x16xf32>, index, index) -> () loc("<stdin>":40:7)
      "gpu.printf"() <{format = "Success\0A"}> : () -> () loc("<stdin>":41:7)
      "gpu.terminator"() : () -> () loc("<stdin>":42:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":34:5)
    %13 = "gpu.dealloc"(%8, %9#0) : (!gpu.async.token, memref<16x16xf16>) -> !gpu.async.token loc("<stdin>":44:11)
    %14 = "gpu.dealloc"(%8, %10#0) : (!gpu.async.token, memref<16x16xf32>) -> !gpu.async.token loc("<stdin>":45:11)
    "gpu.wait"(%8) : (!gpu.async.token) -> () loc("<stdin>":46:5)
    "func.return"() : () -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
