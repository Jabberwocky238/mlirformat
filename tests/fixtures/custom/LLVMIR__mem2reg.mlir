module {
  llvm.func @default_value() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %2 : i32
  }
}

// -----
module {
  llvm.func @store_of_ptr() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(4 : i32) : i32
    %2 = llvm.mlir.zero : !llvm.ptr
    %3 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.store %1, %3 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.store %3, %2 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @unreachable() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(0 : i32) : i32
    %2 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.return
  ^bb1:  // no predecessors
    llvm.store %1, %2 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @unreachable_in_loop() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(6 : i32) : i32
    %2 = llvm.mlir.constant(5 : i32) : i32
    %3 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.store %1, %3 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb3
    llvm.store %2, %3 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.br ^bb3
  ^bb2:  // no predecessors
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    llvm.br ^bb1
  }
}

// -----
module {
  llvm.func @branching(%arg0: i1, %arg1: i1) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(2 : i32) : i32
    %2 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.cond_br %arg0, ^bb2, ^bb1
  ^bb1:  // pred: ^bb0
    llvm.store %1, %2 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.cond_br %arg1, ^bb2, ^bb2
  ^bb2:  // 3 preds: ^bb0, ^bb1, ^bb1
    %3 = llvm.load %2 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %3 : i32
  }
}

// -----
module {
  llvm.func @recursive_alloca() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(0 : i32) : i32
    %2 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %3 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %4 = llvm.alloca %0 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr
    llvm.store %1, %3 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.store %3, %4 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %5 = llvm.load %4 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
    %6 = llvm.load %5 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.store %6, %2 {alignment = 4 : i64} : i32, !llvm.ptr
    %7 = llvm.load %2 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %7 : i32
  }
}

// -----
module {
  llvm.func @reset_in_branch(%arg0: i32, %arg1: i1) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(true) : i1
    %2 = llvm.mlir.constant(false) : i1
    %3 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.store %arg0, %3 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.cond_br %arg1, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.store %arg0, %3 {alignment = 4 : i64} : i32, !llvm.ptr
    %4 = llvm.load %3 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.call @reset_in_branch(%4, %2) : (i32, i1) -> ()
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    %5 = llvm.load %3 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.call @reset_in_branch(%5, %1) : (i32, i1) -> ()
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    llvm.return
  }
}

// -----
module {
  llvm.func @intertwined_alloca(%arg0: !llvm.ptr, %arg1: i32) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(0 : i32) : i32
    %2 = llvm.alloca %0 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %3 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %4 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %5 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %6 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.store %arg0, %2 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    llvm.store %arg1, %3 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.store %1, %4 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb4
    %7 = llvm.load %3 {alignment = 4 : i64} : !llvm.ptr -> i32
    %8 = llvm.add %7, %0 : i32
    %9 = llvm.load %4 {alignment = 4 : i64} : !llvm.ptr -> i32
    %10 = llvm.icmp "sgt" %8, %9 : i32
    %11 = llvm.zext %10 : i1 to i32
    llvm.cond_br %10, ^bb2, ^bb5
  ^bb2:  // pred: ^bb1
    %12 = llvm.load %6 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.store %12, %5 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.store %1, %6 {alignment = 4 : i64} : i32, !llvm.ptr
    %13 = llvm.load %4 {alignment = 4 : i64} : !llvm.ptr -> i32
    %14 = llvm.icmp "sgt" %13, %1 : i32
    %15 = llvm.zext %14 : i1 to i32
    llvm.cond_br %14, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %16 = llvm.load %2 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
    %17 = llvm.load %4 {alignment = 4 : i64} : !llvm.ptr -> i32
    %18 = llvm.sub %17, %0 : i32
    %19 = llvm.getelementptr %16[%18] : (!llvm.ptr, i32) -> !llvm.ptr, i8
    %20 = llvm.load %5 {alignment = 4 : i64} : !llvm.ptr -> i32
    %21 = llvm.trunc %20 : i32 to i8
    llvm.store %21, %19 {alignment = 1 : i64} : i8, !llvm.ptr
    llvm.br ^bb4
  ^bb4:  // 2 preds: ^bb2, ^bb3
    %22 = llvm.load %4 {alignment = 4 : i64} : !llvm.ptr -> i32
    %23 = llvm.add %22, %0 : i32
    llvm.store %23, %4 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.br ^bb1
  ^bb5:  // pred: ^bb1
    llvm.return
  }
}

