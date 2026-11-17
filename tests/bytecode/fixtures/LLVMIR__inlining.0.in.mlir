"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr) -> i32, sym_name = "inner_func_inlinable"}> ({
  ^bb0(%arg1: !llvm.ptr loc("<stdin>":6:8)):
    %1 = "llvm.mlir.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":7:10)
    %2 = "llvm.intr.stacksave"() : () -> !llvm.ptr loc("<stdin>":8:10)
    "llvm.store"(%1, %arg1) <{alignment = 8 : i64, ordering = 0 : i64}> : (i32, !llvm.ptr) -> () loc("<stdin>":9:5)
    %3 = "llvm.load"(%arg1) <{alignment = 8 : i64, ordering = 0 : i64}> : (!llvm.ptr) -> i32 loc("<stdin>":10:10)
    "llvm.intr.dbg.value"(%1) <{locationExpr = #llvm.di_expression<>, varInfo = #llvm.di_local_variable<scope = #llvm.di_file<"foo.mlir" in "/foo/">>}> : (i32) -> () loc("<stdin>":11:5)
    "llvm.intr.dbg.declare"(%arg1) <{locationExpr = #llvm.di_expression<>, varInfo = #llvm.di_local_variable<scope = #llvm.di_file<"foo.mlir" in "/foo/">>}> : (!llvm.ptr) -> () loc("<stdin>":12:5)
    "llvm.intr.dbg.label"() <{label = #llvm.di_label<scope = #llvm.di_file<"foo.mlir" in "/foo/">>}> : () -> () loc("<stdin>":13:5)
    %4 = "llvm.mlir.constant"() <{value = 43 : i8}> : () -> i8 loc("<stdin>":14:10)
    %5 = "llvm.mlir.constant"() <{value = true}> : () -> i1 loc("<stdin>":15:10)
    "llvm.intr.memset"(%arg1, %4, %1) <{isVolatile = true}> : (!llvm.ptr, i8, i32) -> () loc("<stdin>":16:5)
    "llvm.intr.memmove"(%arg1, %arg1, %1) <{isVolatile = true}> : (!llvm.ptr, !llvm.ptr, i32) -> () loc("<stdin>":17:5)
    "llvm.intr.memcpy"(%arg1, %arg1, %1) <{isVolatile = true}> : (!llvm.ptr, !llvm.ptr, i32) -> () loc("<stdin>":18:5)
    "llvm.intr.assume"(%5) <{op_bundle_sizes = array<i32>}> : (i1) -> () loc("<stdin>":19:5)
    "llvm.fence"() <{ordering = 5 : i64}> : () -> () loc("<stdin>":20:5)
    %6 = "llvm.atomicrmw"(%arg1, %1) <{bin_op = 1 : i64, ordering = 2 : i64}> : (!llvm.ptr, i32) -> i32 loc("<stdin>":21:10)
    %7 = "llvm.cmpxchg"(%arg1, %1, %3) <{failure_ordering = 2 : i64, success_ordering = 6 : i64}> : (!llvm.ptr, i32, i32) -> !llvm.struct<(i32, i1)> loc("<stdin>":22:10)
    "llvm.inline_asm"() <{asm_string = "foo", constraints = "bar", has_side_effects, tail_call_kind = #llvm.tailcallkind<none>}> : () -> () loc("<stdin>":23:5)
    "llvm.cond_br"(%5)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":24:5)
  ^bb1:  // pred: ^bb0
    "llvm.unreachable"() : () -> () loc("<stdin>":26:5)
  ^bb2:  // pred: ^bb0
    "llvm.intr.stackrestore"(%2) : (!llvm.ptr) -> () loc("<stdin>":28:5)
    %8 = "llvm.call_intrinsic"() <{fastmathFlags = #llvm.fastmath<none>, intrin = "llvm.x86.sse41.round.ss", op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> vector<8xf32> loc("<stdin>":29:10)
    "func.return"(%3) : (i32) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (!llvm.ptr) -> i32, sym_name = "test_inline"}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":33:8)):
    %0 = "func.call"(%arg0) <{callee = @inner_func_inlinable}> : (!llvm.ptr) -> i32 loc("<stdin>":34:10)
    "func.return"(%0) : (i32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":4:1)
