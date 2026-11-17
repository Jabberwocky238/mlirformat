"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_raw"}> ({
  ^bb0(%arg40: i32 loc("<stdin>":3:8)):
    "omp.canonical_loop"(%arg40) ({
    ^bb0(%arg41: i32 loc("<stdin>":5:10)):
      %29 = "llvm.add"(%arg41, %arg41) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":6:13)
      "omp.terminator"() : () -> () loc("<stdin>":7:7)
    }) : (i32) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_sequential_raw"}> ({
  ^bb0(%arg37: i32 loc("<stdin>":12:8)):
    %26 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":13:11)
    "omp.canonical_loop"(%arg37, %26) ({
    ^bb0(%arg39: i32 loc("<stdin>":15:10)):
      %28 = "llvm.add"(%arg39, %arg39) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":16:13)
      "omp.terminator"() : () -> () loc("<stdin>":17:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":14:5)
    %27 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":19:11)
    "omp.canonical_loop"(%arg37, %27) ({
    ^bb0(%arg38: i32 loc("<stdin>":21:10)):
      "omp.terminator"() : () -> () loc("<stdin>":22:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":20:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_nested_canonloop_raw"}> ({
  ^bb0(%arg33: i32 loc("<stdin>":27:8), %arg34: i32 loc("<stdin>":27:21)):
    %23 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":28:11)
    %24 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":29:11)
    "omp.canonical_loop"(%arg33, %23) ({
    ^bb0(%arg35: i32 loc("<stdin>":31:10)):
      "omp.canonical_loop"(%arg34, %24) ({
      ^bb0(%arg36: i32 loc("<stdin>":33:12)):
        %25 = "llvm.add"(%arg35, %arg36) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":34:15)
        "omp.terminator"() : () -> () loc("<stdin>":35:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":32:7)
      "omp.terminator"() : () -> () loc("<stdin>":37:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":30:5)
    "func.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_pretty"}> ({
  ^bb0(%arg31: i32 loc("<stdin>":42:8)):
    "omp.canonical_loop"(%arg31) ({
    ^bb0(%arg32: i32 loc("<stdin>":44:10)):
      %22 = "llvm.add"(%arg32, %arg32) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":45:13)
      "omp.terminator"() : () -> () loc("<stdin>":46:7)
    }) : (i32) -> () loc("<stdin>":43:5)
    "func.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = () -> (), sym_name = "omp_canonloop_constant_pretty"}> ({
    %20 = "llvm.mlir.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":51:11)
    "omp.canonical_loop"(%20) ({
    ^bb0(%arg30: i32 loc("<stdin>":53:10)):
      %21 = "llvm.add"(%arg30, %arg30) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32 loc("<stdin>":54:13)
      "omp.terminator"() : () -> () loc("<stdin>":55:7)
    }) : (i32) -> () loc("<stdin>":52:5)
    "func.return"() : () -> () loc("<stdin>":57:5)
  }) : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_sequential_pretty"}> ({
  ^bb0(%arg26: i32 loc("<stdin>":60:8)):
    %17 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":61:11)
    "omp.canonical_loop"(%arg26, %17) ({
    ^bb0(%arg29: i32 loc("<stdin>":63:10)):
      "omp.terminator"() : () -> () loc("<stdin>":64:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":62:5)
    %18 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":66:11)
    "omp.canonical_loop"(%arg26, %18) ({
    ^bb0(%arg28: i32 loc("<stdin>":68:10)):
      "omp.terminator"() : () -> () loc("<stdin>":69:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":67:5)
    %19 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":71:11)
    "omp.canonical_loop"(%arg26, %19) ({
    ^bb0(%arg27: i32 loc("<stdin>":73:10)):
      "omp.terminator"() : () -> () loc("<stdin>":74:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":72:5)
    "func.return"() : () -> () loc("<stdin>":76:5)
  }) : () -> () loc("<stdin>":59:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_2d_nested_pretty"}> ({
  ^bb0(%arg23: i32 loc("<stdin>":79:8)):
    %15 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":80:11)
    %16 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":81:11)
    "omp.canonical_loop"(%arg23, %15) ({
    ^bb0(%arg24: i32 loc("<stdin>":83:10)):
      "omp.canonical_loop"(%arg23, %16) ({
      ^bb0(%arg25: i32 loc("<stdin>":85:12)):
        "omp.terminator"() : () -> () loc("<stdin>":86:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":84:7)
      "omp.terminator"() : () -> () loc("<stdin>":88:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":82:5)
    "func.return"() : () -> () loc("<stdin>":90:5)
  }) : () -> () loc("<stdin>":78:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_3d_nested_pretty"}> ({
  ^bb0(%arg19: i32 loc("<stdin>":93:8)):
    %12 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":94:11)
    %13 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":95:11)
    %14 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":96:11)
    "omp.canonical_loop"(%arg19, %12) ({
    ^bb0(%arg20: i32 loc("<stdin>":98:10)):
      "omp.canonical_loop"(%arg19, %13) ({
      ^bb0(%arg21: i32 loc("<stdin>":100:12)):
        "omp.canonical_loop"(%arg19, %14) ({
        ^bb0(%arg22: i32 loc("<stdin>":102:14)):
          "omp.terminator"() : () -> () loc("<stdin>":103:11)
        }) : (i32, !omp.cli) -> () loc("<stdin>":101:9)
        "omp.terminator"() : () -> () loc("<stdin>":105:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":99:7)
      "omp.terminator"() : () -> () loc("<stdin>":107:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":97:5)
    "func.return"() : () -> () loc("<stdin>":109:5)
  }) : () -> () loc("<stdin>":92:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "omp_canonloop_sequential_nested_pretty"}> ({
  ^bb0(%arg14: i32 loc("<stdin>":112:8)):
    %8 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":113:10)
    %9 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":114:10)
    "omp.canonical_loop"(%arg14, %8) ({
    ^bb0(%arg17: i32 loc("<stdin>":116:10)):
      "omp.canonical_loop"(%arg14, %9) ({
      ^bb0(%arg18: i32 loc("<stdin>":118:12)):
        "omp.terminator"() : () -> () loc("<stdin>":119:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":117:7)
      "omp.terminator"() : () -> () loc("<stdin>":121:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":115:5)
    %10 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":123:11)
    %11 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":124:11)
    "omp.canonical_loop"(%arg14, %10) ({
    ^bb0(%arg15: i32 loc("<stdin>":126:10)):
      "omp.canonical_loop"(%arg14, %11) ({
      ^bb0(%arg16: i32 loc("<stdin>":128:12)):
        "omp.terminator"() : () -> () loc("<stdin>":129:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":127:7)
      "omp.terminator"() : () -> () loc("<stdin>":131:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":125:5)
    "func.return"() : () -> () loc("<stdin>":133:5)
  }) : () -> () loc("<stdin>":111:3)
  "func.func"() <{function_type = () -> (), sym_name = "omp_newcli_unused"}> ({
    %7 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":136:10)
    "func.return"() : () -> () loc("<stdin>":137:5)
  }) : () -> () loc("<stdin>":135:3)
  "func.func"() <{function_type = () -> (), sym_name = "omp_canonloop_multiregion_isolatedfromabove"}> ({
    "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "x.privatizer", type = !llvm.ptr}> ({
    ^bb0(%arg11: !llvm.ptr loc("<stdin>":141:10), %arg12: !llvm.ptr loc("<stdin>":141:29)):
      %6 = "arith.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":142:12)
      "omp.canonical_loop"(%6) ({
      ^bb0(%arg13: i32 loc("<stdin>":144:12)):
        "omp.terminator"() : () -> () loc("<stdin>":145:9)
      }) : (i32) -> () loc("<stdin>":143:7)
      "omp.yield"(%arg11) : (!llvm.ptr) -> () loc("<stdin>":147:7)
    }, {
    ^bb0(%arg7: !llvm.ptr loc("<stdin>":149:10), %arg8: !llvm.ptr loc("<stdin>":149:28)):
      %5 = "arith.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":150:12)
      "omp.canonical_loop"(%5) ({
      ^bb0(%arg9: i32 loc("<stdin>":152:12)):
        "omp.canonical_loop"(%5) ({
        ^bb0(%arg10: i32 loc("<stdin>":154:14)):
          "omp.terminator"() : () -> () loc("<stdin>":155:11)
        }) : (i32) -> () loc("<stdin>":153:9)
        "omp.terminator"() : () -> () loc("<stdin>":157:9)
      }) : (i32) -> () loc("<stdin>":151:7)
      "omp.yield"(%arg7) : (!llvm.ptr) -> () loc("<stdin>":159:7)
    }, {
    ^bb0(%arg4: !llvm.ptr loc("<stdin>":161:10)):
      %4 = "arith.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":162:12)
      "omp.canonical_loop"(%4) ({
      ^bb0(%arg6: i32 loc("<stdin>":164:12)):
        "omp.terminator"() : () -> () loc("<stdin>":165:9)
      }) : (i32) -> () loc("<stdin>":163:7)
      "omp.canonical_loop"(%4) ({
      ^bb0(%arg5: i32 loc("<stdin>":168:12)):
        "omp.terminator"() : () -> () loc("<stdin>":169:9)
      }) : (i32) -> () loc("<stdin>":167:7)
      "omp.yield"() : () -> () loc("<stdin>":171:7)
    }) : () -> () loc("<stdin>":140:5)
    "func.return"() : () -> () loc("<stdin>":173:5)
  }) : () -> () loc("<stdin>":139:3)
  "func.func"() <{function_type = (i1) -> (), sym_name = "omp_canonloop_multiregion"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":176:8)):
    %0 = "arith.constant"() <{value = 42 : i32}> : () -> i32 loc("<stdin>":177:10)
    %1 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":178:10)
    %2 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":179:10)
    %3 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":180:10)
    "scf.if"(%arg0) ({
      "omp.canonical_loop"(%0, %1) ({
      ^bb0(%arg3: i32 loc("<stdin>":183:12)):
        "omp.terminator"() : () -> () loc("<stdin>":184:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":182:7)
      "scf.yield"() : () -> () loc("<stdin>":186:7)
    }, {
      "omp.canonical_loop"(%0, %2) ({
      ^bb0(%arg2: i32 loc("<stdin>":189:12)):
        "omp.terminator"() : () -> () loc("<stdin>":190:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":188:7)
      "omp.canonical_loop"(%0, %3) ({
      ^bb0(%arg1: i32 loc("<stdin>":193:12)):
        "omp.terminator"() : () -> () loc("<stdin>":194:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":192:7)
      "scf.yield"() : () -> () loc("<stdin>":196:7)
    }) : (i1) -> () loc("<stdin>":181:5)
    "func.return"() : () -> () loc("<stdin>":198:5)
  }) : () -> () loc("<stdin>":175:3)
}) : () -> () loc("<stdin>":1:1)
