"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<8x16x32xf32>, index) -> vector<8xf32>}> ({
    ^bb0(%arg0: memref<8x16x32xf32> loc("<stdin>":5:10), %arg1: index loc("<stdin>":5:38)):
      %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:12)
      %1 = "vector.transfer_read"(%arg0, %arg1, %arg1, %arg1, %0) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = affine_map<(d0, d1, d2) -> (d2)>}> : (memref<8x16x32xf32>, index, index, index, f32) -> vector<8xf32> loc("<stdin>":7:12)
      "gpu.return"(%1) : (vector<8xf32>) -> () loc("<stdin>":8:7)
    }) {sym_name = "load_1D_vector"} : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
