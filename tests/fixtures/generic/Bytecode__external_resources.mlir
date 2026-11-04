"builtin.module"() ({
^bb0:
}) : () -> ()

{-#
  external_resources: {
    mlir_reproducer: {
      pipeline: "builtin.module(func.func(canonicalize,cse))",
      disable_threading: true,
      verify_each: true
    }
  }
#-}

