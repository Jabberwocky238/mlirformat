"builtin.module"() ({
  "smt.solver"() ({
    %39 = "smt.declare_fun"() <{namePrefix = "b"}> : () -> !smt.bv<32> loc("<stdin>":3:11)
    %40 = "smt.declare_fun"() : () -> !smt.int loc("<stdin>":4:11)
    %41 = "smt.declare_fun"() : () -> !smt.func<(!smt.int, !smt.bv<32>) !smt.bool> loc("<stdin>":5:11)
    %42 = "smt.apply_func"(%41, %40, %39) : (!smt.func<(!smt.int, !smt.bv<32>) !smt.bool>, !smt.int, !smt.bv<32>) -> !smt.bool loc("<stdin>":6:11)
    "smt.assert"(%42) : (!smt.bool) -> () loc("<stdin>":7:5)
    %43 = "smt.declare_fun"() : () -> !smt.sort<"uninterpreted"> loc("<stdin>":8:11)
    %44 = "smt.declare_fun"() : () -> !smt.sort<"other"[!smt.sort<"uninterpreted">]> loc("<stdin>":9:11)
    %45 = "smt.declare_fun"() : () -> !smt.func<(!smt.sort<"other"[!smt.sort<"uninterpreted">]>, !smt.sort<"uninterpreted">) !smt.bool> loc("<stdin>":10:11)
    %46 = "smt.apply_func"(%45, %44, %43) : (!smt.func<(!smt.sort<"other"[!smt.sort<"uninterpreted">]>, !smt.sort<"uninterpreted">) !smt.bool>, !smt.sort<"other"[!smt.sort<"uninterpreted">]>, !smt.sort<"uninterpreted">) -> !smt.bool loc("<stdin>":11:11)
    "smt.assert"(%46) : (!smt.bool) -> () loc("<stdin>":12:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":14:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":16:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":18:7)
    }) : () -> () loc("<stdin>":13:5)
    "smt.yield"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":2:3)
  "smt.solver"() ({
    %31 = "smt.constant"() <{value = true}> : () -> !smt.bool loc("<stdin>":23:11)
    %32 = "smt.constant"() <{value = false}> : () -> !smt.bool loc("<stdin>":24:11)
    %33 = "smt.not"(%31) : (!smt.bool) -> !smt.bool loc("<stdin>":25:11)
    %34 = "smt.and"(%33, %31, %32) : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":26:11)
    %35 = "smt.or"(%34, %33, %31) : (!smt.bool, !smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":27:11)
    %36 = "smt.xor"(%33, %35) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":28:11)
    %37 = "smt.implies"(%36, %32) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":29:11)
    %38 = "smt.implies"(%37, %31) : (!smt.bool, !smt.bool) -> !smt.bool loc("<stdin>":30:11)
    "smt.assert"(%38) : (!smt.bool) -> () loc("<stdin>":31:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":33:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":35:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":37:7)
    }) : () -> () loc("<stdin>":32:5)
    "smt.yield"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":22:3)
  "smt.solver"() ({
    %25 = "smt.constant"() <{value = true}> : () -> !smt.bool loc("<stdin>":42:11)
    %26 = "smt.constant"() <{value = false}> : () -> !smt.bool loc("<stdin>":43:11)
    %27 = "smt.int.constant"() <{value = 0 : ui64}> : () -> !smt.int loc("<stdin>":44:11)
    %28 = "smt.array.broadcast"(%25) : (!smt.bool) -> !smt.array<[!smt.int -> !smt.bool]> loc("<stdin>":45:11)
    %29 = "smt.array.store"(%28, %27, %26) : (!smt.array<[!smt.int -> !smt.bool]>, !smt.int, !smt.bool) -> !smt.array<[!smt.int -> !smt.bool]> loc("<stdin>":46:11)
    %30 = "smt.array.select"(%29, %27) : (!smt.array<[!smt.int -> !smt.bool]>, !smt.int) -> !smt.bool loc("<stdin>":47:11)
    "smt.assert"(%30) : (!smt.bool) -> () loc("<stdin>":48:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":50:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":52:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":54:7)
    }) : () -> () loc("<stdin>":49:5)
    "smt.yield"() : () -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":41:3)
  "smt.solver"() ({
    %18 = "smt.bv.constant"() <{value = #smt.bv<-1> : !smt.bv<4>}> : () -> !smt.bv<4> loc("<stdin>":59:11)
    %19 = "smt.bv.constant"() <{value = #smt.bv<0> : !smt.bv<4>}> : () -> !smt.bv<4> loc("<stdin>":60:11)
    %20 = "smt.bv.constant"() <{value = #smt.bv<-1> : !smt.bv<8>}> : () -> !smt.bv<8> loc("<stdin>":61:11)
    %21 = "smt.bv.concat"(%18, %19) : (!smt.bv<4>, !smt.bv<4>) -> !smt.bv<8> loc("<stdin>":62:11)
    %22 = "smt.bv.extract"(%21) <{lowBit = 4 : i32}> : (!smt.bv<8>) -> !smt.bv<4> loc("<stdin>":63:11)
    %23 = "smt.bv.repeat"(%22) : (!smt.bv<4>) -> !smt.bv<8> loc("<stdin>":64:11)
    %24 = "smt.eq"(%23, %20) : (!smt.bv<8>, !smt.bv<8>) -> !smt.bool loc("<stdin>":65:11)
    "smt.assert"(%24) : (!smt.bool) -> () loc("<stdin>":66:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":68:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":70:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":72:7)
    }) : () -> () loc("<stdin>":67:5)
    "smt.yield"() : () -> () loc("<stdin>":74:5)
  }) : () -> () loc("<stdin>":58:3)
  "smt.solver"() ({
    %11 = "smt.forall"() <{boundVarNames = ["a"], weight = 0 : i32}> ({
    ^bb0(%arg0: !smt.int loc("<stdin>":78:10)):
      %12 = "smt.int.constant"() <{value = 2 : ui4}> : () -> !smt.int loc("<stdin>":79:13)
      %13 = "smt.int.mul"(%arg0, %12) : (!smt.int, !smt.int) -> !smt.int loc("<stdin>":80:13)
      %14 = "smt.exists"() <{weight = 0 : i32}> ({
      ^bb0(%arg1: !smt.int loc("<stdin>":82:12)):
        %15 = "smt.int.constant"() <{value = 2 : ui4}> : () -> !smt.int loc("<stdin>":83:15)
        %16 = "smt.int.mul"(%15, %arg1) : (!smt.int, !smt.int) -> !smt.int loc("<stdin>":84:15)
        %17 = "smt.eq"(%16, %13) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":85:15)
        "smt.yield"(%17) : (!smt.bool) -> () loc("<stdin>":86:9)
      }) : () -> !smt.bool loc("<stdin>":81:13)
      "smt.yield"(%14) : (!smt.bool) -> () loc("<stdin>":88:7)
    }) : () -> !smt.bool loc("<stdin>":77:11)
    "smt.assert"(%11) : (!smt.bool) -> () loc("<stdin>":90:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":92:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":94:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":96:7)
    }) : () -> () loc("<stdin>":91:5)
    "smt.yield"() : () -> () loc("<stdin>":98:5)
  }) : () -> () loc("<stdin>":76:3)
  "smt.solver"() ({
    %7 = "smt.int.constant"() <{value = 3 : ui4}> : () -> !smt.int loc("<stdin>":101:10)
    %8 = "smt.int.constant"() <{value = 4 : ui4}> : () -> !smt.int loc("<stdin>":102:10)
    %9 = "smt.eq"(%7, %8) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":103:10)
    %10 = "smt.eq"(%7, %7) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":104:11)
    "smt.push"() <{count = 1 : i32}> : () -> () loc("<stdin>":105:5)
    "smt.assert"(%9) : (!smt.bool) -> () loc("<stdin>":106:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":108:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":110:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":112:7)
    }) : () -> () loc("<stdin>":107:5)
    "smt.pop"() <{count = 1 : i32}> : () -> () loc("<stdin>":114:5)
    "smt.assert"(%10) : (!smt.bool) -> () loc("<stdin>":115:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":117:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":119:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":121:7)
    }) : () -> () loc("<stdin>":116:5)
    "smt.yield"() : () -> () loc("<stdin>":123:5)
  }) : () -> () loc("<stdin>":100:3)
  "smt.solver"() ({
    %3 = "smt.int.constant"() <{value = 3 : ui4}> : () -> !smt.int loc("<stdin>":126:10)
    %4 = "smt.int.constant"() <{value = 4 : ui4}> : () -> !smt.int loc("<stdin>":127:10)
    %5 = "smt.eq"(%3, %4) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":128:10)
    %6 = "smt.eq"(%3, %3) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":129:10)
    "smt.assert"(%5) : (!smt.bool) -> () loc("<stdin>":130:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":132:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":134:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":136:7)
    }) : () -> () loc("<stdin>":131:5)
    "smt.reset"() : () -> () loc("<stdin>":138:5)
    "smt.assert"(%6) : (!smt.bool) -> () loc("<stdin>":139:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":141:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":143:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":145:7)
    }) : () -> () loc("<stdin>":140:5)
    "smt.yield"() : () -> () loc("<stdin>":147:5)
  }) : () -> () loc("<stdin>":125:3)
  "smt.solver"() ({
    "smt.set_logic"() <{logic = "HORN"}> : () -> () loc("<stdin>":150:5)
    %0 = "smt.declare_fun"() : () -> !smt.int loc("<stdin>":151:10)
    %1 = "smt.int.constant"() <{value = 4 : ui4}> : () -> !smt.int loc("<stdin>":152:10)
    %2 = "smt.eq"(%0, %1) : (!smt.int, !smt.int) -> !smt.bool loc("<stdin>":153:10)
    "smt.assert"(%2) : (!smt.bool) -> () loc("<stdin>":154:5)
    "smt.check"() ({
      "smt.yield"() : () -> () loc("<stdin>":156:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":158:7)
    }, {
      "smt.yield"() : () -> () loc("<stdin>":160:7)
    }) : () -> () loc("<stdin>":155:5)
    "smt.yield"() : () -> () loc("<stdin>":162:5)
  }) : () -> () loc("<stdin>":149:3)
}) : () -> () loc("<stdin>":1:1)
