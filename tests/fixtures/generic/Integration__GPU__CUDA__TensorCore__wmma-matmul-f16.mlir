"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf32>
    %3 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16
    %4 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 16 : index}> : () -> index
    %7 = "arith.constant"() <{value = 32 : index}> : () -> index
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%5, %6, %8) ({
    ^bb0(%arg16: index):
      "scf.for"(%5, %6, %8) ({
      ^bb0(%arg17: index):
        %18 = "arith.index_cast"(%arg17) : (index) -> i16
        %19 = "arith.sitofp"(%18) : (i16) -> f16
        "memref.store"(%19, %0, %arg16, %arg17) : (f16, memref<16x16xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%5, %6, %8) ({
    ^bb0(%arg14: index):
      "scf.for"(%5, %6, %8) ({
      ^bb0(%arg15: index):
        "memref.store"(%4, %1, %arg14, %arg15) : (f16, memref<16x16xf16>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %9 = "memref.cast"(%0) : (memref<16x16xf16>) -> memref<*xf16>
    %10 = "memref.cast"(%1) : (memref<16x16xf16>) -> memref<*xf16>
    %11 = "memref.cast"(%2) : (memref<16x16xf32>) -> memref<*xf32>
    "gpu.host_register"(%9) : (memref<*xf16>) -> ()
    "gpu.host_register"(%10) : (memref<*xf16>) -> ()
    "gpu.launch"(%8, %8, %8, %7, %8, %8) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index):
      %14 = "gpu.subgroup_mma_load_matrix"(%0, %5, %5) <{leadDimension = 16 : index, transpose}> : (memref<16x16xf16>, index, index) -> !gpu.mma_matrix<16x16xf16, "AOp">
      %15 = "gpu.subgroup_mma_load_matrix"(%0, %5, %5) <{leadDimension = 16 : index}> : (memref<16x16xf16>, index, index) -> !gpu.mma_matrix<16x16xf16, "BOp">
      %16 = "gpu.subgroup_mma_load_matrix"(%1, %5, %5) <{leadDimension = 16 : index}> : (memref<16x16xf16>, index, index) -> !gpu.mma_matrix<16x16xf16, "COp">
      %17 = "gpu.subgroup_mma_compute"(%14, %15, %16) <{a_transpose}> : (!gpu.mma_matrix<16x16xf16, "AOp">, !gpu.mma_matrix<16x16xf16, "BOp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp">
      "gpu.subgroup_mma_store_matrix"(%17, %0, %5, %5) <{leadDimension = 16 : index}> : (!gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16>, index, index) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "scf.for"(%5, %6, %8) ({
    ^bb0(%arg0: index):
      "scf.for"(%5, %6, %8) ({
      ^bb0(%arg1: index):
        %12 = "memref.load"(%0, %arg0, %arg1) : (memref<16x16xf16>, index, index) -> f16
        %13 = "arith.extf"(%12) : (f16) -> f32
        "memref.store"(%13, %2, %arg0, %arg1) : (f32, memref<16x16xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.call"(%11) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

