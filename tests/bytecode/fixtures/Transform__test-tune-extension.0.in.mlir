"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "schedule_with_nondet_knobs"}> ({
  ^bb0(%arg1: !transform.any_op loc("<stdin>":3:8)):
    %0 = "transform.tune.knob"() <{name = "coin", options = [true, false]}> : () -> !transform.any_param loc("<stdin>":4:10)
    %1 = "transform.tune.knob"() <{name = "animal", options = ["cat", "dog", unit]}> : () -> !transform.any_param loc("<stdin>":5:10)
    %2 = "transform.tune.knob"() <{name = "tile_size", options = [2, 4, 8, 16, 24, 32]}> : () -> !transform.any_param loc("<stdin>":6:10)
    %3 = "transform.tune.knob"() <{name = "magic_value", options = [2.000000e+00 : f32, 2.250000e+00 : f32, 2.500000e+00 : f32, 2.750000e+00 : f32, 3.000000e+00 : f32]}> : () -> !transform.any_param loc("<stdin>":7:10)
    "transform.debug.emit_param_as_remark"(%0) : (!transform.any_param) -> () loc("<stdin>":8:5)
    "transform.yield"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":12:8)):
    "transform.yield"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":11:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
