"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "bar"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

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
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

