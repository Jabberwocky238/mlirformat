#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : dense, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : dense) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed(nonunique), d2 : singleton) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed(nonunique), d2 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1.100000e+00 : f64}> : () -> f64
    %6 = "arith.constant"() <{value = 2.200000e+00 : f64}> : () -> f64
    %7 = "arith.constant"() <{value = 3.300000e+00 : f64}> : () -> f64
    %8 = "arith.constant"() <{value = 4.400000e+00 : f64}> : () -> f64
    %9 = "arith.constant"() <{value = 5.500000e+00 : f64}> : () -> f64
    %10 = "tensor.empty"() : () -> tensor<5x4x3xf64, #sparse>
    %11 = "tensor.insert"(%5, %10, %3, %0, %1) : (f64, tensor<5x4x3xf64, #sparse>, index, index, index) -> tensor<5x4x3xf64, #sparse>
    %12 = "tensor.insert"(%6, %11, %3, %0, %2) : (f64, tensor<5x4x3xf64, #sparse>, index, index, index) -> tensor<5x4x3xf64, #sparse>
    %13 = "tensor.insert"(%7, %12, %3, %3, %1) : (f64, tensor<5x4x3xf64, #sparse>, index, index, index) -> tensor<5x4x3xf64, #sparse>
    %14 = "tensor.insert"(%8, %13, %4, %2, %2) : (f64, tensor<5x4x3xf64, #sparse>, index, index, index) -> tensor<5x4x3xf64, #sparse>
    %15 = "tensor.insert"(%9, %14, %4, %3, %2) : (f64, tensor<5x4x3xf64, #sparse>, index, index, index) -> tensor<5x4x3xf64, #sparse>
    %16 = "sparse_tensor.load"(%15) <{hasInserts}> : (tensor<5x4x3xf64, #sparse>) -> tensor<5x4x3xf64, #sparse>
    "sparse_tensor.print"(%16) : (tensor<5x4x3xf64, #sparse>) -> ()
    %17 = "tensor.empty"() : () -> tensor<5x4x3xf64, #sparse1>
    %18 = "tensor.insert"(%5, %17, %3, %0, %1) : (f64, tensor<5x4x3xf64, #sparse1>, index, index, index) -> tensor<5x4x3xf64, #sparse1>
    %19 = "tensor.insert"(%6, %18, %3, %0, %2) : (f64, tensor<5x4x3xf64, #sparse1>, index, index, index) -> tensor<5x4x3xf64, #sparse1>
    %20 = "tensor.insert"(%7, %19, %3, %3, %1) : (f64, tensor<5x4x3xf64, #sparse1>, index, index, index) -> tensor<5x4x3xf64, #sparse1>
    %21 = "tensor.insert"(%8, %20, %4, %2, %2) : (f64, tensor<5x4x3xf64, #sparse1>, index, index, index) -> tensor<5x4x3xf64, #sparse1>
    %22 = "tensor.insert"(%9, %21, %4, %3, %2) : (f64, tensor<5x4x3xf64, #sparse1>, index, index, index) -> tensor<5x4x3xf64, #sparse1>
    %23 = "sparse_tensor.load"(%22) <{hasInserts}> : (tensor<5x4x3xf64, #sparse1>) -> tensor<5x4x3xf64, #sparse1>
    "sparse_tensor.print"(%23) : (tensor<5x4x3xf64, #sparse1>) -> ()
    %24 = "tensor.empty"() : () -> tensor<5x4x3xf64, #sparse2>
    %25 = "tensor.insert"(%5, %24, %3, %0, %1) : (f64, tensor<5x4x3xf64, #sparse2>, index, index, index) -> tensor<5x4x3xf64, #sparse2>
    %26 = "tensor.insert"(%6, %25, %3, %0, %2) : (f64, tensor<5x4x3xf64, #sparse2>, index, index, index) -> tensor<5x4x3xf64, #sparse2>
    %27 = "tensor.insert"(%7, %26, %3, %3, %1) : (f64, tensor<5x4x3xf64, #sparse2>, index, index, index) -> tensor<5x4x3xf64, #sparse2>
    %28 = "tensor.insert"(%8, %27, %4, %2, %2) : (f64, tensor<5x4x3xf64, #sparse2>, index, index, index) -> tensor<5x4x3xf64, #sparse2>
    %29 = "tensor.insert"(%9, %28, %4, %3, %2) : (f64, tensor<5x4x3xf64, #sparse2>, index, index, index) -> tensor<5x4x3xf64, #sparse2>
    %30 = "sparse_tensor.load"(%29) <{hasInserts}> : (tensor<5x4x3xf64, #sparse2>) -> tensor<5x4x3xf64, #sparse2>
    "sparse_tensor.print"(%30) : (tensor<5x4x3xf64, #sparse2>) -> ()
    %31 = "tensor.empty"() : () -> tensor<5x4x3xf64, #sparse3>
    %32 = "tensor.insert"(%5, %31, %3, %0, %1) : (f64, tensor<5x4x3xf64, #sparse3>, index, index, index) -> tensor<5x4x3xf64, #sparse3>
    %33 = "tensor.insert"(%6, %32, %3, %0, %2) : (f64, tensor<5x4x3xf64, #sparse3>, index, index, index) -> tensor<5x4x3xf64, #sparse3>
    %34 = "tensor.insert"(%7, %33, %3, %3, %1) : (f64, tensor<5x4x3xf64, #sparse3>, index, index, index) -> tensor<5x4x3xf64, #sparse3>
    %35 = "tensor.insert"(%8, %34, %4, %2, %2) : (f64, tensor<5x4x3xf64, #sparse3>, index, index, index) -> tensor<5x4x3xf64, #sparse3>
    %36 = "tensor.insert"(%9, %35, %4, %3, %2) : (f64, tensor<5x4x3xf64, #sparse3>, index, index, index) -> tensor<5x4x3xf64, #sparse3>
    %37 = "sparse_tensor.load"(%36) <{hasInserts}> : (tensor<5x4x3xf64, #sparse3>) -> tensor<5x4x3xf64, #sparse3>
    "sparse_tensor.print"(%37) : (tensor<5x4x3xf64, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%16) : (tensor<5x4x3xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%23) : (tensor<5x4x3xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%30) : (tensor<5x4x3xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%37) : (tensor<5x4x3xf64, #sparse3>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