// -----
module {
  llvm.func @complex_cf(%arg0: i32, ...) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(false) : i1
    %2 = llvm.mlir.constant(0 : i32) : i32
    %3 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.cond_br %1, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    llvm.store %2, %3 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb2, ^bb16
    llvm.cond_br %1, ^bb4, ^bb17
  ^bb4:  // pred: ^bb3
    llvm.cond_br %1, ^bb5, ^bb14
  ^bb5:  // pred: ^bb4
    llvm.cond_br %1, ^bb7, ^bb6
  ^bb6:  // pred: ^bb5
    llvm.br ^bb7
  ^bb7:  // 2 preds: ^bb5, ^bb6
    llvm.cond_br %1, ^bb9, ^bb8
  ^bb8:  // pred: ^bb7
    llvm.br ^bb9
  ^bb9:  // 2 preds: ^bb7, ^bb8
    llvm.cond_br %1, ^bb11, ^bb10
  ^bb10:  // pred: ^bb9
    llvm.br ^bb11
  ^bb11:  // 2 preds: ^bb9, ^bb10
    llvm.cond_br %1, ^bb12, ^bb13
  ^bb12:  // pred: ^bb11
    llvm.br ^bb13
  ^bb13:  // 2 preds: ^bb11, ^bb12
    llvm.br ^bb14
  ^bb14:  // 2 preds: ^bb4, ^bb13
    llvm.cond_br %1, ^bb15, ^bb16
  ^bb15:  // pred: ^bb14
    llvm.br ^bb16
  ^bb16:  // 2 preds: ^bb14, ^bb15
    llvm.br ^bb3
  ^bb17:  // pred: ^bb3
    llvm.br ^bb20
  ^bb18:  // no predecessors
    %4 = llvm.load %3 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.br ^bb24
  ^bb19:  // no predecessors
    llvm.br ^bb20
  ^bb20:  // 2 preds: ^bb17, ^bb19
    llvm.cond_br %1, ^bb21, ^bb22
  ^bb21:  // pred: ^bb20
    llvm.br ^bb23
  ^bb22:  // pred: ^bb20
    llvm.br ^bb23
  ^bb23:  // 2 preds: ^bb21, ^bb22
    llvm.br ^bb24
  ^bb24:  // 2 preds: ^bb18, ^bb23
    llvm.br ^bb26
  ^bb25:  // no predecessors
    llvm.br ^bb26
  ^bb26:  // 2 preds: ^bb24, ^bb25
    llvm.return
  }
}

// -----
module {
  llvm.func @llvm_crash() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(0 : i32) : i32
    %2 = llvm.mlir.addressof @j : !llvm.ptr
    %3 = llvm.mlir.constant(0 : i8) : i8
    %4 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %5 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %6 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %7 = llvm.bitcast %1 : i32 to i32
    llvm.store volatile %1, %5 {alignment = 4 : i64} : i32, !llvm.ptr
    %8 = llvm.call @_setjmp(%2) : (!llvm.ptr) -> i32
    %9 = llvm.icmp "ne" %8, %1 : i32
    %10 = llvm.zext %9 : i1 to i8
    %11 = llvm.icmp "ne" %10, %3 : i8
    llvm.cond_br %11, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %12 = llvm.load volatile %5 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.store %12, %6 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    llvm.store volatile %0, %5 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.call @g() : () -> ()
    llvm.store %1, %6 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    %13 = llvm.load %6 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.store %13, %4 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.br ^bb4
  ^bb4:  // pred: ^bb3
    %14 = llvm.load %4 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %14 : i32
  }
  llvm.mlir.global external @j() {addr_space = 0 : i32} : !llvm.array<1 x struct<"struct.__jmp_buf_tag", (array<6 x i32>, i32, struct<"struct.__sigset_t", (array<32 x i32>)>)>>
  llvm.func @_setjmp(!llvm.ptr) -> i32 attributes {passthrough = ["returns_twice"]}
  llvm.func @g()
}

