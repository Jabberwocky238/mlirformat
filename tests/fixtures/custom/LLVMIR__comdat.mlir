module {
  llvm.comdat @__llvm_comdat {
    llvm.comdat_selector @any_comdat any
    llvm.comdat_selector @exactmatch_comdat exactmatch
    llvm.comdat_selector @largest_comdat largest
    llvm.comdat_selector @nodeduplicate_comdat nodeduplicate
    llvm.comdat_selector @samesize_comdat samesize
  }
}

