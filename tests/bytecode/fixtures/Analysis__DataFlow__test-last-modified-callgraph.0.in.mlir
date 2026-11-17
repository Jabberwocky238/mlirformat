"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "single_callsite_fn", sym_visibility = "private"}> ({
  ^bb0(%arg11: memref<i32> loc("<stdin>":3:8)):
    "func.return"(%arg11) {tag = "test_callsite"} : (memref<i32>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "test_callsite"}> ({
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32> loc("<stdin>":7:10)
    %6 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":8:10)
    "memref.store"(%6, %5) {tag_name = "a"} : (i32, memref<i32>) -> () loc("<stdin>":9:5)
    %7 = "func.call"(%5) <{callee = @single_callsite_fn}> : (memref<i32>) -> memref<i32> loc("<stdin>":10:10)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "single_return_site_fn", sym_visibility = "private"}> ({
  ^bb0(%arg10: memref<i32> loc("<stdin>":14:8)):
    %4 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":15:10)
    "memref.store"(%4, %arg10) {tag_name = "b"} : (i32, memref<i32>) -> () loc("<stdin>":16:5)
    "func.return"(%arg10) : (memref<i32>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "test_return_site"}> ({
  ^bb0(%arg9: memref<i32> loc("<stdin>":20:8)):
    %3 = "func.call"(%arg9) <{callee = @single_return_site_fn}> : (memref<i32>) -> memref<i32> loc("<stdin>":21:10)
    "func.return"(%3) {tag = "test_return_site"} : (memref<i32>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = (memref<i32>) -> memref<i32>, sym_name = "multiple_callsite_fn", sym_visibility = "private"}> ({
  ^bb0(%arg8: memref<i32> loc("<stdin>":25:8)):
    "func.return"(%arg8) {tag = "test_multiple_callsites"} : (memref<i32>) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = (i32, memref<i32>) -> memref<i32>, sym_name = "test_multiple_callsites"}> ({
  ^bb0(%arg6: i32 loc("<stdin>":29:8), %arg7: memref<i32> loc("<stdin>":29:20)):
    "memref.store"(%arg6, %arg7) {tag_name = "write0"} : (i32, memref<i32>) -> () loc("<stdin>":30:5)
    %1 = "func.call"(%arg7) <{callee = @multiple_callsite_fn}> : (memref<i32>) -> memref<i32> loc("<stdin>":31:10)
    "memref.store"(%arg6, %arg7) {tag_name = "write1"} : (i32, memref<i32>) -> () loc("<stdin>":32:5)
    %2 = "func.call"(%arg7) <{callee = @multiple_callsite_fn}> : (memref<i32>) -> memref<i32> loc("<stdin>":33:10)
    "func.return"(%arg7) : (memref<i32>) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (i1, i32, memref<i32>) -> memref<i32>, sym_name = "multiple_return_site_fn", sym_visibility = "private"}> ({
  ^bb0(%arg3: i1 loc("<stdin>":37:8), %arg4: i32 loc("<stdin>":37:19), %arg5: memref<i32> loc("<stdin>":37:31)):
    "cf.cond_br"(%arg3)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":38:5)
  ^bb1:  // pred: ^bb0
    "memref.store"(%arg4, %arg5) {tag_name = "return0"} : (i32, memref<i32>) -> () loc("<stdin>":40:5)
    "func.return"(%arg5) : (memref<i32>) -> () loc("<stdin>":41:5)
  ^bb2:  // pred: ^bb0
    "memref.store"(%arg4, %arg5) {tag_name = "return1"} : (i32, memref<i32>) -> () loc("<stdin>":43:5)
    "func.return"(%arg5) : (memref<i32>) -> () loc("<stdin>":44:5)
  }) : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (i1, i32, memref<i32>) -> memref<i32>, sym_name = "test_multiple_return_sites"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":47:8), %arg1: i32 loc("<stdin>":47:19), %arg2: memref<i32> loc("<stdin>":47:31)):
    %0 = "func.call"(%arg0, %arg1, %arg2) <{callee = @multiple_return_site_fn}> : (i1, i32, memref<i32>) -> memref<i32> loc("<stdin>":48:10)
    "func.return"(%0) {tag = "test_multiple_return_sites"} : (memref<i32>) -> () loc("<stdin>":49:5)
  }) : () -> () loc("<stdin>":46:3)
}) : () -> () loc("<stdin>":1:1)
