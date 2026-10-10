#di_file = #llvm.di_file<"foo.mlir" in "/foo/">
#di_label = #llvm.di_label<scope = #di_file>
#di_local_variable = #llvm.di_local_variable<scope = #di_file>
module {
  func.func @inner_func_inlinable(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(42 : i32) : i32
    %1 = llvm.intr.stacksave : !llvm.ptr
    llvm.store %0, %arg0 {alignment = 8 : i64} : i32, !llvm.ptr
    %2 = llvm.load %arg0 {alignment = 8 : i64} : !llvm.ptr -> i32
    llvm.intr.dbg.value #di_local_variable = %0 : i32
    llvm.intr.dbg.declare #di_local_variable = %arg0 : !llvm.ptr
    llvm.intr.dbg.label #di_label
    %3 = llvm.mlir.constant(43 : i8) : i8
    %4 = llvm.mlir.constant(true) : i1
    "llvm.intr.memset"(%arg0, %3, %0) <{isVolatile = true}> : (!llvm.ptr, i8, i32) -> ()
    "llvm.intr.memmove"(%arg0, %arg0, %0) <{isVolatile = true}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memcpy"(%arg0, %arg0, %0) <{isVolatile = true}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    llvm.intr.assume %4 : i1
    llvm.fence release
    %5 = llvm.atomicrmw add %arg0, %0 monotonic : !llvm.ptr, i32
    %6 = llvm.cmpxchg %arg0, %0, %2 acq_rel monotonic : !llvm.ptr, i32
    llvm.inline_asm has_side_effects "foo", "bar"  : () -> ()
    llvm.cond_br %4, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.unreachable
  ^bb2:  // pred: ^bb0
    llvm.intr.stackrestore %1 : !llvm.ptr
    %7 = llvm.call_intrinsic "llvm.x86.sse41.round.ss"() : () -> vector<8xf32>
    return %2 : i32
  }
  func.func @test_inline(%arg0: !llvm.ptr) -> i32 {
    %0 = call @inner_func_inlinable(%arg0) : (!llvm.ptr) -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func @func(%arg0: i32) -> i32 {
    llvm.return %arg0 : i32
  }
  func.func @llvm_ret(%arg0: i32) -> i32 {
    %0 = call @func(%arg0) : (i32) -> i32
    return %0 : i32
  }
}

// -----
module {
  llvm.func internal fastcc @callee() -> i32 attributes {dso_local, function_entry_count = 42 : i64} {
    %0 = llvm.mlir.constant(42 : i32) : i32
    llvm.return %0 : i32
  }
  llvm.func @caller() -> i32 {
    %0 = llvm.call fastcc @callee() {branch_weights = dense<42> : vector<1xi32>, fastmathFlags = #llvm.fastmath<nnan, ninf>} : () -> i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @foo() -> i32 attributes {no_inline} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.return %0 : i32
  }
  llvm.func @bar() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    llvm.return %0 : i32
  }
  llvm.func @callee_with_multiple_blocks(%arg0: i1) -> i32 {
    llvm.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %0 = llvm.call @foo() : () -> i32
    llvm.br ^bb3(%0 : i32)
  ^bb2:  // pred: ^bb0
    %1 = llvm.call @bar() {no_inline} : () -> i32
    llvm.br ^bb3(%1 : i32)
  ^bb3(%2: i32):  // 2 preds: ^bb1, ^bb2
    llvm.return %2 : i32
  }
  llvm.func @caller(%arg0: i1) -> i32 {
    %0 = llvm.call @callee_with_multiple_blocks(%arg0) : (i1) -> i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @personality() -> i32
  llvm.func @callee() -> i32 attributes {personality = @personality} {
    %0 = llvm.mlir.constant(42 : i32) : i32
    llvm.return %0 : i32
  }
  llvm.func @caller() -> i32 {
    %0 = llvm.call @callee() : () -> i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @callee() attributes {passthrough = ["foo", "bar"]} {
    llvm.return
  }
  llvm.func @caller() {
    llvm.call @callee() : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @callee_noinline() attributes {no_inline} {
    llvm.return
  }
  llvm.func @callee_noduplicate() attributes {passthrough = ["noduplicate"]} {
    llvm.return
  }
  llvm.func @callee_presplitcoroutine() attributes {passthrough = ["presplitcoroutine"]} {
    llvm.return
  }
  llvm.func @callee_returns_twice() attributes {passthrough = ["returns_twice"]} {
    llvm.return
  }
  llvm.func @callee_strictfp() attributes {passthrough = ["strictfp"]} {
    llvm.return
  }
  llvm.func @caller() {
    llvm.call @callee_noinline() : () -> ()
    llvm.call @callee_noduplicate() : () -> ()
    llvm.call @callee_presplitcoroutine() : () -> ()
    llvm.call @callee_returns_twice() : () -> ()
    llvm.call @callee_strictfp() : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @static_alloca() -> f32 {
    %0 = llvm.mlir.constant(4 : i32) : i32
    %1 = llvm.alloca %0 x f32 : (i32) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> f32
    llvm.return %2 : f32
  }
  llvm.func @dynamic_alloca(%arg0: i32) -> f32 {
    %0 = llvm.add %arg0, %arg0 : i32
    %1 = llvm.alloca %0 x f32 : (i32) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> f32
    llvm.return %2 : f32
  }
  llvm.func @test_inline(%arg0: i1, %arg1: i32) -> f32 {
    llvm.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %0 = llvm.call @static_alloca() : () -> f32
    llvm.br ^bb3(%0 : f32)
  ^bb2:  // pred: ^bb0
    %1 = llvm.call @dynamic_alloca(%arg1) : (i32) -> f32
    llvm.br ^bb3(%1 : f32)
  ^bb3(%2: f32):  // 2 preds: ^bb1, ^bb2
    llvm.return %2 : f32
  }
}

// -----
module {
  llvm.func @static_alloca_not_in_entry(%arg0: i1) -> f32 {
    llvm.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %0 = llvm.mlir.constant(4 : i32) : i32
    %1 = llvm.alloca %0 x f32 : (i32) -> !llvm.ptr
    llvm.br ^bb3(%1 : !llvm.ptr)
  ^bb2:  // pred: ^bb0
    %2 = llvm.mlir.constant(8 : i32) : i32
    %3 = llvm.alloca %2 x f32 : (i32) -> !llvm.ptr
    llvm.br ^bb3(%3 : !llvm.ptr)
  ^bb3(%4: !llvm.ptr):  // 2 preds: ^bb1, ^bb2
    %5 = llvm.load %4 : !llvm.ptr -> f32
    llvm.return %5 : f32
  }
  llvm.func @test_inline(%arg0: i1) -> f32 {
    %0 = llvm.call @static_alloca_not_in_entry(%arg0) : (i1) -> f32
    llvm.return %0 : f32
  }
}

// -----
module {
  llvm.func @static_alloca(%arg0: i1) -> f32 {
    %0 = llvm.mlir.constant(4 : i32) : i32
    %1 = llvm.alloca %0 x f32 : (i32) -> !llvm.ptr
    llvm.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %2 = llvm.load %1 : !llvm.ptr -> f32
    llvm.return %2 : f32
  ^bb2:  // pred: ^bb0
    %3 = llvm.mlir.constant(3.141920e+00 : f32) : f32
    llvm.return %3 : f32
  }
  llvm.func @test_inline(%arg0: i1, %arg1: i1, %arg2: f32) -> f32 {
    llvm.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %0 = llvm.call @static_alloca(%arg1) : (i1) -> f32
    llvm.br ^bb3(%0 : f32)
  ^bb2:  // pred: ^bb0
    llvm.br ^bb3(%arg2 : f32)
  ^bb3(%1: f32):  // 2 preds: ^bb1, ^bb2
    llvm.return %1 : f32
  }
}

// -----
module {
  llvm.func @static_alloca() -> f32 {
    %0 = llvm.mlir.constant(4 : i32) : i32
    %1 = llvm.alloca %0 x f32 : (i32) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> f32
    llvm.return %2 : f32
  }
  llvm.func @test_inline(%arg0: i1) {
    "test.one_region_op"() ({
      %0 = llvm.call @static_alloca() : () -> f32
      test.region_yield %0 : f32
    }) : () -> ()
    test.isolated_regions {
      %0 = llvm.call @static_alloca() : () -> f32
      test.region_yield %0 : f32
    }
    test.alloca_scope_region {
      %0 = llvm.call @static_alloca() : () -> f32
      test.region_yield %0 : f32
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @alloca_with_lifetime(%arg0: i1) -> f32 {
    %0 = llvm.mlir.constant(4 : i32) : i32
    %1 = llvm.alloca %0 x f32 : (i32) -> !llvm.ptr
    llvm.intr.lifetime.start %1 : !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> f32
    llvm.intr.lifetime.end %1 : !llvm.ptr
    %3 = llvm.fadd %2, %2 : f32
    llvm.return %3 : f32
  }
  llvm.func @test_inline(%arg0: i1, %arg1: i1, %arg2: f32) -> f32 {
    llvm.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %0 = llvm.call @alloca_with_lifetime(%arg1) : (i1) -> f32
    llvm.br ^bb3(%0 : f32)
  ^bb2:  // pred: ^bb0
    llvm.br ^bb3(%arg2 : f32)
  ^bb3(%1: f32):  // 2 preds: ^bb1, ^bb2
    llvm.return %1 : f32
  }
}

// -----
module {
  llvm.func @with_byval_arg(%arg0: !llvm.ptr {llvm.byval = f64}) {
    llvm.return
  }
  llvm.func @test_byval(%arg0: !llvm.ptr) {
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.call @with_byval_arg(%arg0) : (!llvm.ptr) -> ()
    llvm.br ^bb2
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}

// -----
module {
  llvm.func @with_byval_arg(%arg0: !llvm.ptr {llvm.byval = f64}) attributes {memory_effects = #llvm.memory_effects<other = readwrite, argMem = read, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} {
    llvm.return
  }
  llvm.func @test_byval_read_only(%arg0: !llvm.ptr) {
    llvm.call @with_byval_arg(%arg0) : (!llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @with_byval_arg(%arg0: !llvm.ptr {llvm.byval = f64}) attributes {memory_effects = #llvm.memory_effects<other = readwrite, argMem = write, inaccessibleMem = readwrite, errnoMem = none, targetMem0 = none, targetMem1 = none>} {
    llvm.return
  }
  llvm.func @test_byval_write_only(%arg0: !llvm.ptr) {
    llvm.call @with_byval_arg(%arg0) : (!llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @aligned_byval_arg(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.byval = i16}) attributes {memory_effects = #llvm.memory_effects<other = read, argMem = read, inaccessibleMem = read, errnoMem = none, targetMem0 = none, targetMem1 = none>} {
    llvm.return
  }
  llvm.func @test_byval_input_aligned(%arg0: !llvm.ptr, %arg1: !llvm.ptr {llvm.align = 16 : i64}) {
    llvm.call @aligned_byval_arg(%arg0) : (!llvm.ptr) -> ()
    llvm.call @aligned_byval_arg(%arg1) : (!llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @func_that_uses_ptr(!llvm.ptr)
  llvm.func @aligned_byval_arg(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.byval = i16}) attributes {memory_effects = #llvm.memory_effects<other = read, argMem = read, inaccessibleMem = read, errnoMem = none, targetMem0 = none, targetMem1 = none>} {
    llvm.call @func_that_uses_ptr(%arg0) : (!llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @test_byval_realign_alloca() {
    %0 = llvm.mlir.constant(4 : i64) : i64
    %1 = llvm.alloca %0 x i16 {alignment = 1 : i64} : (i64) -> !llvm.ptr
    llvm.call @aligned_byval_arg(%1) : (!llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.stack_alignment" = 32 : i32>} {
  llvm.func @func_that_uses_ptr(!llvm.ptr)
  llvm.func @aligned_byval_arg(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.byval = i16}) attributes {memory_effects = #llvm.memory_effects<other = read, argMem = read, inaccessibleMem = read, errnoMem = none, targetMem0 = none, targetMem1 = none>} {
    llvm.call @func_that_uses_ptr(%arg0) : (!llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @test_exceeds_natural_stack_alignment() {
    %0 = llvm.mlir.constant(4 : i64) : i64
    %1 = llvm.alloca %0 x i16 {alignment = 2 : i64} : (i64) -> !llvm.ptr
    llvm.call @aligned_byval_arg(%1) : (!llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.stack_alignment" = 32 : i32>} {
  llvm.func @func_that_uses_ptr(!llvm.ptr)
  llvm.func @aligned_byval_arg(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.byval = i16}) attributes {memory_effects = #llvm.memory_effects<other = read, argMem = read, inaccessibleMem = read, errnoMem = none, targetMem0 = none, targetMem1 = none>} {
    llvm.call @func_that_uses_ptr(%arg0) : (!llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @test_alignment_exceeded_anyway() {
    %0 = llvm.mlir.constant(4 : i64) : i64
    %1 = llvm.alloca %0 x i16 {alignment = 8 : i64} : (i64) -> !llvm.ptr
    llvm.call @aligned_byval_arg(%1) : (!llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.mlir.global private @unaligned_global(42 : i64) {addr_space = 0 : i32} : i64
  llvm.mlir.global private @aligned_global(42 : i64) {addr_space = 0 : i32, alignment = 64 : i64} : i64
  llvm.func @aligned_byval_arg(%arg0: !llvm.ptr {llvm.align = 16 : i64, llvm.byval = i16}) attributes {memory_effects = #llvm.memory_effects<other = read, argMem = read, inaccessibleMem = read, errnoMem = none, targetMem0 = none, targetMem1 = none>} {
    llvm.return
  }
  llvm.func @test_byval_global() {
    %0 = llvm.mlir.addressof @unaligned_global : !llvm.ptr
    llvm.call @aligned_byval_arg(%0) : (!llvm.ptr) -> ()
    %1 = llvm.mlir.addressof @aligned_global : !llvm.ptr
    llvm.call @aligned_byval_arg(%1) : (!llvm.ptr) -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @ignored_attrs(%arg0: !llvm.ptr {llvm.alignstack = 32 : i64, llvm.inreg, llvm.nocapture, llvm.nofree, llvm.nonnull, llvm.noundef, llvm.preallocated = i32, llvm.returned, llvm.writeonly}, %arg1: i32 {llvm.zeroext}) -> (!llvm.ptr {llvm.inreg, llvm.nonnull, llvm.noundef}) {
    llvm.return %arg0 : !llvm.ptr
  }
  llvm.func @test_ignored_attrs(%arg0: !llvm.ptr, %arg1: i32) {
    %0 = llvm.call @ignored_attrs(%arg0, %arg1) : (!llvm.ptr, i32) -> !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @disallowed_arg_attr(%arg0: !llvm.ptr {llvm.inalloca = i64}) {
    llvm.return
  }
  llvm.func @test_disallow_arg_attr(%arg0: !llvm.ptr) {
    llvm.call @disallowed_arg_attr(%arg0) : (!llvm.ptr) -> ()
    llvm.return
  }
}

// -----
#access_group = #llvm.access_group<id = distinct[0]<>>
#access_group1 = #llvm.access_group<id = distinct[1]<>>
module {
  llvm.func @inlinee(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.load %arg0 {access_groups = [#access_group]} : !llvm.ptr -> i32
    llvm.return %0 : i32
  }
  llvm.func @caller(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.call @inlinee(%arg0) {access_groups = [#access_group1]} : (!llvm.ptr) -> i32
    llvm.return %0 : i32
  }
}

// -----
#access_group = #llvm.access_group<id = distinct[0]<>>
module {
  llvm.func @inlinee(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.load %arg0 : !llvm.ptr -> i32
    llvm.return %0 : i32
  }
  llvm.func @caller(%arg0: !llvm.ptr) -> i32 {
    %0 = llvm.mlir.constant(5 : i32) : i32
    %1 = llvm.call @inlinee(%arg0) {access_groups = [#access_group]} : (!llvm.ptr) -> i32
    llvm.store %0, %arg0 {access_groups = [#access_group]} : i32, !llvm.ptr
    llvm.return %1 : i32
  }
}

// -----
module {
  llvm.func @vararg_func(...) {
    llvm.return
  }
  llvm.func @vararg_intrinrics() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<"struct.va_list_opaque", (ptr)> : (i32) -> !llvm.ptr
    llvm.intr.vastart %1 : !llvm.ptr
    llvm.return
  }
  llvm.func @caller() {
    llvm.call @vararg_func() vararg(!llvm.func<void (...)>) : () -> ()
    llvm.call @vararg_intrinrics() : () -> ()
    llvm.return
  }
}

// -----
module {
  llvm.func @private_func(%arg0: i32) -> i32 attributes {sym_visibility = "private"} {
    llvm.return %arg0 : i32
  }
  llvm.func @caller(%arg0: i32) -> i32 {
    %0 = llvm.call @private_func(%arg0) : (i32) -> i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @unreachable_func(%arg0: i32) -> i32 {
    llvm.intr.trap
    llvm.unreachable
  }
  llvm.func @caller(%arg0: i32) -> i32 {
    %0 = llvm.call @unreachable_func(%arg0) : (i32) -> i32
    llvm.return %0 : i32
  }
}

// -----
module {
  func.func @func(%arg0: i32) -> i32 {
    llvm.blocktag <id = 1>
    llvm.return %arg0 : i32
  }
  func.func @llvm_ret(%arg0: i32) -> i32 {
    %0 = call @func(%arg0) : (i32) -> i32
    return %0 : i32
  }
}

