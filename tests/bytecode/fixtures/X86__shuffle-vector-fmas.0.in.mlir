"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x1x1xbf16>, memref<1x1x1xbf16>, memref<1x8x2xbf16>, memref<1x1x1xbf16>, memref<1x1x1xbf16>, memref<1x8x2xbf16>, vector<8xf32>) -> vector<8xf32>, sym_name = "shuffle_fma_with_rhs_as_even.index_to_f32"}> ({
  ^bb0(%arg1: memref<1x1x1xbf16> loc("<stdin>":3:8), %arg2: memref<1x1x1xbf16> loc("<stdin>":3:35), %arg3: memref<1x8x2xbf16> loc("<stdin>":3:62), %arg4: memref<1x1x1xbf16> loc("<stdin>":3:89), %arg5: memref<1x1x1xbf16> loc("<stdin>":3:116), %arg6: memref<1x8x2xbf16> loc("<stdin>":3:143), %arg7: vector<8xf32> loc("<stdin>":3:170)):
    %1 = "x86.avx.bcst_to_f32.packed"(%arg1) : (memref<1x1x1xbf16>) -> vector<8xf32> loc("<stdin>":4:10)
    %2 = "x86.avx.cvt.packed.odd.indexed_to_f32"(%arg3) : (memref<1x8x2xbf16>) -> vector<8xf32> loc("<stdin>":5:10)
    %3 = "vector.fma"(%1, %2, %arg7) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":6:10)
    %4 = "x86.avx.bcst_to_f32.packed"(%arg2) : (memref<1x1x1xbf16>) -> vector<8xf32> loc("<stdin>":7:10)
    %5 = "x86.avx.cvt.packed.even.indexed_to_f32"(%arg3) : (memref<1x8x2xbf16>) -> vector<8xf32> loc("<stdin>":8:10)
    %6 = "vector.fma"(%4, %5, %3) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":9:10)
    %7 = "x86.avx.bcst_to_f32.packed"(%arg4) : (memref<1x1x1xbf16>) -> vector<8xf32> loc("<stdin>":10:10)
    %8 = "x86.avx.cvt.packed.odd.indexed_to_f32"(%arg6) : (memref<1x8x2xbf16>) -> vector<8xf32> loc("<stdin>":11:10)
    %9 = "vector.fma"(%7, %8, %arg7) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":12:10)
    %10 = "x86.avx.bcst_to_f32.packed"(%arg5) : (memref<1x1x1xbf16>) -> vector<8xf32> loc("<stdin>":13:11)
    %11 = "x86.avx.cvt.packed.even.indexed_to_f32"(%arg6) : (memref<1x8x2xbf16>) -> vector<8xf32> loc("<stdin>":14:11)
    %12 = "vector.fma"(%10, %11, %9) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":15:11)
    %13 = "vector.fma"(%6, %12, %arg7) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":16:11)
    "func.return"(%13) : (vector<8xf32>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":21:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":22:12)
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.x86.shuffle_vector_fma_ops"() : () -> () loc("<stdin>":24:9)
      }) : (!transform.any_op) -> () loc("<stdin>":23:7)
      "transform.yield"() : () -> () loc("<stdin>":26:7)
    }) : () -> () loc("<stdin>":20:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":19:3)
}) : () -> () loc("<stdin>":1:1)
