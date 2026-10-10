#di_file = #llvm.di_file<"file.mlir" in "/">
#loc = loc("test.mlir":42:4)
#loc1 = loc("test.mlir":52:4)
#di_compile_unit = #llvm.di_compile_unit<id = distinct[0]<>, sourceLanguage = DW_LANG_C, file = #di_file, isOptimized = false, emissionKind = None>
#di_subprogram = #llvm.di_subprogram<compileUnit = #di_compile_unit, scope = #di_file, name = "callee", file = #di_file, subprogramFlags = Definition>
#loc2 = loc(fused<#di_subprogram>[#loc])
#loc3 = loc(fused<#di_subprogram>[#loc1])
#loop_annotation = #llvm.loop_annotation<startLoc = #loc2, endLoc = #loc3>
module {
  llvm.func @cond() -> i1
  llvm.func @callee() {
    llvm.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb1
    %0 = llvm.call @cond() : () -> i1
    llvm.cond_br %0, ^bb1, ^bb2 {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return
  }
  llvm.func @loop_annotation() {
    llvm.call @callee() : () -> ()
    llvm.return
  }
}