// -----
module {
  llvm.func amdgpu_kernelcc @addrspace_discard() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i8 {alignment = 8 : i64} : (i32) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    llvm.intr.lifetime.start %2 : !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @ignore_atomic(%arg0: i32) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.store %arg0, %1 atomic seq_cst {alignment = 4 : i64} : i32, !llvm.ptr
    %2 = llvm.load %1 atomic seq_cst {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %2 : i32
  }
}

// -----
module {
  llvm.func @landing_pad() -> i32 attributes {personality = @__gxx_personality_v0} {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.invoke @landing_padf() to ^bb1 unwind ^bb3 : () -> i32
  ^bb1:  // pred: ^bb0
    llvm.store %2, %1 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.br ^bb2
  ^bb2:  // 2 preds: ^bb1, ^bb3
    %3 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %3 : i32
  ^bb3:  // pred: ^bb0
    %4 = llvm.landingpad cleanup : !llvm.struct<(ptr, i32)>
    llvm.br ^bb2
  }
  llvm.func @landing_padf() -> i32
  llvm.func @__gxx_personality_v0(...) -> i32
}

// -----
module {
  llvm.func @unreachable_defines() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb2
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %2 : i32
  ^bb2:  // no predecessors
    %3 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.store %3, %1 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.br ^bb1
  }
}

// -----
module {
  llvm.func @unreachable_jumps_to_merge_point(%arg0: i1) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(6 : i32) : i32
    %2 = llvm.mlir.constant(5 : i32) : i32
    %3 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.store %1, %3 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.br ^bb4
  ^bb2:  // pred: ^bb0
    llvm.store %2, %3 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.br ^bb4
  ^bb3:  // no predecessors
    llvm.br ^bb4
  ^bb4:  // 3 preds: ^bb1, ^bb2, ^bb3
    %4 = llvm.load %3 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %4 : i32
  }
}

// -----
module {
  llvm.func @ignore_lifetime() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.intr.lifetime.start %1 : !llvm.ptr
    llvm.store %0, %1 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.intr.lifetime.end %1 : !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @ignore_invariant_group() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.intr.launder.invariant.group %1 : !llvm.ptr
    %3 = llvm.intr.strip.invariant.group %2 : !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @ignore_discardable_tree() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(0 : i16) : i16
    %2 = llvm.mlir.constant(0 : i8) : i8
    %3 = llvm.mlir.undef : !llvm.struct<(i8, i16)>
    %4 = llvm.insertvalue %2, %3[0] : !llvm.struct<(i8, i16)> 
    %5 = llvm.insertvalue %1, %4[1] : !llvm.struct<(i8, i16)> 
    %6 = llvm.alloca %0 x !llvm.struct<(i8, i16)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %7 = llvm.getelementptr %6[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(i8, i16)>
    llvm.intr.lifetime.start %7 : !llvm.ptr
    llvm.store %5, %6 {alignment = 2 : i64} : !llvm.struct<(i8, i16)>, !llvm.ptr
    llvm.intr.lifetime.end %7 : !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @store_load_forward() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(0 : i32) : i32
    %2 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.store %1, %2 {alignment = 4 : i64} : i32, !llvm.ptr
    %3 = llvm.load %2 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %3 : i32
  }
}

