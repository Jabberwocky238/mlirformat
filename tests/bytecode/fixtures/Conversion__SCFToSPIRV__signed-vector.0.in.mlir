"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "spirv.Constant"() <{value = -5 : si32}> : () -> si32 loc("<stdin>":3:10)
    %1 = "vector.from_elements"(%0) : (si32) -> vector<1xsi32> loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
