module {
  func.func @foo() {
    %c0_i32 = arith.constant 0 : i32
    return
  }
  func.func @bar() {
    return
  }
}

{-#
  external_resources: {
    mlir_reproducer: {
      verify_each: true,
      pipeline: "builtin.module(func.func(cse,canonicalize{max-iterations=1 max-num-rewrites=-1 region-simplify=normal top-down=false}))",
      disable_threading: true
    }
  }
#-}

// -----
module {
}

// -----
module {
}

// -----
module {
}

// -----
module {
}

