"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, f32) -> f32, sym_name = "trivial"}> ({
  ^bb0(%arg31: memref<f32> loc("<stdin>":3:8), %arg32: f32 loc("<stdin>":3:29)):
    "memref.store"(%arg32, %arg31) {name = "store"} : (f32, memref<f32>) -> () loc("<stdin>":4:5)
    %58 = "memref.load"(%arg31) {name = "load"} : (memref<f32>) -> f32 loc("<stdin>":5:11)
    "func.return"(%58) : (f32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<f32>, f32) -> f32, sym_name = "chain"}> ({
  ^bb0(%arg29: memref<f32> loc("<stdin>":9:8), %arg30: f32 loc("<stdin>":9:29)):
    "memref.store"(%arg30, %arg29) {name = "store"} : (f32, memref<f32>) -> () loc("<stdin>":10:5)
    %55 = "memref.load"(%arg29) {name = "load 1"} : (memref<f32>) -> f32 loc("<stdin>":11:11)
    %56 = "memref.load"(%arg29) {name = "load 2"} : (memref<f32>) -> f32 loc("<stdin>":12:11)
    %57 = "arith.addf"(%55, %56) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":13:11)
    "func.return"(%57) : (f32) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (memref<f32>, f32, i1) -> f32, sym_name = "branch"}> ({
  ^bb0(%arg26: memref<f32> loc("<stdin>":17:8), %arg27: f32 loc("<stdin>":17:29), %arg28: i1 loc("<stdin>":17:42)):
    "memref.store"(%arg27, %arg26) {name = "store"} : (f32, memref<f32>) -> () loc("<stdin>":18:5)
    "cf.cond_br"(%arg28)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":19:5)
  ^bb1:  // pred: ^bb0
    %52 = "memref.load"(%arg26) {name = "load 1"} : (memref<f32>) -> f32 loc("<stdin>":21:11)
    "cf.br"(%52)[^bb3] : (f32) -> () loc("<stdin>":22:5)
  ^bb2:  // pred: ^bb0
    %53 = "memref.load"(%arg26) {name = "load 2"} : (memref<f32>) -> f32 loc("<stdin>":24:11)
    "cf.br"(%53)[^bb3] : (f32) -> () loc("<stdin>":25:5)
  ^bb3(%54: f32 loc("<stdin>":26:8)):  // 2 preds: ^bb1, ^bb2
    "func.return"(%54) : (f32) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (memref<f32>, f32) -> f32, sym_name = "dead_branch"}> ({
  ^bb0(%arg24: memref<f32> loc("<stdin>":30:8), %arg25: f32 loc("<stdin>":30:29)):
    "memref.store"(%arg25, %arg24) {name = "store"} : (f32, memref<f32>) -> () loc("<stdin>":31:5)
    "cf.br"()[^bb2] : () -> () loc("<stdin>":32:5)
  ^bb1:  // no predecessors
    %49 = "memref.load"(%arg24) {name = "load 1"} : (memref<f32>) -> f32 loc("<stdin>":34:11)
    "cf.br"(%49)[^bb3] : (f32) -> () loc("<stdin>":35:5)
  ^bb2:  // pred: ^bb0
    %50 = "memref.load"(%arg24) {name = "load 2"} : (memref<f32>) -> f32 loc("<stdin>":37:11)
    "cf.br"(%50)[^bb3] : (f32) -> () loc("<stdin>":38:5)
  ^bb3(%51: f32 loc("<stdin>":39:8)):  // 2 preds: ^bb1, ^bb2
    "func.return"(%51) : (f32) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = (memref<?xf32>, f32, index, index, index) -> f32, sym_name = "loop"}> ({
  ^bb0(%arg17: memref<?xf32> loc("<stdin>":43:8), %arg18: f32 loc("<stdin>":43:31), %arg19: index loc("<stdin>":43:44), %arg20: index loc("<stdin>":43:59), %arg21: index loc("<stdin>":43:74)):
    %42 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":44:11)
    %43 = "memref.load"(%arg17, %arg21) {name = "pre"} : (memref<?xf32>, index) -> f32 loc("<stdin>":45:11)
    %44 = "scf.for"(%arg19, %arg20, %arg21, %42) ({
    ^bb0(%arg22: index loc("<stdin>":47:10), %arg23: f32 loc("<stdin>":47:25)):
      %47 = "memref.load"(%arg17, %arg22) {name = "loop"} : (memref<?xf32>, index) -> f32 loc("<stdin>":48:13)
      %48 = "arith.addf"(%arg23, %47) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":49:13)
      "scf.yield"(%48) : (f32) -> () loc("<stdin>":50:7)
    }) : (index, index, index, f32) -> f32 loc("<stdin>":46:11)
    %45 = "memref.load"(%arg17, %arg20) {name = "outside"} : (memref<?xf32>, index) -> f32 loc("<stdin>":52:11)
    %46 = "arith.addf"(%45, %44) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":53:11)
    "func.return"(%46) : (f32) -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (i1, memref<f32>) -> (), sym_name = "conditional"}> ({
  ^bb0(%arg15: i1 loc("<stdin>":57:8), %arg16: memref<f32> loc("<stdin>":57:20)):
    %39 = "memref.load"(%arg16) {name = "pre"} : (memref<f32>) -> f32 loc("<stdin>":58:11)
    "scf.if"(%arg15) ({
      %41 = "memref.load"(%arg16) {name = "then"} : (memref<f32>) -> f32 loc("<stdin>":60:13)
      "scf.yield"() : () -> () loc("<stdin>":61:7)
    }, {
    }) : (i1) -> () loc("<stdin>":59:5)
    %40 = "memref.load"(%arg16) {name = "post"} : (memref<f32>) -> f32 loc("<stdin>":64:11)
    "func.return"() : () -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":56:3)
  "func.func"() <{function_type = (i1, memref<f32>) -> (), sym_name = "two_sided_conditional"}> ({
  ^bb0(%arg13: i1 loc("<stdin>":68:8), %arg14: memref<f32> loc("<stdin>":68:20)):
    %35 = "memref.load"(%arg14) {name = "pre"} : (memref<f32>) -> f32 loc("<stdin>":69:11)
    "scf.if"(%arg13) ({
      %38 = "memref.load"(%arg14) {name = "then"} : (memref<f32>) -> f32 loc("<stdin>":71:13)
      "scf.yield"() : () -> () loc("<stdin>":72:7)
    }, {
      %37 = "memref.load"(%arg14) {name = "else"} : (memref<f32>) -> f32 loc("<stdin>":74:13)
      "scf.yield"() : () -> () loc("<stdin>":75:7)
    }) : (i1) -> () loc("<stdin>":70:5)
    %36 = "memref.load"(%arg14) {name = "post"} : (memref<f32>) -> f32 loc("<stdin>":77:11)
    "func.return"() : () -> () loc("<stdin>":78:5)
  }) : () -> () loc("<stdin>":67:3)
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "dead_conditional"}> ({
  ^bb0(%arg12: memref<f32> loc("<stdin>":81:8)):
    %31 = "arith.constant"() <{value = false}> : () -> i1 loc("<stdin>":82:11)
    %32 = "memref.load"(%arg12) {name = "pre"} : (memref<f32>) -> f32 loc("<stdin>":83:11)
    "scf.if"(%31) ({
      %34 = "memref.load"(%arg12) {name = "then"} : (memref<f32>) -> f32 loc("<stdin>":85:13)
      "scf.yield"() : () -> () loc("<stdin>":86:7)
    }, {
    }) : (i1) -> () loc("<stdin>":84:5)
    %33 = "memref.load"(%arg12) {name = "post"} : (memref<f32>) -> f32 loc("<stdin>":89:11)
    "func.return"() : () -> () loc("<stdin>":90:5)
  }) : () -> () loc("<stdin>":80:3)
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "known_conditional"}> ({
  ^bb0(%arg11: memref<f32> loc("<stdin>":93:8)):
    %26 = "arith.constant"() <{value = false}> : () -> i1 loc("<stdin>":94:11)
    %27 = "memref.load"(%arg11) {name = "pre"} : (memref<f32>) -> f32 loc("<stdin>":95:11)
    "scf.if"(%26) ({
      %30 = "memref.load"(%arg11) {name = "then"} : (memref<f32>) -> f32 loc("<stdin>":97:13)
      "scf.yield"() : () -> () loc("<stdin>":98:7)
    }, {
      %29 = "memref.load"(%arg11) {name = "else"} : (memref<f32>) -> f32 loc("<stdin>":100:13)
      "scf.yield"() : () -> () loc("<stdin>":101:7)
    }) : (i1) -> () loc("<stdin>":96:5)
    %28 = "memref.load"(%arg11) {name = "post"} : (memref<f32>) -> f32 loc("<stdin>":103:11)
    "func.return"() : () -> () loc("<stdin>":104:5)
  }) : () -> () loc("<stdin>":92:3)
  "func.func"() <{function_type = (memref<?xf32>, f32, index, index, index) -> f32, sym_name = "loop_cf"}> ({
  ^bb0(%arg6: memref<?xf32> loc("<stdin>":107:8), %arg7: f32 loc("<stdin>":107:30), %arg8: index loc("<stdin>":107:42), %arg9: index loc("<stdin>":107:56), %arg10: index loc("<stdin>":107:70)):
    %16 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":108:11)
    %17 = "memref.load"(%arg6, %arg10) {name = "pre"} : (memref<?xf32>, index) -> f32 loc("<stdin>":109:11)
    "cf.br"(%arg8, %16)[^bb1] : (index, f32) -> () loc("<stdin>":110:5)
  ^bb1(%18: index loc("<stdin>":111:8), %19: f32 loc("<stdin>":111:20)):  // 2 preds: ^bb0, ^bb2
    %20 = "arith.cmpi"(%18, %arg9) <{predicate = 2 : i64}> : (index, index) -> i1 loc("<stdin>":112:11)
    "cf.cond_br"(%20)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":113:5)
  ^bb2:  // pred: ^bb1
    %21 = "memref.load"(%arg6, %18) {name = "loop"} : (memref<?xf32>, index) -> f32 loc("<stdin>":115:11)
    %22 = "arith.addf"(%19, %21) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":116:11)
    %23 = "arith.addi"(%18, %arg10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":117:11)
    "cf.br"(%23, %22)[^bb1] : (index, f32) -> () loc("<stdin>":118:5)
  ^bb3:  // pred: ^bb1
    %24 = "memref.load"(%arg6, %arg9) {name = "outside"} : (memref<?xf32>, index) -> f32 loc("<stdin>":120:11)
    %25 = "arith.addf"(%24, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":121:11)
    "func.return"(%25) : (f32) -> () loc("<stdin>":122:5)
  }) : () -> () loc("<stdin>":106:3)
  "func.func"() <{function_type = (i1, memref<f32>) -> (), sym_name = "conditional_cf"}> ({
  ^bb0(%arg4: i1 loc("<stdin>":125:8), %arg5: memref<f32> loc("<stdin>":125:19)):
    %13 = "memref.load"(%arg5) {name = "pre"} : (memref<f32>) -> f32 loc("<stdin>":126:11)
    "cf.cond_br"(%arg4)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":127:5)
  ^bb1:  // pred: ^bb0
    %14 = "memref.load"(%arg5) {name = "then"} : (memref<f32>) -> f32 loc("<stdin>":129:11)
    "cf.br"()[^bb2] : () -> () loc("<stdin>":130:5)
  ^bb2:  // 2 preds: ^bb0, ^bb1
    %15 = "memref.load"(%arg5) {name = "post"} : (memref<f32>) -> f32 loc("<stdin>":132:11)
    "func.return"() : () -> () loc("<stdin>":133:5)
  }) : () -> () loc("<stdin>":124:3)
  "func.func"() <{function_type = (i1, memref<f32>) -> (), sym_name = "two_sided_conditional_cf"}> ({
  ^bb0(%arg2: i1 loc("<stdin>":136:8), %arg3: memref<f32> loc("<stdin>":136:19)):
    %9 = "memref.load"(%arg3) {name = "pre"} : (memref<f32>) -> f32 loc("<stdin>":137:10)
    "cf.cond_br"(%arg2)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":138:5)
  ^bb1:  // pred: ^bb0
    %10 = "memref.load"(%arg3) {name = "then"} : (memref<f32>) -> f32 loc("<stdin>":140:11)
    "cf.br"()[^bb3] : () -> () loc("<stdin>":141:5)
  ^bb2:  // pred: ^bb0
    %11 = "memref.load"(%arg3) {name = "else"} : (memref<f32>) -> f32 loc("<stdin>":143:11)
    "cf.br"()[^bb3] : () -> () loc("<stdin>":144:5)
  ^bb3:  // 2 preds: ^bb1, ^bb2
    %12 = "memref.load"(%arg3) {name = "post"} : (memref<f32>) -> f32 loc("<stdin>":146:11)
    "func.return"() : () -> () loc("<stdin>":147:5)
  }) : () -> () loc("<stdin>":135:3)
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "dead_conditional_cf"}> ({
  ^bb0(%arg1: memref<f32> loc("<stdin>":150:8)):
    %5 = "arith.constant"() <{value = false}> : () -> i1 loc("<stdin>":151:10)
    %6 = "memref.load"(%arg1) {name = "pre"} : (memref<f32>) -> f32 loc("<stdin>":152:10)
    "cf.cond_br"(%5)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":153:5)
  ^bb1:  // pred: ^bb0
    %7 = "memref.load"(%arg1) {name = "then"} : (memref<f32>) -> f32 loc("<stdin>":155:10)
    "cf.br"()[^bb2] : () -> () loc("<stdin>":156:5)
  ^bb2:  // 2 preds: ^bb0, ^bb1
    %8 = "memref.load"(%arg1) {name = "post"} : (memref<f32>) -> f32 loc("<stdin>":158:10)
    "func.return"() : () -> () loc("<stdin>":159:5)
  }) : () -> () loc("<stdin>":149:3)
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "known_conditional_cf"}> ({
  ^bb0(%arg0: memref<f32> loc("<stdin>":162:8)):
    %0 = "arith.constant"() <{value = false}> : () -> i1 loc("<stdin>":163:10)
    %1 = "memref.load"(%arg0) {name = "pre"} : (memref<f32>) -> f32 loc("<stdin>":164:10)
    "cf.cond_br"(%0)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":165:5)
  ^bb1:  // pred: ^bb0
    %2 = "memref.load"(%arg0) {name = "then"} : (memref<f32>) -> f32 loc("<stdin>":167:10)
    "cf.br"()[^bb3] : () -> () loc("<stdin>":168:5)
  ^bb2:  // pred: ^bb0
    %3 = "memref.load"(%arg0) {name = "else"} : (memref<f32>) -> f32 loc("<stdin>":170:10)
    "cf.br"()[^bb3] : () -> () loc("<stdin>":171:5)
  ^bb3:  // 2 preds: ^bb1, ^bb2
    %4 = "memref.load"(%arg0) {name = "post"} : (memref<f32>) -> f32 loc("<stdin>":173:10)
    "func.return"() : () -> () loc("<stdin>":174:5)
  }) : () -> () loc("<stdin>":161:3)
}) : () -> () loc("<stdin>":1:1)
