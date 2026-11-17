"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x4xf64> loc("<stdin>":3:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xf64> loc("<stdin>":4:10)
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8xf64> loc("<stdin>":5:10)
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8xf64> loc("<stdin>":6:10)
    %4 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64 loc("<stdin>":7:10)
    %5 = "arith.constant"() <{value = 3.140000e+00 : f64}> : () -> f64 loc("<stdin>":8:10)
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":9:10)
    %7 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":10:10)
    %8 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":11:10)
    %9 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":12:10)
    %10 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":13:11)
    "scf.for"(%6, %7, %9) ({
    ^bb0(%arg14: index loc("<stdin>":15:10)):
      "scf.for"(%6, %8, %9) ({
      ^bb0(%arg15: index loc("<stdin>":17:12)):
        "memref.store"(%4, %0, %arg14, %arg15) : (f64, memref<8x4xf64>, index, index) -> () loc("<stdin>":18:9)
        "memref.store"(%4, %1, %arg15, %arg14) : (f64, memref<4x8xf64>, index, index) -> () loc("<stdin>":19:9)
        "scf.yield"() : () -> () loc("<stdin>":20:9)
      }) : (index, index, index) -> () loc("<stdin>":16:7)
      "scf.yield"() : () -> () loc("<stdin>":22:7)
    }) : (index, index, index) -> () loc("<stdin>":14:5)
    "scf.for"(%6, %7, %9) ({
    ^bb0(%arg12: index loc("<stdin>":25:10)):
      "scf.for"(%6, %7, %9) ({
      ^bb0(%arg13: index loc("<stdin>":27:12)):
        "memref.store"(%5, %2, %arg12, %arg13) : (f64, memref<8x8xf64>, index, index) -> () loc("<stdin>":28:9)
        "scf.yield"() : () -> () loc("<stdin>":29:9)
      }) : (index, index, index) -> () loc("<stdin>":26:7)
      "scf.yield"() : () -> () loc("<stdin>":31:7)
    }) : (index, index, index) -> () loc("<stdin>":24:5)
    %11 = "memref.cast"(%0) : (memref<8x4xf64>) -> memref<*xf64> loc("<stdin>":33:11)
    %12 = "memref.cast"(%1) : (memref<4x8xf64>) -> memref<*xf64> loc("<stdin>":34:11)
    %13 = "memref.cast"(%2) : (memref<8x8xf64>) -> memref<*xf64> loc("<stdin>":35:11)
    %14 = "memref.cast"(%3) : (memref<8x8xf64>) -> memref<*xf64> loc("<stdin>":36:11)
    "gpu.host_register"(%11) : (memref<*xf64>) -> () loc("<stdin>":37:5)
    "gpu.host_register"(%12) : (memref<*xf64>) -> () loc("<stdin>":38:5)
    "gpu.host_register"(%13) : (memref<*xf64>) -> () loc("<stdin>":39:5)
    "gpu.host_register"(%14) : (memref<*xf64>) -> () loc("<stdin>":40:5)
    "gpu.launch"(%9, %9, %9, %10, %9, %9) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index loc("<stdin>":42:10), %arg1: index loc("<stdin>":42:24), %arg2: index loc("<stdin>":42:38), %arg3: index loc("<stdin>":42:52), %arg4: index loc("<stdin>":42:66), %arg5: index loc("<stdin>":42:80), %arg6: index loc("<stdin>":42:94), %arg7: index loc("<stdin>":42:108), %arg8: index loc("<stdin>":42:122), %arg9: index loc("<stdin>":42:136), %arg10: index loc("<stdin>":42:150), %arg11: index loc("<stdin>":42:165)):
      %15 = "gpu.subgroup_mma_load_matrix"(%0, %6, %6) <{leadDimension = 4 : index}> : (memref<8x4xf64>, index, index) -> !gpu.mma_matrix<8x4xf64, "AOp"> loc("<stdin>":43:13)
      %16 = "gpu.subgroup_mma_load_matrix"(%1, %6, %6) <{leadDimension = 8 : index}> : (memref<4x8xf64>, index, index) -> !gpu.mma_matrix<4x8xf64, "BOp"> loc("<stdin>":44:13)
      %17 = "gpu.subgroup_mma_load_matrix"(%2, %6, %6) <{leadDimension = 8 : index}> : (memref<8x8xf64>, index, index) -> !gpu.mma_matrix<8x8xf64, "COp"> loc("<stdin>":45:13)
      %18 = "gpu.subgroup_mma_compute"(%15, %16, %17) : (!gpu.mma_matrix<8x4xf64, "AOp">, !gpu.mma_matrix<4x8xf64, "BOp">, !gpu.mma_matrix<8x8xf64, "COp">) -> !gpu.mma_matrix<8x8xf64, "COp"> loc("<stdin>":46:13)
      "gpu.subgroup_mma_store_matrix"(%18, %3, %6, %6) <{leadDimension = 8 : index}> : (!gpu.mma_matrix<8x8xf64, "COp">, memref<8x8xf64>, index, index) -> () loc("<stdin>":47:7)
      "gpu.terminator"() : () -> () loc("<stdin>":48:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":41:5)
    "func.call"(%14) <{callee = @printMemrefF64}> : (memref<*xf64>) -> () loc("<stdin>":50:5)
    "func.return"() : () -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":53:3)
}) : () -> () loc("<stdin>":1:1)
