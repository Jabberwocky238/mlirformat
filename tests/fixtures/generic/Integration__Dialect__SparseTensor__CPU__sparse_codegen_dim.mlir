#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "tensor.empty"() : () -> tensor<4x5xf64, #sparse>
    %5 = "tensor.empty"(%2, %3) : (index, index) -> tensor<?x?xf64, #sparse>
    %6 = "tensor.dim"(%4, %0) : (tensor<4x5xf64, #sparse>, index) -> index
    %7 = "tensor.dim"(%5, %0) : (tensor<?x?xf64, #sparse>, index) -> index
    %8 = "tensor.dim"(%4, %1) : (tensor<4x5xf64, #sparse>, index) -> index
    %9 = "tensor.dim"(%5, %1) : (tensor<?x?xf64, #sparse>, index) -> index
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<4x5xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

