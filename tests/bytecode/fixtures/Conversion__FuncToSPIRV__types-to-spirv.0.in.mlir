"builtin.module"() ({
  "func.func"() <{function_type = (i8, si8, ui8) -> (), sym_name = "integer8"}> ({
  ^bb0(%arg7: i8 loc("<stdin>":3:8), %arg8: si8 loc("<stdin>":3:19), %arg9: ui8 loc("<stdin>":3:31)):
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i16, si16, ui16) -> (), sym_name = "integer16"}> ({
  ^bb0(%arg4: i16 loc("<stdin>":7:8), %arg5: si16 loc("<stdin>":7:20), %arg6: ui16 loc("<stdin>":7:33)):
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (i64, si64, ui64) -> (), sym_name = "integer64"}> ({
  ^bb0(%arg1: i64 loc("<stdin>":11:8), %arg2: si64 loc("<stdin>":11:20), %arg3: ui64 loc("<stdin>":11:33)):
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (i128) -> (), sym_name = "integer128"}> ({
  ^bb0(%arg0: i128 loc("<stdin>":15:8)):
    "func.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":14:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [], []>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
