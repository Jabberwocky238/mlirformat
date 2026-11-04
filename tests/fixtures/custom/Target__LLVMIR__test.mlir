module {
  "test.symbol"() <{sym_name = "foo"}> : () -> ()
}

// -----
module attributes {test.discardable_mod_attr = true} {
}

// -----
module {
  llvm.func @dialect_attr_translation() {
    llvm.return {test.add_annotation}
  }
}

// -----
module {
  llvm.func @dialect_attr_translation_multi(%arg0: i64, %arg1: i64, %arg2: i64) -> i64 {
    %0 = llvm.add %arg0, %arg1 {test.add_annotation = "add"} : i64
    %1 = llvm.mul %0, %arg2 {test.add_annotation = "mul"} : i64
    llvm.return {test.add_annotation = "ret"} %1 : i64
  }
}

