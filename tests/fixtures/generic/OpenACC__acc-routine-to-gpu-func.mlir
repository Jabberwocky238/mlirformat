"builtin.module"() ({
  "acc.routine"() <{func_name = @host_foo, seq = [#acc.device_type<none>], sym_name = "routine_seq"}> : () -> ()
  "func.func"() <{function_type = (memref<8xi32>) -> (), sym_name = "host_foo"}> ({
  ^bb0(%arg0: memref<8xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%1, %arg0, %0) : (i32, memref<8xi32>, index) -> ()
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@routine_seq, <seq>, "host_foo">} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{func_name = @host_foo, seq = [#acc.device_type<none>], sym_name = "routine_seq"}> : () -> ()
  "acc.routine"() <{bindIdName = [], bindIdNameDeviceType = [], bindStrName = ["myname"], bindStrNameDeviceType = [#acc.device_type<none>], func_name = @host_bind, seq = [#acc.device_type<none>], sym_name = "routine_bind"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "host_foo"}> ({
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@routine_seq, <seq>, "host_foo">} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "host_bind"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{func_name = @devicefunc, sym_name = "acc_routine_0"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "devicefunc"}> ({
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_0, <seq>, "devicefunc">} : () -> ()
  "acc.routine"() <{func_name = @declfunc, sym_name = "acc_routine_1"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "declfunc", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{func_name = @nohost_vec, nohost, sym_name = "acc_routine_0", vector = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "nohost_vec"}> ({
  ^bb0(%arg0: i32):
    "func.return"() : () -> ()
  }) {acc.specialized_routine = #acc.specialized_routine<@acc_routine_0, <vector>, "nohost_vec">} : () -> ()
}) : () -> ()

