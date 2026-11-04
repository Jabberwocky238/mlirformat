#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index
    %6 = "arith.constant"() <{value = 3 : index}> : () -> index
    %7 = "arith.constant"() <{value = 8 : index}> : () -> index
    %8 = "arith.constant"() <{value = 1023 : index}> : () -> index
    %9 = "tensor.empty"() : () -> tensor<1024xf32, #sparse>
    %10 = "tensor.insert"(%0, %9, %4) : (f32, tensor<1024xf32, #sparse>, index) -> tensor<1024xf32, #sparse>
    %11 = "tensor.insert"(%1, %10, %5) : (f32, tensor<1024xf32, #sparse>, index) -> tensor<1024xf32, #sparse>
    %12 = "tensor.insert"(%2, %11, %6) : (f32, tensor<1024xf32, #sparse>, index) -> tensor<1024xf32, #sparse>
    %13 = "tensor.insert"(%3, %12, %8) : (f32, tensor<1024xf32, #sparse>, index) -> tensor<1024xf32, #sparse>
    %14 = "sparse_tensor.load"(%13) <{hasInserts}> : (tensor<1024xf32, #sparse>) -> tensor<1024xf32, #sparse>
    "sparse_tensor.print"(%14) : (tensor<1024xf32, #sparse>) -> ()
    %15 = "tensor.empty"() : () -> tensor<1024xf32, #sparse>
    %16 = "scf.for"(%4, %7, %5, %15) ({
    ^bb0(%arg0: index, %arg1: tensor<1024xf32, #sparse>):
      %18 = "arith.muli"(%arg0, %6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %19 = "tensor.insert"(%0, %arg1, %18) : (f32, tensor<1024xf32, #sparse>, index) -> tensor<1024xf32, #sparse>
      "scf.yield"(%19) : (tensor<1024xf32, #sparse>) -> ()
    }) : (index, index, index, tensor<1024xf32, #sparse>) -> tensor<1024xf32, #sparse>
    %17 = "sparse_tensor.load"(%16) <{hasInserts}> : (tensor<1024xf32, #sparse>) -> tensor<1024xf32, #sparse>
    "sparse_tensor.print"(%17) : (tensor<1024xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<1024xf32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%17) : (tensor<1024xf32, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

