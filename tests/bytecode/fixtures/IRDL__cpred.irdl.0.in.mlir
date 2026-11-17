"builtin.module"() ({
  "irdl.dialect"() <{sym_name = "dialect"}> ({
    "irdl.type"() <{sym_name = "type"}> ({
      %0 = "irdl.c_pred"() <{pred = "::llvm::isa<::mlir::IntegerAttr>($_self)"}> : () -> !irdl.attribute loc("<stdin>":4:12)
      "irdl.parameters"(%0) <{names = ["foo"]}> : (!irdl.attribute) -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
