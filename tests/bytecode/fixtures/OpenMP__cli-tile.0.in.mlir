"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_tile_raw"}> ({
  ^bb0(%arg27: i32 loc("<stdin>":3:8), %arg28: i32 loc("<stdin>":3:21)):
    %40 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":4:11)
    %41 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":5:11)
    %42 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":6:11)
    "omp.canonical_loop"(%arg27, %40) ({
    ^bb0(%arg29: i32 loc("<stdin>":8:10)):
      "omp.terminator"() : () -> () loc("<stdin>":9:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":7:5)
    "omp.tile"(%41, %42, %40, %arg28) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_tile_pretty"}> ({
  ^bb0(%arg24: i32 loc("<stdin>":15:8), %arg25: i32 loc("<stdin>":15:21)):
    %37 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":16:11)
    %38 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":17:11)
    %39 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":18:11)
    "omp.canonical_loop"(%arg24, %37) ({
    ^bb0(%arg26: i32 loc("<stdin>":20:10)):
      "omp.terminator"() : () -> () loc("<stdin>":21:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":19:5)
    "omp.tile"(%38, %39, %37, %arg25) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_tile_optionalgen_pretty"}> ({
  ^bb0(%arg21: i32 loc("<stdin>":27:8), %arg22: i32 loc("<stdin>":27:21)):
    %36 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":28:11)
    "omp.canonical_loop"(%arg21, %36) ({
    ^bb0(%arg23: i32 loc("<stdin>":30:10)):
      "omp.terminator"() : () -> () loc("<stdin>":31:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":29:5)
    "omp.tile"(%36, %arg22) <{operandSegmentSizes = array<i32: 0, 1, 1>}> : (!omp.cli, i32) -> () loc("<stdin>":33:5)
    "func.return"() : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (), sym_name = "omp_tile_2d_pretty"}> ({
  ^bb0(%arg15: i32 loc("<stdin>":37:8), %arg16: i32 loc("<stdin>":37:21), %arg17: i32 loc("<stdin>":37:34), %arg18: i32 loc("<stdin>":37:47)):
    %30 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":38:11)
    %31 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":39:11)
    %32 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":40:11)
    %33 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":41:11)
    %34 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":42:11)
    %35 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":43:11)
    "omp.canonical_loop"(%arg15, %30) ({
    ^bb0(%arg19: i32 loc("<stdin>":45:10)):
      "omp.canonical_loop"(%arg16, %31) ({
      ^bb0(%arg20: i32 loc("<stdin>":47:12)):
        "omp.terminator"() : () -> () loc("<stdin>":48:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":46:7)
      "omp.terminator"() : () -> () loc("<stdin>":50:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":44:5)
    "omp.tile"(%32, %33, %34, %35, %30, %31, %arg17, %arg18) <{operandSegmentSizes = array<i32: 4, 2, 2>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, i32, i32) -> () loc("<stdin>":52:5)
    "func.return"() : () -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "omp_tile_3d_pretty"}> ({
  ^bb0(%arg10: i32 loc("<stdin>":56:8), %arg11: i32 loc("<stdin>":56:21)):
    %21 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":57:11)
    %22 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":58:11)
    %23 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":59:11)
    %24 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":60:11)
    %25 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":61:11)
    %26 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":62:11)
    %27 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":63:11)
    %28 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":64:11)
    %29 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":65:11)
    "omp.canonical_loop"(%arg10, %21) ({
    ^bb0(%arg12: i32 loc("<stdin>":67:10)):
      "omp.canonical_loop"(%arg10, %22) ({
      ^bb0(%arg13: i32 loc("<stdin>":69:12)):
        "omp.canonical_loop"(%arg10, %23) ({
        ^bb0(%arg14: i32 loc("<stdin>":71:14)):
          "omp.terminator"() : () -> () loc("<stdin>":72:11)
        }) : (i32, !omp.cli) -> () loc("<stdin>":70:9)
        "omp.terminator"() : () -> () loc("<stdin>":74:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":68:7)
      "omp.terminator"() : () -> () loc("<stdin>":76:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":66:5)
    "omp.tile"(%24, %25, %26, %27, %28, %29, %21, %22, %23, %arg11, %arg11, %arg11) <{operandSegmentSizes = array<i32: 6, 3, 3>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, i32, i32, i32) -> () loc("<stdin>":78:5)
    "func.return"() : () -> () loc("<stdin>":79:5)
  }) : () -> () loc("<stdin>":55:3)
  "func.func"() <{function_type = (i32, i32, i32, i32) -> (), sym_name = "omp_tile_composition"}> ({
  ^bb0(%arg5: i32 loc("<stdin>":82:8), %arg6: i32 loc("<stdin>":82:20), %arg7: i32 loc("<stdin>":82:32), %arg8: i32 loc("<stdin>":82:44)):
    %14 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":83:11)
    %15 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":84:11)
    %16 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":85:11)
    %17 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":86:11)
    %18 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":87:11)
    %19 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":88:11)
    %20 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":89:11)
    "omp.canonical_loop"(%arg5, %14) ({
    ^bb0(%arg9: i32 loc("<stdin>":91:10)):
      "omp.terminator"() : () -> () loc("<stdin>":92:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":90:5)
    "omp.tile"(%15, %16, %14, %arg6) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> () loc("<stdin>":94:5)
    "omp.tile"(%18, %17, %15, %arg7) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> () loc("<stdin>":95:5)
    "omp.tile"(%19, %20, %16, %arg8) <{operandSegmentSizes = array<i32: 2, 1, 1>}> : (!omp.cli, !omp.cli, !omp.cli, i32) -> () loc("<stdin>":96:5)
    "func.return"() : () -> () loc("<stdin>":97:5)
  }) : () -> () loc("<stdin>":81:3)
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "omp_tile_2d_composition"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":100:8), %arg1: i32 loc("<stdin>":100:20), %arg2: i32 loc("<stdin>":100:32)):
    %0 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":101:10)
    %1 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":102:10)
    %2 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":103:10)
    %3 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":104:10)
    %4 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":105:10)
    %5 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":106:10)
    %6 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":107:10)
    %7 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":108:10)
    %8 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":109:10)
    %9 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":110:10)
    %10 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":111:11)
    %11 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":112:11)
    %12 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":113:11)
    %13 = "omp.new_cli"() : () -> !omp.cli loc("<stdin>":114:11)
    "omp.canonical_loop"(%arg0, %0) ({
    ^bb0(%arg3: i32 loc("<stdin>":116:10)):
      "omp.canonical_loop"(%arg1, %1) ({
      ^bb0(%arg4: i32 loc("<stdin>":118:12)):
        "omp.terminator"() : () -> () loc("<stdin>":119:9)
      }) : (i32, !omp.cli) -> () loc("<stdin>":117:7)
      "omp.terminator"() : () -> () loc("<stdin>":121:7)
    }) : (i32, !omp.cli) -> () loc("<stdin>":115:5)
    "omp.tile"(%2, %3, %4, %5, %0, %1, %arg2, %arg2) <{operandSegmentSizes = array<i32: 4, 2, 2>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, i32, i32) -> () loc("<stdin>":123:5)
    "omp.tile"(%6, %7, %8, %9, %2, %3, %arg2, %arg2) <{operandSegmentSizes = array<i32: 4, 2, 2>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, i32, i32) -> () loc("<stdin>":124:5)
    "omp.tile"(%10, %11, %12, %13, %5, %4, %arg2, %arg2) <{operandSegmentSizes = array<i32: 4, 2, 2>}> : (!omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, !omp.cli, i32, i32) -> () loc("<stdin>":125:5)
    "func.return"() : () -> () loc("<stdin>":126:5)
  }) : () -> () loc("<stdin>":99:3)
}) : () -> () loc("<stdin>":1:1)