// -----
module {
  llvm.func @merge_point_cycle() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(7 : i32) : i32
    %2 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb1
    %3 = llvm.load %2 {alignment = 4 : i64} : !llvm.ptr -> i32
    %4 = llvm.call @use(%3) : (i32) -> i1
    %5 = llvm.call @def(%1) : (i32) -> i32
    llvm.store %5, %2 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.cond_br %4, ^bb1, ^bb2
  ^bb2:  // pred: ^bb1
    llvm.return
  }
  llvm.func @def(i32) -> i32
  llvm.func @use(i32) -> i1
}

// -----
module {
  llvm.func @no_unnecessary_arguments() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb1
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    %3 = llvm.call @use(%2) : (i32) -> i1
    llvm.cond_br %3, ^bb1, ^bb2
  ^bb2:  // pred: ^bb1
    llvm.return
  }
  llvm.func @use(i32) -> i1
}

// -----
module {
  llvm.func @discardable_use_tree() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(2 : i64) : i64
    %2 = llvm.alloca %0 x i8 {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %3 = llvm.bitcast %2 : !llvm.ptr to !llvm.ptr
    %4 = llvm.bitcast %3 : !llvm.ptr to !llvm.ptr
    llvm.intr.lifetime.start %3 : !llvm.ptr
    llvm.intr.lifetime.start %4 : !llvm.ptr
    %5 = llvm.intr.invariant.start 2, %3 : !llvm.ptr
    llvm.intr.invariant.end %5, 2, %3 : !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @non_discardable_use_tree() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(2 : i64) : i64
    %2 = llvm.alloca %0 x i8 {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %3 = llvm.bitcast %2 : !llvm.ptr to !llvm.ptr
    %4 = llvm.bitcast %3 : !llvm.ptr to !llvm.ptr
    llvm.intr.lifetime.start %3 : !llvm.ptr
    llvm.intr.lifetime.start %4 : !llvm.ptr
    %5 = llvm.call @use(%4) : (!llvm.ptr) -> i1
    llvm.return
  }
  llvm.func @use(!llvm.ptr) -> i1
}

// -----
module {
  llvm.func @trivial_get_element_ptr() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(2 : i64) : i64
    %2 = llvm.alloca %0 x i8 {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %3 = llvm.bitcast %2 : !llvm.ptr to !llvm.ptr
    %4 = llvm.getelementptr %3[0] : (!llvm.ptr) -> !llvm.ptr, i8
    llvm.intr.lifetime.start %3 : !llvm.ptr
    llvm.intr.lifetime.start %4 : !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @nontrivial_get_element_ptr() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(2 : i64) : i64
    %2 = llvm.alloca %0 x i8 {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %3 = llvm.getelementptr %2[1] : (!llvm.ptr) -> !llvm.ptr, i8
    llvm.intr.lifetime.start %2 : !llvm.ptr
    llvm.intr.lifetime.start %3 : !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @dynamic_get_element_ptr() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(2 : i64) : i64
    %2 = llvm.alloca %0 x i8 {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %3 = llvm.bitcast %2 : !llvm.ptr to !llvm.ptr
    %4 = llvm.getelementptr %3[%0] : (!llvm.ptr, i32) -> !llvm.ptr, i8
    llvm.intr.lifetime.start %3 : !llvm.ptr
    llvm.intr.lifetime.start %4 : !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @live_cycle(%arg0: i64, %arg1: i1, %arg2: i64) -> i64 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i64 {alignment = 8 : i64} : (i32) -> !llvm.ptr
    llvm.store %arg2, %1 {alignment = 4 : i64} : i64, !llvm.ptr
    llvm.cond_br %arg1, ^bb1, ^bb2
  ^bb1:  // 2 preds: ^bb0, ^bb2
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i64
    llvm.call @use(%2) : (i64) -> ()
    llvm.store %arg0, %1 {alignment = 4 : i64} : i64, !llvm.ptr
    llvm.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    llvm.br ^bb1
  }
  llvm.func @use(i64)
}

// -----
module {
  llvm.func @subregion_block_promotion(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i64 {alignment = 8 : i64} : (i32) -> !llvm.ptr
    llvm.store %arg1, %1 {alignment = 4 : i64} : i64, !llvm.ptr
    scf.execute_region {
      llvm.store %arg0, %1 {alignment = 4 : i64} : i64, !llvm.ptr
      scf.yield
    }
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i64
    llvm.return %2 : i64
  }
}

// -----
module {
  llvm.func @subregion_simple_transitive_promotion(%arg0: i64, %arg1: i64) -> i64 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i64 {alignment = 8 : i64} : (i32) -> !llvm.ptr
    llvm.store %arg1, %1 {alignment = 4 : i64} : i64, !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i64
    scf.execute_region {
      llvm.call @use(%2) : (i64) -> ()
      scf.yield
    }
    llvm.return %2 : i64
  }
  llvm.func @use(i64)
}

// -----
module {
  llvm.func @no_inner_alloca_promotion(%arg0: i64) -> i64 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    %1 = llvm.alloca %0 x i64 {alignment = 8 : i64} : (i32) -> !llvm.ptr
    llvm.store %arg0, %1 {alignment = 4 : i64} : i64, !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i64
    llvm.return %2 : i64
  }
}

// -----
module {
  llvm.func @transitive_reaching_def() -> !llvm.ptr {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.ptr {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
    llvm.store %2, %1 {alignment = 8 : i64} : !llvm.ptr, !llvm.ptr
    %3 = llvm.load %1 {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
    llvm.return %3 : !llvm.ptr
  }
}

// -----
module {
  llvm.func @load_int_from_float() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x f32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %2 : i32
  }
}

// -----
module {
  llvm.func @load_float_from_int() -> f32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> f32
    llvm.return %2 : f32
  }
}

// -----
module {
  llvm.func @load_int_from_vector() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x vector<2xi16> : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %2 : i32
  }
}

