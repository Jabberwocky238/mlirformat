"builtin.module"() ({
  "acc.routine"() <{func_name = @host_foo, seq = [#acc.device_type<none>], sym_name = "routine_seq"}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<8xi32>) -> (), sym_name = "host_foo"}> ({
  ^bb0(%arg0: memref<8xi32> loc("<stdin>":4:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":6:10)
    "memref.store"(%1, %arg0, %0) : (i32, memref<8xi32>, index) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) {acc.specialized_routine = #acc.specialized_routine<@routine_seq, <seq>, "host_foo">} : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":1:1)
