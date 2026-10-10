#access_group = #llvm.access_group<id = distinct[0]<>>
#access_group1 = #llvm.access_group<id = distinct[1]<>>
#di_subprogram = #llvm.di_subprogram<recId = distinct[2]<>>
#loc = loc("test.f90":12:14)
#loc1 = loc("test":4:3)
#loc2 = loc(fused<#di_subprogram>[#loc])
#loc3 = loc(fused<#di_subprogram>[#loc1])
#loop_annotation = #llvm.loop_annotation<disableNonforced = false, mustProgress = true, startLoc = #loc2, endLoc = #loc3, parallelAccesses = #access_group, #access_group1>
module {
  llvm.func @imp_fn() {
    llvm.return
  }
  llvm.func @loop_annotation_with_locs() {
    llvm.br ^bb1 {loop_annotation = #loop_annotation}
  ^bb1:  // pred: ^bb0
    llvm.return
  }
}