// -----
module {
  llvm.func @load_int_from_array() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.array<2 x i16> : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %2 : i32
  }
}

// -----
module {
  llvm.func @store_int_to_float(%arg0: i32) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x f32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.store %arg0, %1 {alignment = 4 : i64} : i32, !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %2 : i32
  }
}

// -----
module {
  llvm.func @store_float_to_int(%arg0: f32) -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.store %arg0, %1 {alignment = 4 : i64} : f32, !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i32
    llvm.return %2 : i32
  }
}

// -----
module {
  llvm.func @store_int_to_vector(%arg0: i32) -> vector<4xi8> {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x vector<2xi16> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.store %arg0, %1 {alignment = 4 : i64} : i32, !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> vector<4xi8>
    llvm.return %2 : vector<4xi8>
  }
}

// -----
module {
  llvm.func @load_ptr_from_int() -> !llvm.ptr {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i64 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> !llvm.ptr
    llvm.return %2 : !llvm.ptr
  }
}

// -----
module {
  llvm.func @load_int_from_ptr() -> i64 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.ptr {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i64
    llvm.return %2 : i64
  }
}

// -----
module {
  llvm.func @load_ptr_addrspace_cast() -> !llvm.ptr<2> {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.ptr<1> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> !llvm.ptr<2>
    llvm.return %2 : !llvm.ptr<2>
  }
}

// -----
module {
  llvm.func @stores_with_different_types(%arg0: i64, %arg1: f64, %arg2: i1) -> f64 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i64 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.cond_br %arg2, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.store %arg0, %1 {alignment = 4 : i64} : i64, !llvm.ptr
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    llvm.store %arg1, %1 {alignment = 4 : i64} : f64, !llvm.ptr
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> f64
    llvm.return %2 : f64
  }
}

// -----
module {
  llvm.func @load_smaller_int() -> i16 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> i16
    llvm.return %2 : i16
  }
}

