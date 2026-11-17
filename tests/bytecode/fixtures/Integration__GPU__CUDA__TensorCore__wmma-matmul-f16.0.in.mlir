"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16> loc("<stdin>":3:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16> loc("<stdin>":4:10)
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32> loc("<stdin>":5:10)
    %3 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16 loc("<stdin>":6:10)
    %4 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16 loc("<stdin>":7:10)
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":8:10)
    %6 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":9:10)
    %7 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":10:10)
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":11:10)
    "scf.for"(%5, %6, %8) ({
    ^bb0(%arg16: index loc("<stdin>":13:10)):
      "scf.for"(%5, %6, %8) ({
      ^bb0(%arg17: index loc("<stdin>":15:12)):
        %18 = "arith.index_cast"(%arg17) : (index) -> i16 loc("<stdin>":16:15)
        %19 = "arith.sitofp"(%18) : (i16) -> f16 loc("<stdin>":17:15)
        "memref.store"(%19, %0, %arg16, %arg17) : (f16, memref<16x16xf16>, index, index) -> () loc("<stdin>":18:9)
        "scf.yield"() : () -> () loc("<stdin>":19:9)
      }) : (index, index, index) -> () loc("<stdin>":14:7)
      "scf.yield"() : () -> () loc("<stdin>":21:7)
    }) : (index, index, index) -> () loc("<stdin>":12:5)
    "scf.for"(%5, %6, %8) ({
    ^bb0(%arg14: index loc("<stdin>":24:10)):
      "scf.for"(%5, %6, %8) ({
      ^bb0(%arg15: index loc("<stdin>":26:12)):
        "memref.store"(%4, %1, %arg14, %arg15) : (f16, memref<16x16xf16>, index, index) -> () loc("<stdin>":27:9)
        "scf.yield"() : () -> () loc("<stdin>":28:9)
      }) : (index, index, index) -> () loc("<stdin>":25:7)
      "scf.yield"() : () -> () loc("<stdin>":30:7)
    }) : (index, index, index) -> () loc("<stdin>":23:5)
    %9 = "memref.cast"(%0) : (memref<16x16xf16>) -> memref<*xf16> loc("<stdin>":32:10)
    %10 = "memref.cast"(%1) : (memref<16x16xf16>) -> memref<*xf16> loc("<stdin>":33:11)
    %11 = "memref.cast"(%2) : (memref<16x16xf32>) -> memref<*xf32> loc("<stdin>":34:11)
    "gpu.host_register"(%9) : (memref<*xf16>) -> () loc("<stdin>":35:5)
    "gpu.host_register"(%10) : (memref<*xf16>) -> () loc("<stdin>":36:5)
    "gpu.launch"(%8, %8, %8, %7, %8, %8) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index loc("<stdin>":38:10), %arg3: index loc("<stdin>":38:24), %arg4: index loc("<stdin>":38:38), %arg5: index loc("<stdin>":38:52), %arg6: index loc("<stdin>":38:66), %arg7: index loc("<stdin>":38:80), %arg8: index loc("<stdin>":38:94), %arg9: index loc("<stdin>":38:108), %arg10: index loc("<stdin>":38:122), %arg11: index loc("<stdin>":38:137), %arg12: index loc("<stdin>":38:152), %arg13: index loc("<stdin>":38:167)):
      %14 = "gpu.subgroup_mma_load_matrix"(%0, %5, %5) <{leadDimension = 16 : index, transpose}> : (memref<16x16xf16>, index, index) -> !gpu.mma_matrix<16x16xf16, "AOp"> loc("<stdin>":39:13)
      %15 = "gpu.subgroup_mma_load_matrix"(%0, %5, %5) <{leadDimension = 16 : index}> : (memref<16x16xf16>, index, index) -> !gpu.mma_matrix<16x16xf16, "BOp"> loc("<stdin>":40:13)
      %16 = "gpu.subgroup_mma_load_matrix"(%1, %5, %5) <{leadDimension = 16 : index}> : (memref<16x16xf16>, index, index) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":41:13)
      %17 = "gpu.subgroup_mma_compute"(%14, %15, %16) <{a_transpose}> : (!gpu.mma_matrix<16x16xf16, "AOp">, !gpu.mma_matrix<16x16xf16, "BOp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":42:13)
      "gpu.subgroup_mma_store_matrix"(%17, %0, %5, %5) <{leadDimension = 16 : index}> : (!gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16>, index, index) -> () loc("<stdin>":43:7)
      "gpu.terminator"() : () -> () loc("<stdin>":44:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":37:5)
    "scf.for"(%5, %6, %8) ({
    ^bb0(%arg0: index loc("<stdin>":47:10)):
      "scf.for"(%5, %6, %8) ({
      ^bb0(%arg1: index loc("<stdin>":49:12)):
        %12 = "memref.load"(%0, %arg0, %arg1) : (memref<16x16xf16>, index, index) -> f16 loc("<stdin>":50:15)
        %13 = "arith.extf"(%12) : (f16) -> f32 loc("<stdin>":51:15)
        "memref.store"(%13, %2, %arg0, %arg1) : (f32, memref<16x16xf32>, index, index) -> () loc("<stdin>":52:9)
        "scf.yield"() : () -> () loc("<stdin>":53:9)
      }) : (index, index, index) -> () loc("<stdin>":48:7)
      "scf.yield"() : () -> () loc("<stdin>":55:7)
    }) : (index, index, index) -> () loc("<stdin>":46:5)
    "func.call"(%11) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":57:5)
    "func.return"() : () -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":60:3)
}) : () -> () loc("<stdin>":1:1)
