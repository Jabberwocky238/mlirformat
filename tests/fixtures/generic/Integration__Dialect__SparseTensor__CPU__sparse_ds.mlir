#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : loose_compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]), crdWidth = 8 }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 8 : dense, d1 mod 8 : structured[5, 8]), crdWidth = 8 }>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "getTensorFilename", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "func.call"(%0) <{callee = @getTensorFilename}> : (index) -> !llvm.ptr
    %2 = "sparse_tensor.new"(%1) : (!llvm.ptr) -> tensor<?x?xf64, #sparse>
    %3 = "sparse_tensor.new"(%1) : (!llvm.ptr) -> tensor<?x?xf64, #sparse1>
    %4 = "sparse_tensor.new"(%1) : (!llvm.ptr) -> tensor<?x?xf64, #sparse2>
    %5 = "sparse_tensor.new"(%1) : (!llvm.ptr) -> tensor<?x?xf64, #sparse3>
    "sparse_tensor.print"(%2) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%3) : (tensor<?x?xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%4) : (tensor<?x?xf64, #sparse2>) -> ()
    "sparse_tensor.print"(%5) : (tensor<?x?xf64, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse3>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

