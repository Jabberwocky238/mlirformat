#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton(soa)) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 3 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    %4 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %5 = "arith.constant"() <{value = 3.000000e+00 : f64}> : () -> f64
    %6 = "arith.constant"() <{value = 4.000000e+00 : f64}> : () -> f64
    %7 = "tensor.empty"() : () -> tensor<4x3xf64, #sparse>
    %8 = "tensor.insert"(%3, %7, %0, %0) : (f64, tensor<4x3xf64, #sparse>, index, index) -> tensor<4x3xf64, #sparse>
    %9 = "tensor.insert"(%4, %8, %1, %1) : (f64, tensor<4x3xf64, #sparse>, index, index) -> tensor<4x3xf64, #sparse>
    %10 = "tensor.insert"(%5, %9, %2, %0) : (f64, tensor<4x3xf64, #sparse>, index, index) -> tensor<4x3xf64, #sparse>
    %11 = "tensor.insert"(%6, %10, %2, %1) : (f64, tensor<4x3xf64, #sparse>, index, index) -> tensor<4x3xf64, #sparse>
    %12 = "sparse_tensor.load"(%11) <{hasInserts}> : (tensor<4x3xf64, #sparse>) -> tensor<4x3xf64, #sparse>
    "sparse_tensor.print"(%12) : (tensor<4x3xf64, #sparse>) -> ()
    %13 = "tensor.empty"() : () -> tensor<4x3xf64, #sparse1>
    %14 = "tensor.insert"(%3, %13, %0, %0) : (f64, tensor<4x3xf64, #sparse1>, index, index) -> tensor<4x3xf64, #sparse1>
    %15 = "tensor.insert"(%4, %14, %1, %1) : (f64, tensor<4x3xf64, #sparse1>, index, index) -> tensor<4x3xf64, #sparse1>
    %16 = "tensor.insert"(%5, %15, %2, %0) : (f64, tensor<4x3xf64, #sparse1>, index, index) -> tensor<4x3xf64, #sparse1>
    %17 = "tensor.insert"(%6, %16, %2, %1) : (f64, tensor<4x3xf64, #sparse1>, index, index) -> tensor<4x3xf64, #sparse1>
    %18 = "sparse_tensor.load"(%17) <{hasInserts}> : (tensor<4x3xf64, #sparse1>) -> tensor<4x3xf64, #sparse1>
    "sparse_tensor.print"(%18) : (tensor<4x3xf64, #sparse1>) -> ()
    %19 = "tensor.empty"() : () -> tensor<4x3xf64, #sparse2>
    %20 = "tensor.insert"(%3, %19, %0, %0) : (f64, tensor<4x3xf64, #sparse2>, index, index) -> tensor<4x3xf64, #sparse2>
    %21 = "tensor.insert"(%4, %20, %1, %1) : (f64, tensor<4x3xf64, #sparse2>, index, index) -> tensor<4x3xf64, #sparse2>
    %22 = "tensor.insert"(%5, %21, %2, %0) : (f64, tensor<4x3xf64, #sparse2>, index, index) -> tensor<4x3xf64, #sparse2>
    %23 = "tensor.insert"(%6, %22, %2, %1) : (f64, tensor<4x3xf64, #sparse2>, index, index) -> tensor<4x3xf64, #sparse2>
    %24 = "sparse_tensor.load"(%23) <{hasInserts}> : (tensor<4x3xf64, #sparse2>) -> tensor<4x3xf64, #sparse2>
    "sparse_tensor.print"(%24) : (tensor<4x3xf64, #sparse2>) -> ()
    %25 = "tensor.empty"() : () -> tensor<4x3xf64, #sparse3>
    %26 = "tensor.insert"(%3, %25, %0, %0) : (f64, tensor<4x3xf64, #sparse3>, index, index) -> tensor<4x3xf64, #sparse3>
    %27 = "tensor.insert"(%4, %26, %1, %1) : (f64, tensor<4x3xf64, #sparse3>, index, index) -> tensor<4x3xf64, #sparse3>
    %28 = "tensor.insert"(%5, %27, %2, %0) : (f64, tensor<4x3xf64, #sparse3>, index, index) -> tensor<4x3xf64, #sparse3>
    %29 = "tensor.insert"(%6, %28, %2, %1) : (f64, tensor<4x3xf64, #sparse3>, index, index) -> tensor<4x3xf64, #sparse3>
    %30 = "sparse_tensor.load"(%29) <{hasInserts}> : (tensor<4x3xf64, #sparse3>) -> tensor<4x3xf64, #sparse3>
    "sparse_tensor.print"(%30) : (tensor<4x3xf64, #sparse3>) -> ()
    %31 = "tensor.empty"() : () -> tensor<4x3xf64, #sparse4>
    %32 = "tensor.insert"(%3, %31, %0, %0) : (f64, tensor<4x3xf64, #sparse4>, index, index) -> tensor<4x3xf64, #sparse4>
    %33 = "tensor.insert"(%4, %32, %1, %1) : (f64, tensor<4x3xf64, #sparse4>, index, index) -> tensor<4x3xf64, #sparse4>
    %34 = "tensor.insert"(%5, %33, %2, %0) : (f64, tensor<4x3xf64, #sparse4>, index, index) -> tensor<4x3xf64, #sparse4>
    %35 = "tensor.insert"(%6, %34, %2, %1) : (f64, tensor<4x3xf64, #sparse4>, index, index) -> tensor<4x3xf64, #sparse4>
    %36 = "sparse_tensor.load"(%35) <{hasInserts}> : (tensor<4x3xf64, #sparse4>) -> tensor<4x3xf64, #sparse4>
    "sparse_tensor.print"(%36) : (tensor<4x3xf64, #sparse4>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<4x3xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%18) : (tensor<4x3xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%24) : (tensor<4x3xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%30) : (tensor<4x3xf64, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%36) : (tensor<4x3xf64, #sparse4>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

