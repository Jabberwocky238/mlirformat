"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    %0 = "test.foo"() : () -> i32
    "cf.br"()[^bb1] : () -> ()
  ^bb1:  // 2 preds: ^bb0, ^bb2
    "cf.br"()[^bb2] : () -> ()
  ^bb2:  // pred: ^bb1
    "test.use"(%0) : (i32) -> ()
    "cf.br"()[^bb1] : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "bar", sym_visibility = "private"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

