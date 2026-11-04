"builtin.module"() ({
  "omp.declare_reduction"() <{sym_name = "add_reduction_byref_box_heap_i32", type = !llvm.ptr}> ({
  }, {
  ^bb0(%arg7: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "llvm.ptrtoint"(%arg7) : (!llvm.ptr) -> i64
    %2 = "llvm.icmp"(%1, %0) <{predicate = 0 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%2)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "llvm.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    "llvm.br"()[^bb3] : () -> ()
  ^bb3:  // 2 preds: ^bb1, ^bb2
    "omp.yield"(%arg7) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg5: !llvm.ptr, %arg6: !llvm.ptr):
    "omp.yield"(%arg5) : (!llvm.ptr) -> ()
  }, {
  }, {
  ^bb0(%arg4: !llvm.ptr):
    "omp.yield"() : () -> ()
  }, {
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, arg_attrs = [{fir.bindc_name = "x"}, {fir.bindc_name = "y"}], frame_pointer = #llvm.framePointerKind<"non-leaf">, function_type = !llvm.func<void (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "missordered_blocks_", target_cpu = "generic", target_features = #llvm.target_features<["+outline-atomics", "+v8a", "+fp-armv8", "+neon"]>, unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    "omp.parallel"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 2>, reduction_byref = array<i1: true, true>, reduction_syms = [@add_reduction_byref_box_heap_i32, @add_reduction_byref_box_heap_i32]}> ({
    ^bb0(%arg2: !llvm.ptr, %arg3: !llvm.ptr):
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.internal_name = "_QPmissordered_blocks"} : () -> ()
}) : () -> ()

