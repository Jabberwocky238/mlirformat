"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededTypeVerifier"}> ({
    %0 = "testd.any"() : () -> !testd.singleton
    %1 = "testd.any"() : () -> !testd.parametrized<f32, i32>
    %2 = "testd.any"() : () -> !testd.parametrized<i1, i64>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

