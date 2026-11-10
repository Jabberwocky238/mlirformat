"builtin.module"() ({
  "acc.routine"() <{func_name = @host_foo, seq = [#acc.device_type<none>], sym_name = "routine_seq"}> : () -> ()
  "func.func"() <{function_type = (memref<8xi32>) -> (), sym_name = "host_foo"}> ({
  ^bb0(%arg0: memref<8xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%1, %arg0, %0) : (i32, memref<8xi32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{func_name = @host_bar, sym_name = "routine_vec", vector = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = (memref<4xi32>) -> (), sym_name = "host_bar"}> ({
  ^bb0(%arg0: memref<4xi32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "memref.store"(%1, %arg0, %0) : (i32, memref<4xi32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{func_name = @host_worker, sym_name = "routine_worker", worker = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "host_worker"}> ({
  ^bb0(%arg0: i32):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{func_name = @host_gang, gang = [#acc.device_type<none>], sym_name = "routine_gang"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "host_gang"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{func_name = @host_ret, seq = [#acc.device_type<none>], sym_name = "routine_ret"}> : () -> ()
  "func.func"() <{function_type = (i1) -> i32, sym_name = "host_ret"}> ({
  ^bb0(%arg0: i1):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.select"(%arg0, %0, %1) : (i1, i32, i32) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{func_name = @host_cf, seq = [#acc.device_type<none>], sym_name = "routine_cf"}> : () -> ()
  "func.func"() <{function_type = (i1) -> i32, sym_name = "host_cf"}> ({
  ^bb0(%arg0: i1):
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "func.return"(%0) : (i32) -> ()
  ^bb2:  // pred: ^bb0
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{bindIdName = [], bindIdNameDeviceType = [], bindStrName = ["myname"], bindStrNameDeviceType = [#acc.device_type<none>], func_name = @host_bind, seq = [#acc.device_type<none>], sym_name = "routine_bind"}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "host_bind"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "acc.routine"() <{func_name = @f_a, seq = [#acc.device_type<none>], sym_name = "r_a"}> : () -> ()
  "acc.routine"() <{func_name = @f_a, sym_name = "r_b", vector = [#acc.device_type<none>]}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "f_a"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

