module {
  llvm.func @target_features() attributes {target_features = #llvm.target_features<["+sme", "+sve", "+sme-f64f64"]>} {
    llvm.return
  }
}

