#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton), posWidth = 32, crdWidth = 32 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed), posWidth = 32, crdWidth = 32 }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : loose_compressed(nonunique), d2 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : tensor<3xf64>}> : () -> tensor<3xf64>
    %4 = "arith.constant"() <{value = dense<[0, 3]> : tensor<2xindex>}> : () -> tensor<2xindex>
    %5 = "arith.constant"() <{value = dense<[[1, 2], [5, 6], [7, 8]]> : tensor<3x2xindex>}> : () -> tensor<3x2xindex>
    %6 = "arith.constant"() <{value = dense<[0, 3]> : tensor<2xi32>}> : () -> tensor<2xi32>
    %7 = "arith.constant"() <{value = dense<[[1, 2], [5, 6], [7, 8]]> : tensor<3x2xi32>}> : () -> tensor<3x2xi32>
    %8 = "sparse_tensor.assemble"(%4, %5, %3) : (tensor<2xindex>, tensor<3x2xindex>, tensor<3xf64>) -> tensor<10x10xf64, #sparse>
    %9 = "sparse_tensor.assemble"(%6, %7, %3) : (tensor<2xi32>, tensor<3x2xi32>, tensor<3xf64>) -> tensor<10x10xf64, #sparse1>
    %10 = "arith.constant"() <{value = dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : tensor<3xf64>}> : () -> tensor<3xf64>
    %11 = "arith.constant"() <{value = dense<[0, 1, 3]> : tensor<3xi32>}> : () -> tensor<3xi32>
    %12 = "arith.constant"() <{value = dense<[1, 0, 1]> : tensor<3xi32>}> : () -> tensor<3xi32>
    %13 = "sparse_tensor.assemble"(%11, %12, %10) : (tensor<3xi32>, tensor<3xi32>, tensor<3xf64>) -> tensor<2x2xf64, #sparse2>
    %14 = "arith.constant"() <{value = dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00]> : tensor<5xf64>}> : () -> tensor<5xf64>
    %15 = "arith.constant"() <{value = dense<[0, 3, 3, 5]> : tensor<4xindex>}> : () -> tensor<4xindex>
    %16 = "arith.constant"() <{value = dense<[[1, 2], [5, 6], [7, 8], [2, 3], [4, 2], [10, 10]]> : tensor<6x2xindex>}> : () -> tensor<6x2xindex>
    %17 = "sparse_tensor.assemble"(%15, %16, %14) : (tensor<4xindex>, tensor<6x2xindex>, tensor<5xf64>) -> tensor<2x10x10xf64, #sparse3>
    "sparse_tensor.foreach"(%8) ({
    ^bb0(%arg10: index, %arg11: index, %arg12: f64):
      "vector.print"(%arg10) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg11) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg12) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<10x10xf64, #sparse>) -> ()
    "sparse_tensor.foreach"(%9) ({
    ^bb0(%arg7: index, %arg8: index, %arg9: f64):
      "vector.print"(%arg7) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg8) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg9) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<10x10xf64, #sparse1>) -> ()
    "sparse_tensor.foreach"(%13) ({
    ^bb0(%arg4: index, %arg5: index, %arg6: f64):
      "vector.print"(%arg4) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg5) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg6) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<2x2xf64, #sparse2>) -> ()
    "sparse_tensor.foreach"(%17) ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: f64):
      "vector.print"(%arg0) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg1) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg2) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg3) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<2x10x10xf64, #sparse3>) -> ()
    %18 = "tensor.empty"() : () -> tensor<3xf64>
    %19 = "tensor.empty"() : () -> tensor<2xi32>
    %20 = "tensor.empty"() : () -> tensor<3x2xi32>
    %21:6 = "sparse_tensor.disassemble"(%9, %19, %20, %18) : (tensor<10x10xf64, #sparse1>, tensor<2xi32>, tensor<3x2xi32>, tensor<3xf64>) -> (tensor<2xi32>, tensor<3x2xi32>, tensor<3xf64>, i32, i64, index)
    %22 = "vector.transfer_read"(%21#2, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<3xf64>, index, f64) -> vector<3xf64>
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf64>) -> ()
    %23 = "vector.transfer_read"(%21#1, %0, %0, %2) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<3x2xi32>, index, index, i32) -> vector<3x2xi32>
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2xi32>) -> ()
    "vector.print"(%21#5) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    %24 = "tensor.empty"() : () -> tensor<4xf64>
    %25 = "tensor.empty"() : () -> tensor<3xi32>
    %26 = "tensor.empty"() : () -> tensor<3xi32>
    %27:6 = "sparse_tensor.disassemble"(%13, %25, %26, %24) : (tensor<2x2xf64, #sparse2>, tensor<3xi32>, tensor<3xi32>, tensor<4xf64>) -> (tensor<3xi32>, tensor<3xi32>, tensor<4xf64>, i32, i64, index)
    %28 = "vector.transfer_read"(%27#2, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<4xf64>, index, f64) -> vector<3xf64>
    "vector.print"(%28) <{punctuation = #vector.punctuation<newline>}> : (vector<3xf64>) -> ()
    "vector.print"(%27#5) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    %29 = "tensor.empty"() : () -> tensor<6xf64>
    %30 = "tensor.empty"() : () -> tensor<4xindex>
    %31 = "tensor.empty"() : () -> tensor<6x2xindex>
    %32:6 = "sparse_tensor.disassemble"(%17, %30, %31, %29) : (tensor<2x10x10xf64, #sparse3>, tensor<4xindex>, tensor<6x2xindex>, tensor<6xf64>) -> (tensor<4xindex>, tensor<6x2xindex>, tensor<6xf64>, i32, tensor<i64>, index)
    %33 = "vector.transfer_read"(%32#2, %0, %1) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (tensor<6xf64>, index, f64) -> vector<5xf64>
    "vector.print"(%33) <{punctuation = #vector.punctuation<newline>}> : (vector<5xf64>) -> ()
    "vector.print"(%32#5) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    %34 = "vector.transfer_read"(%32#1, %0, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (tensor<6x2xindex>, index, index, index) -> vector<6x2xindex>
    "vector.print"(%34) <{punctuation = #vector.punctuation<newline>}> : (vector<6x2xindex>) -> ()
    %35 = "tensor.extract"(%32#4) : (tensor<i64>) -> i64
    "vector.print"(%35) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    %36 = "sparse_tensor.has_runtime_library"() : () -> i1
    "scf.if"(%36) ({
      "bufferization.dealloc_tensor"(%8) : (tensor<10x10xf64, #sparse>) -> ()
      "bufferization.dealloc_tensor"(%9) : (tensor<10x10xf64, #sparse1>) -> ()
      "bufferization.dealloc_tensor"(%13) : (tensor<2x2xf64, #sparse2>) -> ()
      "bufferization.dealloc_tensor"(%17) : (tensor<2x10x10xf64, #sparse3>) -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "bufferization.dealloc_tensor"(%32#4) : (tensor<i64>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<3xf64>) -> ()
    "bufferization.dealloc_tensor"(%19) : (tensor<2xi32>) -> ()
    "bufferization.dealloc_tensor"(%20) : (tensor<3x2xi32>) -> ()
    "bufferization.dealloc_tensor"(%24) : (tensor<4xf64>) -> ()
    "bufferization.dealloc_tensor"(%25) : (tensor<3xi32>) -> ()
    "bufferization.dealloc_tensor"(%26) : (tensor<3xi32>) -> ()
    "bufferization.dealloc_tensor"(%29) : (tensor<6xf64>) -> ()
    "bufferization.dealloc_tensor"(%30) : (tensor<4xindex>) -> ()
    "bufferization.dealloc_tensor"(%31) : (tensor<6x2xindex>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

