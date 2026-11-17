"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "matmul_tensors"}> ({
  ^bb0(%arg0: tensor<?x?xf32> loc("<stdin>":6:8), %arg1: tensor<?x?xf32> loc("<stdin>":6:32), %arg2: tensor<?x?xf32> loc("<stdin>":6:56)):
    %0 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32 loc("<stdin>":8:10), %arg13: f32 loc("<stdin>":8:23), %arg14: f32 loc("<stdin>":8:36)):
      %19 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:13)
      %20 = "arith.addf"(%arg14, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:13)
      "linalg.yield"(%20) : (f32) -> () loc("<stdin>":11:7)
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":7:10)
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":13:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":14:10)
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":15:10)
    %4 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":16:10)
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":17:10)
    %6 = "tensor.dim"(%0, %3) : (tensor<?x?xf32>, index) -> index loc("<stdin>":18:10)
    %7 = "tensor.dim"(%0, %5) : (tensor<?x?xf32>, index) -> index loc("<stdin>":19:10)
    %8 = "tensor.dim"(%arg1, %5) : (tensor<?x?xf32>, index) -> index loc("<stdin>":20:10)
    %9 = "scf.for"(%3, %6, %2, %arg2) ({
    ^bb0(%arg3: index loc("<stdin>":22:10), %arg4: tensor<?x?xf32> loc("<stdin>":22:24)):
      %10 = "scf.for"(%3, %8, %4, %arg4) ({
      ^bb0(%arg5: index loc("<stdin>":24:12), %arg6: tensor<?x?xf32> loc("<stdin>":24:26)):
        %11 = "scf.for"(%3, %7, %1, %arg6) ({
        ^bb0(%arg7: index loc("<stdin>":26:14), %arg8: tensor<?x?xf32> loc("<stdin>":26:28)):
          %12 = "tensor.extract_slice"(%0, %arg3, %arg7, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 4>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index) -> tensor<?x4xf32> loc("<stdin>":27:17)
          %13 = "tensor.extract_slice"(%arg1, %arg7, %arg5, %4) <{operandSegmentSizes = array<i32: 1, 2, 1, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 4, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index) -> tensor<4x?xf32> loc("<stdin>":28:17)
          %14 = "tensor.extract_slice"(%arg8, %arg3, %arg5, %2, %4) <{operandSegmentSizes = array<i32: 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32> loc("<stdin>":29:17)
          %15 = "linalg.matmul"(%12, %13, %14) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
          ^bb0(%arg9: f32 loc("<stdin>":31:16), %arg10: f32 loc("<stdin>":31:28), %arg11: f32 loc("<stdin>":31:41)):
            %17 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":32:19)
            %18 = "arith.addf"(%arg11, %17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":33:19)
            "linalg.yield"(%18) : (f32) -> () loc("<stdin>":34:13)
          }) : (tensor<?x4xf32>, tensor<4x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":30:17)
          %16 = "tensor.insert_slice"(%15, %arg8, %arg3, %arg5, %2, %4) <{operandSegmentSizes = array<i32: 1, 1, 2, 2, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, tensor<?x?xf32>, index, index, index, index) -> tensor<?x?xf32> loc("<stdin>":36:17)
          "scf.yield"(%16) : (tensor<?x?xf32>) -> () loc("<stdin>":37:11)
        }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":25:15)
        "scf.yield"(%11) : (tensor<?x?xf32>) -> () loc("<stdin>":39:9)
      }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":23:13)
      "scf.yield"(%10) : (tensor<?x?xf32>) -> () loc("<stdin>":41:7)
    }) : (index, index, index, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":21:10)
    "func.return"(%9) : (tensor<?x?xf32>) -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
