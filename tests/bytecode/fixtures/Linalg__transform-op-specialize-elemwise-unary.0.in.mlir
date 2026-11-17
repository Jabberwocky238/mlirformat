"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "specialize_exp"}> ({
  ^bb0(%arg1: tensor<?x?x?xf32> loc("<stdin>":4:8), %arg2: tensor<?x?x?xf32> loc("<stdin>":4:34)):
    %2 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg27: f32 loc("<stdin>":6:10), %arg28: f32 loc("<stdin>":6:23)):
      %28 = "math.exp"(%arg27) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":7:13)
      "linalg.yield"(%28) : (f32) -> () loc("<stdin>":8:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":5:10)
    %3 = "linalg.generic"(%2, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg25: f32 loc("<stdin>":11:10), %arg26: f32 loc("<stdin>":11:23)):
      %27 = "math.log"(%arg25) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":12:13)
      "linalg.yield"(%27) : (f32) -> () loc("<stdin>":13:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":10:10)
    %4 = "linalg.generic"(%3, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg23: f32 loc("<stdin>":16:10), %arg24: f32 loc("<stdin>":16:23)):
      %26 = "math.absf"(%arg23) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":17:13)
      "linalg.yield"(%26) : (f32) -> () loc("<stdin>":18:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":15:10)
    %5 = "linalg.generic"(%4, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg21: f32 loc("<stdin>":21:10), %arg22: f32 loc("<stdin>":21:23)):
      %25 = "math.ceil"(%arg21) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":22:13)
      "linalg.yield"(%25) : (f32) -> () loc("<stdin>":23:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":20:10)
    %6 = "linalg.generic"(%5, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg19: f32 loc("<stdin>":26:10), %arg20: f32 loc("<stdin>":26:23)):
      %24 = "math.floor"(%arg19) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":27:13)
      "linalg.yield"(%24) : (f32) -> () loc("<stdin>":28:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":25:10)
    %7 = "linalg.generic"(%6, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg17: f32 loc("<stdin>":31:10), %arg18: f32 loc("<stdin>":31:23)):
      %23 = "arith.negf"(%arg17) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":32:13)
      "linalg.yield"(%23) : (f32) -> () loc("<stdin>":33:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":30:10)
    %8 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":35:10)
    %9 = "linalg.generic"(%7, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg15: f32 loc("<stdin>":37:10), %arg16: f32 loc("<stdin>":37:23)):
      %22 = "arith.divf"(%8, %arg15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":38:13)
      "linalg.yield"(%22) : (f32) -> () loc("<stdin>":39:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":36:10)
    %10 = "linalg.generic"(%9, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg13: f32 loc("<stdin>":42:10), %arg14: f32 loc("<stdin>":42:23)):
      %21 = "math.round"(%arg13) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":43:13)
      "linalg.yield"(%21) : (f32) -> () loc("<stdin>":44:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":41:11)
    %11 = "linalg.generic"(%10, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32 loc("<stdin>":47:10), %arg12: f32 loc("<stdin>":47:23)):
      %20 = "math.sqrt"(%arg11) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":48:13)
      "linalg.yield"(%20) : (f32) -> () loc("<stdin>":49:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":46:11)
    %12 = "linalg.generic"(%11, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":52:10), %arg10: f32 loc("<stdin>":52:22)):
      %19 = "math.rsqrt"(%arg9) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":53:13)
      "linalg.yield"(%19) : (f32) -> () loc("<stdin>":54:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":51:11)
    %13 = "linalg.generic"(%12, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32 loc("<stdin>":57:10), %arg8: f32 loc("<stdin>":57:22)):
      %18 = "arith.mulf"(%arg7, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":58:13)
      "linalg.yield"(%18) : (f32) -> () loc("<stdin>":59:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":56:11)
    %14 = "linalg.generic"(%13, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32 loc("<stdin>":62:10), %arg6: f32 loc("<stdin>":62:22)):
      %17 = "math.tanh"(%arg5) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":63:13)
      "linalg.yield"(%17) : (f32) -> () loc("<stdin>":64:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":61:11)
    %15 = "linalg.generic"(%14, %arg2) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":67:10), %arg4: f32 loc("<stdin>":67:22)):
      %16 = "math.erf"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":68:13)
      "linalg.yield"(%16) : (f32) -> () loc("<stdin>":69:7)
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32> loc("<stdin>":66:11)
    "func.return"(%15) : (tensor<?x?x?xf32>) -> () loc("<stdin>":71:5)
  }) : () -> () loc("<stdin>":3:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":75:10)):
      %0 = "transform.structured.match"(%arg0) <{interface = 0 : i32}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":76:12)
      %1 = "transform.structured.specialize"(%0) <{emit_category = false}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":77:12)
      "transform.yield"() : () -> () loc("<stdin>":78:7)
    }) : () -> () loc("<stdin>":74:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":73:3)
}) : () -> () loc("<stdin>":2:1)
