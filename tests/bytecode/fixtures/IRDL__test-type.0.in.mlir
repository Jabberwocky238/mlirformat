"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "succeededTypeVerifier"}> ({
    %0 = "testd.any"() : () -> !testd.singleton loc("<stdin>":3:10)
    %1 = "testd.any"() : () -> !testd.parametrized<f32, i32> loc("<stdin>":4:10)
    %2 = "testd.any"() : () -> !testd.parametrized<i1, i64> loc("<stdin>":5:10)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
