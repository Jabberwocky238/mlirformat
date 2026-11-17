"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, f32, f32) -> (tensor<5xf32>, tensor<5xf32>), sym_name = "simple_test"}> ({
  ^bb0(%arg0: index loc("<stdin>":4:8), %arg1: index loc("<stdin>":4:22), %arg2: index loc("<stdin>":4:36), %arg3: f32 loc("<stdin>":4:50), %arg4: f32 loc("<stdin>":4:62)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:10)
    %2 = "tensor.empty"() : () -> tensor<5xf32> loc("<stdin>":7:10)
    %3 = "scf.for"(%arg0, %arg1, %arg2, %2) ({
    ^bb0(%arg11: index loc("<stdin>":9:10), %arg12: tensor<5xf32> loc("<stdin>":9:25)):
      %9 = "linalg.fill"(%arg3, %arg12) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg15: f32 loc("<stdin>":11:12), %arg16: f32 loc("<stdin>":11:25)):
        "linalg.yield"(%arg15) : (f32) -> () loc("<stdin>":12:9)
      }) : (f32, tensor<5xf32>) -> tensor<5xf32> loc("<stdin>":10:12)
      %10 = "linalg.fill"(%arg4, %arg12) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg13: f32 loc("<stdin>":15:12), %arg14: f32 loc("<stdin>":15:25)):
        "linalg.yield"(%arg13) : (f32) -> () loc("<stdin>":16:9)
      }) : (f32, tensor<5xf32>) -> tensor<5xf32> loc("<stdin>":14:13)
      %11 = "vector.transfer_read"(%9, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<5xf32>, index, f32) -> vector<5xf32> loc("<stdin>":18:13)
      "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<5xf32>) -> () loc("<stdin>":19:7)
      "scf.yield"(%10) : (tensor<5xf32>) -> () loc("<stdin>":20:7)
    }) : (index, index, index, tensor<5xf32>) -> tensor<5xf32> loc("<stdin>":8:10)
    %4 = "tensor.empty"() : () -> tensor<5xf32> loc("<stdin>":22:10)
    %5 = "scf.for"(%arg0, %arg1, %arg2, %2) ({
    ^bb0(%arg5: index loc("<stdin>":24:10), %arg6: tensor<5xf32> loc("<stdin>":24:24)):
      %6 = "linalg.fill"(%arg3, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg9: f32 loc("<stdin>":26:12), %arg10: f32 loc("<stdin>":26:24)):
        "linalg.yield"(%arg9) : (f32) -> () loc("<stdin>":27:9)
      }) : (f32, tensor<5xf32>) -> tensor<5xf32> loc("<stdin>":25:12)
      %7 = "linalg.fill"(%arg4, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg7: f32 loc("<stdin>":30:12), %arg8: f32 loc("<stdin>":30:24)):
        "linalg.yield"(%arg7) : (f32) -> () loc("<stdin>":31:9)
      }) : (f32, tensor<5xf32>) -> tensor<5xf32> loc("<stdin>":29:12)
      %8 = "vector.transfer_read"(%7, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (tensor<5xf32>, index, f32) -> vector<5xf32> loc("<stdin>":33:12)
      "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<5xf32>) -> () loc("<stdin>":34:7)
      "scf.yield"(%6) : (tensor<5xf32>) -> () loc("<stdin>":35:7)
    }) : (index, index, index, tensor<5xf32>) -> tensor<5xf32> loc("<stdin>":23:10)
    "func.return"(%3, %5) : (tensor<5xf32>, tensor<5xf32>) -> () loc("<stdin>":37:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
