"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "undef"}> ({
    %0 = "spirv.Undef"() : () -> f32 loc("<stdin>":3:10)
    %1 = "spirv.Undef"() : () -> vector<4xf32> loc("<stdin>":4:10)
    "spirv.Return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
