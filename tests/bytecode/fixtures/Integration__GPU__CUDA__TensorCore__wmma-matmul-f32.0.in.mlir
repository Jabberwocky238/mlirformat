"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16> loc("<stdin>":3:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32> loc("<stdin>":4:10)
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32> loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16 loc("<stdin>":6:10)
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:10)
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":8:10)
    %6 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":9:10)
    %7 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":10:10)
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":11:10)
    "scf.for"(%5, %6, %8) ({
    ^bb0(%arg14: index loc("<stdin>":13:10)):
      "scf.for"(%5, %6, %8) ({
      ^bb0(%arg15: index loc("<stdin>":15:12)):
        "memref.store"(%3, %0, %arg14, %arg15) : (f16, memref<16x16xf16>, index, index) -> () loc("<stdin>":16:9)
        "scf.yield"() : () -> () loc("<stdin>":17:9)
      }) : (index, index, index) -> () loc("<stdin>":14:7)
      "scf.yield"() : () -> () loc("<stdin>":19:7)
    }) : (index, index, index) -> () loc("<stdin>":12:5)
    "scf.for"(%5, %6, %8) ({
    ^bb0(%arg12: index loc("<stdin>":22:10)):
      "scf.for"(%5, %6, %8) ({
      ^bb0(%arg13: index loc("<stdin>":24:12)):
        "memref.store"(%4, %1, %arg12, %arg13) : (f32, memref<16x16xf32>, index, index) -> () loc("<stdin>":25:9)
        "scf.yield"() : () -> () loc("<stdin>":26:9)
      }) : (index, index, index) -> () loc("<stdin>":23:7)
      "scf.yield"() : () -> () loc("<stdin>":28:7)
    }) : (index, index, index) -> () loc("<stdin>":21:5)
    %9 = "memref.cast"(%0) : (memref<16x16xf16>) -> memref<*xf16> loc("<stdin>":30:10)
    %10 = "memref.cast"(%1) : (memref<16x16xf32>) -> memref<*xf32> loc("<stdin>":31:11)
    %11 = "memref.cast"(%2) : (memref<16x16xf32>) -> memref<*xf32> loc("<stdin>":32:11)
    "gpu.host_register"(%9) : (memref<*xf16>) -> () loc("<stdin>":33:5)
    "gpu.host_register"(%10) : (memref<*xf32>) -> () loc("<stdin>":34:5)
    "gpu.launch"(%8, %8, %8, %7, %8, %8) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":36:10), %arg1: index loc("<stdin>":36:24), %arg2: index loc("<stdin>":36:38), %arg3: index loc("<stdin>":36:52), %arg4: index loc("<stdin>":36:66), %arg5: index loc("<stdin>":36:80), %arg6: index loc("<stdin>":36:94), %arg7: index loc("<stdin>":36:108), %arg8: index loc("<stdin>":36:122), %arg9: index loc("<stdin>":36:136), %arg10: index loc("<stdin>":36:150), %arg11: index loc("<stdin>":36:165)):
      %12 = "gpu.subgroup_mma_load_matrix"(%0, %5, %5) <{leadDimension = 16 : index}> : (memref<16x16xf16>, index, index) -> !gpu.mma_matrix<16x16xf16, "AOp"> loc("<stdin>":37:13)
      %13 = "gpu.subgroup_mma_load_matrix"(%0, %5, %5) <{leadDimension = 16 : index}> : (memref<16x16xf16>, index, index) -> !gpu.mma_matrix<16x16xf16, "BOp"> loc("<stdin>":38:13)
      %14 = "gpu.subgroup_mma_load_matrix"(%1, %5, %5) <{leadDimension = 16 : index}> : (memref<16x16xf32>, index, index) -> !gpu.mma_matrix<16x16xf32, "COp"> loc("<stdin>":39:13)
      %15 = "gpu.subgroup_mma_compute"(%12, %13, %14) : (!gpu.mma_matrix<16x16xf16, "AOp">, !gpu.mma_matrix<16x16xf16, "BOp">, !gpu.mma_matrix<16x16xf32, "COp">) -> !gpu.mma_matrix<16x16xf32, "COp"> loc("<stdin>":40:13)
      "gpu.subgroup_mma_store_matrix"(%15, %1, %5, %5) <{leadDimension = 16 : index}> : (!gpu.mma_matrix<16x16xf32, "COp">, memref<16x16xf32>, index, index) -> () loc("<stdin>":41:7)
      "gpu.terminator"() : () -> () loc("<stdin>":42:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":35:5)
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":44:5)
    "func.return"() : () -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":47:3)
}) : () -> () loc("<stdin>":1:1)
