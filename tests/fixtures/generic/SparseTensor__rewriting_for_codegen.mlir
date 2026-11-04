#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<?x?xf32, #sparse>, sym_name = "sparse_new"}> ({
  ^bb0(%arg4: !llvm.ptr):
    %2 = "sparse_tensor.new"(%arg4) : (!llvm.ptr) -> tensor<?x?xf32, #sparse>
    "func.return"(%2) : (tensor<?x?xf32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<?x?xf32, #sparse1>, sym_name = "sparse_new_csc"}> ({
  ^bb0(%arg3: !llvm.ptr):
    %1 = "sparse_tensor.new"(%arg3) : (!llvm.ptr) -> tensor<?x?xf32, #sparse1>
    "func.return"(%1) : (tensor<?x?xf32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> tensor<?x?xf32, #sparse2>, sym_name = "sparse_new_coo"}> ({
  ^bb0(%arg2: !llvm.ptr):
    %0 = "sparse_tensor.new"(%arg2) : (!llvm.ptr) -> tensor<?x?xf32, #sparse2>
    "func.return"(%0) : (tensor<?x?xf32, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x20xf32, #sparse>, !llvm.ptr) -> (), sym_name = "sparse_out"}> ({
  ^bb0(%arg0: tensor<10x20xf32, #sparse>, %arg1: !llvm.ptr):
    "sparse_tensor.out"(%arg0, %arg1) : (tensor<10x20xf32, #sparse>, !llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