// -----
module {
  llvm.func @load_different_type_same_size() -> f32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i64 {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> f32
    llvm.return %2 : f32
  }
}

// -----
module {
  llvm.func @impossible_load() -> f64 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> f64
    llvm.return %2 : f64
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<1> = dense<[32, 64, 64]> : vector<3xi64>, !llvm.ptr<2> = dense<64> : vector<3xi64>>} {
  llvm.func @load_ptr_addrspace_cast_different_size() -> !llvm.ptr<2> {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.ptr<1> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> !llvm.ptr<2>
    llvm.return %2 : !llvm.ptr<2>
  }
  llvm.func @load_ptr_addrspace_cast_different_size2() -> !llvm.ptr<1> {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.ptr<2> {alignment = 4 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> !llvm.ptr<1>
    llvm.return %2 : !llvm.ptr<1>
  }
}

// -----
module {
  llvm.func @load_smaller_int_type() -> i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i64 : (i32) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> i32
    llvm.return %2 : i32
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.endianness" = "big">} {
  llvm.func @load_smaller_int_type_big_endian() -> i8 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i64 : (i32) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> i8
    llvm.return %2 : i8
  }
}

// -----
module {
  llvm.func @load_different_type_smaller() -> f32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i64 : (i32) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> f32
    llvm.return %2 : f32
  }
}

// -----
module {
  llvm.func @load_smaller_float_type() -> f32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x f64 : (i32) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> f32
    llvm.return %2 : f32
  }
}

// -----
module {
  llvm.func @load_first_vector_elem() -> i16 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x vector<4xi16> : (i32) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> i16
    llvm.return %2 : i16
  }
}

// -----
module {
  llvm.func @load_first_llvm_vector_elem() -> i16 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x vector<4x!llvm.ptr> : (i32) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> i16
    llvm.return %2 : i16
  }
}

// -----
module {
  llvm.func @scalable_vector() -> i16 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x vector<[4]xi16> : (i32) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> i16
    llvm.return %2 : i16
  }
}

// -----
module {
  llvm.func @scalable_llvm_vector() -> i16 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x vector<[4]x!llvm.ppc_fp128> : (i32) -> !llvm.ptr
    %2 = llvm.load %1 : !llvm.ptr -> i16
    llvm.return %2 : i16
  }
}

// -----
module {
  llvm.func @smaller_store_forwarding(%arg0: i16) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    llvm.store %arg0, %1 : i16, !llvm.ptr
    llvm.return
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.endianness" = "big">} {
  llvm.func @smaller_store_forwarding_big_endian(%arg0: i16) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    llvm.store %arg0, %1 : i16, !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @smaller_store_forwarding_type_mix(%arg0: vector<1xi8>) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x f32 : (i32) -> !llvm.ptr
    llvm.store %arg0, %1 : vector<1xi8>, !llvm.ptr
    llvm.return
  }
}

// -----
module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.endianness" = "big">} {
  llvm.func @smaller_store_forwarding_type_mix(%arg0: vector<1xi8>) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x f32 : (i32) -> !llvm.ptr
    llvm.store %arg0, %1 : vector<1xi8>, !llvm.ptr
    llvm.return
  }
}

// -----
module {
  llvm.func @stores_with_different_types_branches(%arg0: i64, %arg1: f32, %arg2: i1) -> f64 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i64 {alignment = 4 : i64} : (i32) -> !llvm.ptr
    llvm.cond_br %arg2, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.store %arg0, %1 {alignment = 4 : i64} : i64, !llvm.ptr
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    llvm.store %arg1, %1 {alignment = 4 : i64} : f32, !llvm.ptr
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    %2 = llvm.load %1 {alignment = 4 : i64} : !llvm.ptr -> f64
    llvm.return %2 : f64
  }
}

// -----
module {
  llvm.func @store_out_of_bounds(%arg0: i64) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    llvm.store %arg0, %1 : i64, !llvm.ptr
    llvm.return
  }
}

