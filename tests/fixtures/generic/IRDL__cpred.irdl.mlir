"builtin.module"() ({
  "irdl.dialect"() <{sym_name = "dialect"}> ({
    "irdl.type"() <{sym_name = "type"}> ({
      %0 = "irdl.c_pred"() <{pred = "::llvm::isa<::mlir::IntegerAttr>($_self)"}> : () -> !irdl.attribute
      "irdl.parameters"(%0) <{names = ["foo"]}> : (!irdl.attribute) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

