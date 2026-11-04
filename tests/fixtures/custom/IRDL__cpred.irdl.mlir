module {
  irdl.dialect @dialect {
    irdl.type @type {
      %0 = irdl.c_pred "::llvm::isa<::mlir::IntegerAttr>($_self)" 
      irdl.parameters(foo: %0)
    }
  }
}

