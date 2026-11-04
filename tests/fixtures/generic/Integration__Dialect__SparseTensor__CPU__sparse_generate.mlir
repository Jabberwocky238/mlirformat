#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "rtsrand", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr, index) -> index, sym_name = "rtrand", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "rtdrand", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi64>, !llvm.ptr) -> (), sym_name = "shuffle", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %3 = "arith.constant"() <{value = 99 : index}> : () -> index
    %4 = "arith.constant"() <{value = 100 : index}> : () -> index
    %5 = "arith.constant"() <{value = 50 : index}> : () -> index
    %6 = "arith.constant"() <{value = 90 : index}> : () -> index
    %7 = "arith.muli"(%5, %6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %8 = "arith.floordivsi"(%7, %4) : (index, index) -> index
    %9 = "arith.subi"(%5, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %10 = "tensor.empty"(%5) : (index) -> tensor<?xf64>
    %11 = "linalg.fill"(%2, %10) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f64, %arg3: f64):
      "linalg.yield"(%arg2) : (f64) -> ()
    }) : (f64, tensor<?xf64>) -> tensor<?xf64>
    %12 = "memref.alloc"(%5) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi64>
    %13 = "func.call"(%0) <{callee = @rtsrand}> : (index) -> !llvm.ptr
    "func.call"(%12, %13) <{callee = @shuffle}> : (memref<?xi64>, !llvm.ptr) -> ()
    %14 = "scf.for"(%0, %9, %1, %11) ({
    ^bb0(%arg0: index, %arg1: tensor<?xf64>):
      %17 = "memref.load"(%12, %arg0) : (memref<?xi64>, index) -> i64
      %18 = "arith.index_cast"(%17) : (i64) -> index
      %19 = "func.call"(%13, %3) <{callee = @rtrand}> : (!llvm.ptr, index) -> index
      %20 = "arith.addi"(%19, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %21 = "arith.index_cast"(%20) : (index) -> i64
      %22 = "arith.uitofp"(%21) : (i64) -> f64
      %23 = "tensor.insert"(%22, %arg1, %18) : (f64, tensor<?xf64>, index) -> tensor<?xf64>
      "scf.yield"(%23) : (tensor<?xf64>) -> ()
    }) : (index, index, index, tensor<?xf64>) -> tensor<?xf64>
    %15 = "sparse_tensor.convert"(%14) : (tensor<?xf64>) -> tensor<?xf64, #sparse>
    %16 = "sparse_tensor.number_of_entries"(%15) : (tensor<?xf64, #sparse>) -> index
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<?xf64>) -> ()
    "memref.dealloc"(%12) : (memref<?xi64>) -> ()
    "func.call"(%13) <{callee = @rtdrand}> : (!llvm.ptr) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

