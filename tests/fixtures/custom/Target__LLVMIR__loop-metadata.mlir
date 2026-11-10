#loop_annotation = #llvm.loop_annotation<disableNonforced = true>
module {
  llvm.func @disableNonForced() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#loop_annotation = #llvm.loop_annotation<mustProgress = true>
module {
  llvm.func @mustprogress() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#loop_annotation = #llvm.loop_annotation<isVectorized = true>
module {
  llvm.func @isvectorized() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#loop_annotation = #llvm.loop_annotation<disableNonforced = true>
#loop_vectorize = #llvm.loop_vectorize<disable = false, predicateEnable = true, scalableEnable = false, width = 16 : i32, followupVectorized = #loop_annotation, followupEpilogue = #loop_annotation, followupAll = #loop_annotation>
#loop_annotation1 = #llvm.loop_annotation<vectorize = #loop_vectorize>
module {
  llvm.func @vectorizeOptions() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation1}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#loop_interleave = #llvm.loop_interleave<count = 32 : i32>
#loop_annotation = #llvm.loop_annotation<interleave = #loop_interleave>
module {
  llvm.func @interleaveOptions() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#loop_annotation = #llvm.loop_annotation<disableNonforced = true>
#loop_unroll = #llvm.loop_unroll<disable = true, count = 64 : i32, runtimeDisable = false, full = false, followupUnrolled = #loop_annotation, followupRemainder = #loop_annotation, followupAll = #loop_annotation>
#loop_annotation1 = #llvm.loop_annotation<unroll = #loop_unroll>
module {
  llvm.func @unrollOptions() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation1}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#loop_unroll = #llvm.loop_unroll<disable = false, full = true>
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll>
module {
  llvm.func @unrollOptions2() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#loop_annotation = #llvm.loop_annotation<disableNonforced = true>
#loop_unroll_and_jam = #llvm.loop_unroll_and_jam<disable = false, count = 8 : i32, followupOuter = #loop_annotation, followupInner = #loop_annotation, followupRemainderOuter = #loop_annotation, followupRemainderInner = #loop_annotation, followupAll = #loop_annotation>
#loop_annotation1 = #llvm.loop_annotation<unrollAndJam = #loop_unroll_and_jam>
module {
  llvm.func @unrollAndJamOptions() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation1}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#loop_licm = #llvm.loop_licm<disable = false, versioningDisable = true>
#loop_annotation = #llvm.loop_annotation<licm = #loop_licm>
module {
  llvm.func @licmOptions() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#loop_licm = #llvm.loop_licm<disable = true, versioningDisable = false>
#loop_annotation = #llvm.loop_annotation<licm = #loop_licm>
module {
  llvm.func @licmOptions2() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#loop_annotation = #llvm.loop_annotation<disableNonforced = true>
#loop_distribute = #llvm.loop_distribute<disable = true, followupCoincident = #loop_annotation, followupSequential = #loop_annotation, followupFallback = #loop_annotation, followupAll = #loop_annotation>
#loop_annotation1 = #llvm.loop_annotation<distribute = #loop_distribute>
module {
  llvm.func @distributeOptions() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation1}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#loop_pipeline = #llvm.loop_pipeline<disable = false, initiationinterval = 1 : i32>
#loop_annotation = #llvm.loop_annotation<pipeline = #loop_pipeline>
module {
  llvm.func @pipelineOptions() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#loop_peeled = #llvm.loop_peeled<count = 3 : i32>
#loop_annotation = #llvm.loop_annotation<peeled = #loop_peeled>
module {
  llvm.func @peeledOptions() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#loop_unswitch = #llvm.loop_unswitch<partialDisable = true>
#loop_annotation = #llvm.loop_annotation<unswitch = #loop_unswitch>
module {
  llvm.func @unswitchOptions() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#access_group = #llvm.access_group<id = distinct[0]<>>
#access_group1 = #llvm.access_group<id = distinct[1]<>>
#loop_interleave = #llvm.loop_interleave<count = 1 : i64>
#loop_licm = #llvm.loop_licm<disable = true>
#loop_pipeline = #llvm.loop_pipeline<disable = true, initiationinterval = 2 : i64>
#loop_unroll = #llvm.loop_unroll<disable = true>
#loop_annotation = #llvm.loop_annotation<interleave = #loop_interleave, unroll = #loop_unroll, licm = #loop_licm, pipeline = #loop_pipeline, parallelAccesses = #access_group, #access_group1>
module {
  llvm.func @foo(i32)
  llvm.func @loopOptions(%arg0: i32, %arg1: i32) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.alloca %arg0 x i32 : (i32) -> !llvm.ptr
    llvm.br ^bb1(%0 : i32)
  ^bb1(%2: i32):  // 2 preds: ^bb0, ^bb2
    %3 = llvm.icmp "slt" %2, %arg0 : i32
    llvm.cond_br %3, ^bb2, ^bb3 {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %4 = llvm.add %2, %arg1 : i32
    %5 = llvm.load %1 {access_groups = [#access_group, #access_group1]} : !llvm.ptr -> i32
    llvm.store %5, %1 {access_groups = [#access_group, #access_group1]} : i32, !llvm.ptr
    %6 = llvm.atomicrmw add %1, %5 monotonic {access_groups = [#access_group, #access_group1]} : !llvm.ptr, i32
    %7 = llvm.cmpxchg %1, %5, %6 acq_rel monotonic {access_groups = [#access_group, #access_group1]} : !llvm.ptr, i32
    %8 = llvm.mlir.constant(42 : i8) : i8
    "llvm.intr.memcpy"(%1, %1, %0) <{access_groups = [#access_group, #access_group1], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memset"(%1, %8, %0) <{access_groups = [#access_group, #access_group1], isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    llvm.call @foo(%arg0) {access_groups = [#access_group, #access_group1]} : (i32) -> ()
    llvm.br ^bb1(%4 : i32) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb1
    llvm.return
  }
}

// -----
#di_file = #llvm.di_file<"metadata-loop.ll" in "/">
#di_null_type = #llvm.di_null_type
#loc = loc("loop-metadata.mlir":42:4)
#loc1 = loc("loop-metadata.mlir":52:4)
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file>
#di_subroutine_type = #llvm.di_subroutine_type<types = #di_null_type>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_file, name = "loop_locs", file = #di_file, subprogramFlags = Definition, type = #di_subroutine_type>
#loc2 = loc(fused<#di_subprogram>[#loc])
#loc3 = loc(fused<#di_subprogram>[#loc1])
#loop_annotation = #llvm.loop_annotation<disableNonforced = false, startLoc = #loc2, endLoc = #loc3>
module {
  llvm.func @loop_annotation_with_locs() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

