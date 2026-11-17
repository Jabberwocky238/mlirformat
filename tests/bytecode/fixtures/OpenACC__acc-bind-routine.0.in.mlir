"builtin.module"() ({
  "acc.routine"() <{bindIdName = [@bar], bindIdNameDeviceType = [#acc.device_type<none>], bindStrName = [], bindStrNameDeviceType = [], func_name = @foo, seq = [#acc.device_type<none>], sym_name = "r_bind"}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) {acc.routine_info = #acc.routine_info<[@r_bind]>} : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> (), sym_name = "bar"}> ({
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "acc.serial"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "func.call"() <{callee = @foo}> : () -> () loc("<stdin>":11:7)
      "acc.yield"() : () -> () loc("<stdin>":12:7)
    }) : () -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
