module {
  llvm.func @uwtable_func() attributes {uwtable_kind = #llvm.uwtableKind<sync>} {
    llvm.return
  }
}

