#access_group = #llvm.access_group<id = distinct[0]<>>
#access_group1 = #llvm.access_group<id = distinct[1]<>>
#loop_annotation = #llvm.loop_annotation<disableNonforced = true>
#loop_interleave = #llvm.loop_interleave<count = 32 : i32>
#loop_licm = #llvm.loop_licm<disable = false, versioningDisable = true>
#loop_peeled = #llvm.loop_peeled<count = 8 : i32>
#loop_pipeline = #llvm.loop_pipeline<disable = true, initiationinterval = 1 : i32>
#loop_unswitch = #llvm.loop_unswitch<partialDisable = true>
#loop_distribute = #llvm.loop_distribute<disable = true, followupCoincident = #loop_annotation, followupSequential = #loop_annotation, followupFallback = #loop_annotation, followupAll = #loop_annotation>
#loop_unroll = #llvm.loop_unroll<disable = true, count = 32 : i32, runtimeDisable = true, full = false, followupUnrolled = #loop_annotation, followupRemainder = #loop_annotation, followupAll = #loop_annotation>
#loop_unroll_and_jam = #llvm.loop_unroll_and_jam<disable = false, count = 16 : i32, followupOuter = #loop_annotation, followupInner = #loop_annotation, followupRemainderOuter = #loop_annotation, followupRemainderInner = #loop_annotation, followupAll = #loop_annotation>
#loop_vectorize = #llvm.loop_vectorize<disable = false, predicateEnable = false, scalableEnable = true, width = 16 : i32, followupVectorized = #loop_annotation, followupEpilogue = #loop_annotation, followupAll = #loop_annotation>
#loop_annotation1 = #llvm.loop_annotation<disableNonforced = false, vectorize = #loop_vectorize, interleave = #loop_interleave, unroll = #loop_unroll, unrollAndJam = #loop_unroll_and_jam, licm = #loop_licm, distribute = #loop_distribute, pipeline = #loop_pipeline, peeled = #loop_peeled, unswitch = #loop_unswitch, mustProgress = true, isVectorized = false, parallelAccesses = #access_group, #access_group1>
module {
  llvm.func @loop_annotation() {
    llvm.br ^bb1 {llvm.loop = #loop_annotation1}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

// -----
#access_group = #llvm.access_group<id = distinct[0]<>>
#access_group1 = #llvm.access_group<id = distinct[1]<>>
#di_file = #llvm.di_file<"metadata-loop.ll" in "/">
#loc = loc("loop-metadata.mlir":42:4)
#loc1 = loc("loop-metadata.mlir":52:4)
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, isOptimized = false, emissionKind = None>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_file, name = "loop_locs", file = #di_file, subprogramFlags = Definition>
#loc2 = loc(fused<#di_subprogram>[#loc])
#loc3 = loc(fused<#di_subprogram>[#loc1])
#loop_annotation = #llvm.loop_annotation<disableNonforced = false, mustProgress = true, startLoc = #loc2, endLoc = #loc3, parallelAccesses = #access_group, #access_group1>
module {
  llvm.func @loop_annotation_with_locs() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

