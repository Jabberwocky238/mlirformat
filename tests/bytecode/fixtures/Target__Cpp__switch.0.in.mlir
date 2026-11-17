"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_ptrdiff_t"}> ({
    %55 = "emitc.constant"() <{value = 1 : index}> : () -> !emitc.ptrdiff_t loc("<stdin>":3:11)
    "emitc.switch"(%55) <{cases = array<i64: 2, 5>}> ({
      %58 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":5:13)
      "emitc.call_opaque"(%58) <{callee = "func2"}> : (f32) -> () loc("<stdin>":6:7)
      "emitc.yield"() : () -> () loc("<stdin>":7:7)
    }, {
      %57 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":9:13)
      "emitc.yield"() : () -> () loc("<stdin>":10:7)
    }, {
      %56 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":12:13)
      "emitc.yield"() : () -> () loc("<stdin>":13:7)
    }) : (!emitc.ptrdiff_t) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_ssize_t"}> ({
    %51 = "emitc.constant"() <{value = 1 : index}> : () -> !emitc.ssize_t loc("<stdin>":18:11)
    "emitc.switch"(%51) <{cases = array<i64: 2, 5>}> ({
      %54 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":20:13)
      "emitc.call_opaque"(%54) <{callee = "func2"}> : (f32) -> () loc("<stdin>":21:7)
      "emitc.yield"() : () -> () loc("<stdin>":22:7)
    }, {
      %53 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":24:13)
      "emitc.yield"() : () -> () loc("<stdin>":25:7)
    }, {
      %52 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":27:13)
      "emitc.yield"() : () -> () loc("<stdin>":28:7)
    }) : (!emitc.ssize_t) -> () loc("<stdin>":19:5)
    "func.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_size_t"}> ({
    %47 = "emitc.constant"() <{value = 1 : index}> : () -> !emitc.size_t loc("<stdin>":33:11)
    "emitc.switch"(%47) <{cases = array<i64: 2, 5>}> ({
      %50 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":35:13)
      "emitc.call_opaque"(%50) <{callee = "func2"}> : (f32) -> () loc("<stdin>":36:7)
      "emitc.yield"() : () -> () loc("<stdin>":37:7)
    }, {
      %49 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":39:13)
      "emitc.yield"() : () -> () loc("<stdin>":40:7)
    }, {
      %48 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":42:13)
      "emitc.yield"() : () -> () loc("<stdin>":43:7)
    }) : (!emitc.size_t) -> () loc("<stdin>":34:5)
    "func.return"() : () -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_index"}> ({
    %43 = "emitc.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":48:11)
    "emitc.switch"(%43) <{cases = array<i64: 2, 5>}> ({
      %46 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":50:13)
      "emitc.call_opaque"(%46) <{callee = "func2"}> : (f32) -> () loc("<stdin>":51:7)
      "emitc.yield"() : () -> () loc("<stdin>":52:7)
    }, {
      %45 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":54:13)
      "emitc.yield"() : () -> () loc("<stdin>":55:7)
    }, {
      %44 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":57:13)
      "emitc.yield"() : () -> () loc("<stdin>":58:7)
    }) : (index) -> () loc("<stdin>":49:5)
    "func.return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_opaque"}> ({
    %39 = "emitc.constant"() <{value = #emitc.opaque<"1">}> : () -> !emitc.opaque<"size_t"> loc("<stdin>":63:11)
    "emitc.switch"(%39) <{cases = array<i64: 2, 5>}> ({
      %42 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":65:13)
      "emitc.call_opaque"(%42) <{callee = "func2"}> : (f32) -> () loc("<stdin>":66:7)
      "emitc.yield"() : () -> () loc("<stdin>":67:7)
    }, {
      %41 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":69:13)
      "emitc.yield"() : () -> () loc("<stdin>":70:7)
    }, {
      %40 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":72:13)
      "emitc.yield"() : () -> () loc("<stdin>":73:7)
    }) : (!emitc.opaque<"size_t">) -> () loc("<stdin>":64:5)
    "func.return"() : () -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_i1"}> ({
    %35 = "emitc.constant"() <{value = true}> : () -> i1 loc("<stdin>":78:11)
    "emitc.switch"(%35) <{cases = array<i64: 2, 5>}> ({
      %38 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":80:13)
      "emitc.call_opaque"(%38) <{callee = "func2"}> : (f32) -> () loc("<stdin>":81:7)
      "emitc.yield"() : () -> () loc("<stdin>":82:7)
    }, {
      %37 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":84:13)
      "emitc.yield"() : () -> () loc("<stdin>":85:7)
    }, {
      %36 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":87:13)
      "emitc.yield"() : () -> () loc("<stdin>":88:7)
    }) : (i1) -> () loc("<stdin>":79:5)
    "func.return"() : () -> () loc("<stdin>":90:5)
  }) : () -> () loc("<stdin>":77:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_i8"}> ({
    %31 = "emitc.constant"() <{value = 1 : i8}> : () -> i8 loc("<stdin>":93:11)
    "emitc.switch"(%31) <{cases = array<i64: 2, 5>}> ({
      %34 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":95:13)
      "emitc.call_opaque"(%34) <{callee = "func2"}> : (f32) -> () loc("<stdin>":96:7)
      "emitc.yield"() : () -> () loc("<stdin>":97:7)
    }, {
      %33 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":99:13)
      "emitc.yield"() : () -> () loc("<stdin>":100:7)
    }, {
      %32 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":102:13)
      "emitc.yield"() : () -> () loc("<stdin>":103:7)
    }) : (i8) -> () loc("<stdin>":94:5)
    "func.return"() : () -> () loc("<stdin>":105:5)
  }) : () -> () loc("<stdin>":92:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_ui8"}> ({
    %27 = "emitc.constant"() <{value = 1 : ui8}> : () -> ui8 loc("<stdin>":108:11)
    "emitc.switch"(%27) <{cases = array<i64: 2, 5>}> ({
      %30 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":110:13)
      "emitc.call_opaque"(%30) <{callee = "func2"}> : (f32) -> () loc("<stdin>":111:7)
      "emitc.yield"() : () -> () loc("<stdin>":112:7)
    }, {
      %29 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":114:13)
      "emitc.yield"() : () -> () loc("<stdin>":115:7)
    }, {
      %28 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":117:13)
      "emitc.yield"() : () -> () loc("<stdin>":118:7)
    }) : (ui8) -> () loc("<stdin>":109:5)
    "func.return"() : () -> () loc("<stdin>":120:5)
  }) : () -> () loc("<stdin>":107:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_i16"}> ({
    %23 = "emitc.constant"() <{value = 1 : i16}> : () -> i16 loc("<stdin>":123:11)
    "emitc.switch"(%23) <{cases = array<i64: 2, 5>}> ({
      %26 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":125:13)
      "emitc.call_opaque"(%26) <{callee = "func2"}> : (f32) -> () loc("<stdin>":126:7)
      "emitc.yield"() : () -> () loc("<stdin>":127:7)
    }, {
      %25 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":129:13)
      "emitc.yield"() : () -> () loc("<stdin>":130:7)
    }, {
      %24 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":132:13)
      "emitc.yield"() : () -> () loc("<stdin>":133:7)
    }) : (i16) -> () loc("<stdin>":124:5)
    "func.return"() : () -> () loc("<stdin>":135:5)
  }) : () -> () loc("<stdin>":122:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_ui16"}> ({
    %19 = "emitc.constant"() <{value = 1 : ui16}> : () -> ui16 loc("<stdin>":138:11)
    "emitc.switch"(%19) <{cases = array<i64: 2, 5>}> ({
      %22 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":140:13)
      "emitc.call_opaque"(%22) <{callee = "func2"}> : (f32) -> () loc("<stdin>":141:7)
      "emitc.yield"() : () -> () loc("<stdin>":142:7)
    }, {
      %21 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":144:13)
      "emitc.yield"() : () -> () loc("<stdin>":145:7)
    }, {
      %20 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":147:13)
      "emitc.yield"() : () -> () loc("<stdin>":148:7)
    }) : (ui16) -> () loc("<stdin>":139:5)
    "func.return"() : () -> () loc("<stdin>":150:5)
  }) : () -> () loc("<stdin>":137:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_i32"}> ({
    %15 = "emitc.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":153:11)
    "emitc.switch"(%15) <{cases = array<i64: 2, 5>}> ({
      %18 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":155:13)
      "emitc.call_opaque"(%18) <{callee = "func2"}> : (f32) -> () loc("<stdin>":156:7)
      "emitc.yield"() : () -> () loc("<stdin>":157:7)
    }, {
      %17 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":159:13)
      "emitc.yield"() : () -> () loc("<stdin>":160:7)
    }, {
      %16 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":162:13)
      "emitc.yield"() : () -> () loc("<stdin>":163:7)
    }) : (i32) -> () loc("<stdin>":154:5)
    "func.return"() : () -> () loc("<stdin>":165:5)
  }) : () -> () loc("<stdin>":152:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_ui32"}> ({
    %11 = "emitc.constant"() <{value = 1 : ui32}> : () -> ui32 loc("<stdin>":168:11)
    "emitc.switch"(%11) <{cases = array<i64: 2, 5>}> ({
      %14 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":170:13)
      "emitc.call_opaque"(%14) <{callee = "func2"}> : (f32) -> () loc("<stdin>":171:7)
      "emitc.yield"() : () -> () loc("<stdin>":172:7)
    }, {
      %13 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":174:13)
      "emitc.yield"() : () -> () loc("<stdin>":175:7)
    }, {
      %12 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":177:13)
      "emitc.yield"() : () -> () loc("<stdin>":178:7)
    }) : (ui32) -> () loc("<stdin>":169:5)
    "func.return"() : () -> () loc("<stdin>":180:5)
  }) : () -> () loc("<stdin>":167:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_i64"}> ({
    %7 = "emitc.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":183:10)
    "emitc.switch"(%7) <{cases = array<i64: 2, 5>}> ({
      %10 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":185:13)
      "emitc.call_opaque"(%10) <{callee = "func2"}> : (f32) -> () loc("<stdin>":186:7)
      "emitc.yield"() : () -> () loc("<stdin>":187:7)
    }, {
      %9 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":189:12)
      "emitc.yield"() : () -> () loc("<stdin>":190:7)
    }, {
      %8 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":192:12)
      "emitc.yield"() : () -> () loc("<stdin>":193:7)
    }) : (i64) -> () loc("<stdin>":184:5)
    "func.return"() : () -> () loc("<stdin>":195:5)
  }) : () -> () loc("<stdin>":182:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_ui64"}> ({
    %3 = "emitc.constant"() <{value = 1 : ui64}> : () -> ui64 loc("<stdin>":198:10)
    "emitc.switch"(%3) <{cases = array<i64: 2, 5>}> ({
      %6 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32 loc("<stdin>":200:12)
      "emitc.call_opaque"(%6) <{callee = "func2"}> : (f32) -> () loc("<stdin>":201:7)
      "emitc.yield"() : () -> () loc("<stdin>":202:7)
    }, {
      %5 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32 loc("<stdin>":204:12)
      "emitc.yield"() : () -> () loc("<stdin>":205:7)
    }, {
      %4 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32 loc("<stdin>":207:12)
      "emitc.yield"() : () -> () loc("<stdin>":208:7)
    }) : (ui64) -> () loc("<stdin>":199:5)
    "func.return"() : () -> () loc("<stdin>":210:5)
  }) : () -> () loc("<stdin>":197:3)
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_expression"}> ({
    %0 = "emitc.constant"() <{value = 42 : i64}> : () -> i64 loc("<stdin>":213:10)
    %1 = "emitc.expression"(%0) ({
    ^bb0(%arg0: i64 loc("<stdin>":215:10)):
      %2 = "emitc.unary_minus"(%arg0) : (i64) -> i64 loc("<stdin>":216:12)
      "emitc.yield"(%2) : (i64) -> () loc("<stdin>":217:7)
    }) : (i64) -> i64 loc("<stdin>":214:10)
    "emitc.switch"(%1) <{cases = array<i64>}> ({
      "emitc.yield"() : () -> () loc("<stdin>":220:7)
    }) : (i64) -> () loc("<stdin>":219:5)
    "func.return"() : () -> () loc("<stdin>":222:5)
  }) : () -> () loc("<stdin>":212:3)
}) : () -> () loc("<stdin>":1:1)
