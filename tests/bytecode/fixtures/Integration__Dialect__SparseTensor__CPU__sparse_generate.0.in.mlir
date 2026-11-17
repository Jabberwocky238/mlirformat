"builtin.module"() ({
  "func.func"() <{function_type = (index) -> !llvm.ptr, sym_name = "rtsrand", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (!llvm.ptr, index) -> index, sym_name = "rtrand", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (!llvm.ptr) -> (), sym_name = "rtdrand", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (memref<?xi64>, !llvm.ptr) -> (), sym_name = "shuffle", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":12:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":13:10)
    %2 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":14:10)
    %3 = "arith.constant"() <{value = 99 : index}> : () -> index loc("<stdin>":15:10)
    %4 = "arith.constant"() <{value = 100 : index}> : () -> index loc("<stdin>":16:10)
    %5 = "arith.constant"() <{value = 50 : index}> : () -> index loc("<stdin>":17:10)
    %6 = "arith.constant"() <{value = 90 : index}> : () -> index loc("<stdin>":18:10)
    %7 = "arith.muli"(%5, %6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":19:10)
    %8 = "arith.floordivsi"(%7, %4) : (index, index) -> index loc("<stdin>":20:10)
    %9 = "arith.subi"(%5, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":21:10)
    %10 = "tensor.empty"(%5) : (index) -> tensor<?xf64> loc("<stdin>":22:11)
    %11 = "linalg.fill"(%2, %10) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f64 loc("<stdin>":24:10), %arg3: f64 loc("<stdin>":24:22)):
      "linalg.yield"(%arg2) : (f64) -> () loc("<stdin>":25:7)
    }) : (f64, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":23:11)
    %12 = "memref.alloc"(%5) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xi64> loc("<stdin>":27:11)
    %13 = "func.call"(%0) <{callee = @rtsrand}> : (index) -> !llvm.ptr loc("<stdin>":28:11)
    "func.call"(%12, %13) <{callee = @shuffle}> : (memref<?xi64>, !llvm.ptr) -> () loc("<stdin>":29:5)
    %14 = "scf.for"(%0, %9, %1, %11) ({
    ^bb0(%arg0: index loc("<stdin>":31:10), %arg1: tensor<?xf64> loc("<stdin>":31:24)):
      %17 = "memref.load"(%12, %arg0) : (memref<?xi64>, index) -> i64 loc("<stdin>":32:13)
      %18 = "arith.index_cast"(%17) : (i64) -> index loc("<stdin>":33:13)
      %19 = "func.call"(%13, %3) <{callee = @rtrand}> : (!llvm.ptr, index) -> index loc("<stdin>":34:13)
      %20 = "arith.addi"(%19, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":35:13)
      %21 = "arith.index_cast"(%20) : (index) -> i64 loc("<stdin>":36:13)
      %22 = "arith.uitofp"(%21) : (i64) -> f64 loc("<stdin>":37:13)
      %23 = "tensor.insert"(%22, %arg1, %18) : (f64, tensor<?xf64>, index) -> tensor<?xf64> loc("<stdin>":38:13)
      "scf.yield"(%23) : (tensor<?xf64>) -> () loc("<stdin>":39:7)
    }) : (index, index, index, tensor<?xf64>) -> tensor<?xf64> loc("<stdin>":30:11)
    %15 = "sparse_tensor.convert"(%14) : (tensor<?xf64>) -> tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":41:11)
    %16 = "sparse_tensor.number_of_entries"(%15) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> index loc("<stdin>":42:11)
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":43:5)
    "bufferization.dealloc_tensor"(%15) : (tensor<?xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":44:5)
    "bufferization.dealloc_tensor"(%10) : (tensor<?xf64>) -> () loc("<stdin>":45:5)
    "memref.dealloc"(%12) : (memref<?xi64>) -> () loc("<stdin>":46:5)
    "func.call"(%13) <{callee = @rtdrand}> : (!llvm.ptr) -> () loc("<stdin>":47:5)
    "func.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":11:3)
}) : () -> () loc("<stdin>":2:1)
