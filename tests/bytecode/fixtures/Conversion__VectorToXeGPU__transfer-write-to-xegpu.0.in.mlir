"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (vector<8xf32>, memref<8x16x32xf32>, index) -> ()}> ({
    ^bb0(%arg0: vector<8xf32> loc("<stdin>":5:10), %arg1: memref<8x16x32xf32> loc("<stdin>":5:32), %arg2: index loc("<stdin>":5:60)):
      "vector.transfer_write"(%arg0, %arg1, %arg2, %arg2, %arg2) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = affine_map<(d0, d1, d2) -> (d2)>}> : (vector<8xf32>, memref<8x16x32xf32>, index, index, index) -> () loc("<stdin>":6:7)
      "gpu.return"() : () -> () loc("<stdin>":7:7)
    }) {sym_name = "store_1D_vector"} : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
