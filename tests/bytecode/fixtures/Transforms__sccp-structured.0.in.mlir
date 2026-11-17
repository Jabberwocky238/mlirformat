"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "simple"}> ({
  ^bb0(%arg35: i32 loc("<stdin>":6:8)):
    %45 = "arith.constant"() <{value = true}> : () -> i1 loc("<stdin>":7:11)
    %46 = "scf.if"(%45) ({
      %47 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":9:13)
      "scf.yield"(%47) : (i32) -> () loc("<stdin>":10:7)
    }, {
      "scf.yield"(%arg35) : (i32) -> () loc("<stdin>":12:7)
    }) : (i1) -> i32 loc("<stdin>":8:11)
    "func.return"(%46) : (i32) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (i1) -> i32, sym_name = "simple_both_same"}> ({
  ^bb0(%arg34: i1 loc("<stdin>":17:8)):
    %42 = "scf.if"(%arg34) ({
      %44 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":19:13)
      "scf.yield"(%44) : (i32) -> () loc("<stdin>":20:7)
    }, {
      %43 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":22:13)
      "scf.yield"(%43) : (i32) -> () loc("<stdin>":23:7)
    }) : (i1) -> i32 loc("<stdin>":18:11)
    "func.return"(%42) : (i32) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (i1, i32) -> i32, sym_name = "overdefined_unknown_condition"}> ({
  ^bb0(%arg32: i1 loc("<stdin>":28:8), %arg33: i32 loc("<stdin>":28:20)):
    %40 = "scf.if"(%arg32) ({
      %41 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":30:13)
      "scf.yield"(%41) : (i32) -> () loc("<stdin>":31:7)
    }, {
      "scf.yield"(%arg33) : (i32) -> () loc("<stdin>":33:7)
    }) : (i1) -> i32 loc("<stdin>":29:11)
    "func.return"(%40) : (i32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (i1) -> i32, sym_name = "overdefined_different_constants"}> ({
  ^bb0(%arg31: i1 loc("<stdin>":38:8)):
    %37 = "scf.if"(%arg31) ({
      %39 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":40:13)
      "scf.yield"(%39) : (i32) -> () loc("<stdin>":41:7)
    }, {
      %38 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":43:13)
      "scf.yield"(%38) : (i32) -> () loc("<stdin>":44:7)
    }) : (i1) -> i32 loc("<stdin>":39:11)
    "func.return"(%37) : (i32) -> () loc("<stdin>":46:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (index, index, index) -> i32, sym_name = "simple_loop"}> ({
  ^bb0(%arg26: index loc("<stdin>":49:8), %arg27: index loc("<stdin>":49:23), %arg28: index loc("<stdin>":49:38)):
    %34 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":50:11)
    %35 = "scf.for"(%arg26, %arg27, %arg28, %34) ({
    ^bb0(%arg29: index loc("<stdin>":52:10), %arg30: i32 loc("<stdin>":52:25)):
      %36 = "arith.addi"(%arg30, %arg30) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":53:13)
      "scf.yield"(%36) : (i32) -> () loc("<stdin>":54:7)
    }) : (index, index, index, i32) -> i32 loc("<stdin>":51:11)
    "func.return"(%35) : (i32) -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":48:3)
  "func.func"() <{function_type = (index, index, index) -> i32, sym_name = "loop_overdefined"}> ({
  ^bb0(%arg21: index loc("<stdin>":59:8), %arg22: index loc("<stdin>":59:23), %arg23: index loc("<stdin>":59:38)):
    %31 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":60:11)
    %32 = "scf.for"(%arg21, %arg22, %arg23, %31) ({
    ^bb0(%arg24: index loc("<stdin>":62:10), %arg25: i32 loc("<stdin>":62:25)):
      %33 = "arith.addi"(%arg25, %arg25) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":63:13)
      "scf.yield"(%33) : (i32) -> () loc("<stdin>":64:7)
    }) : (index, index, index, i32) -> i32 loc("<stdin>":61:11)
    "func.return"(%32) : (i32) -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":58:3)
  "func.func"() <{function_type = (index, index, index) -> i32, sym_name = "loop_inner_control_flow"}> ({
  ^bb0(%arg16: index loc("<stdin>":69:8), %arg17: index loc("<stdin>":69:23), %arg18: index loc("<stdin>":69:38)):
    %24 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":70:11)
    %25 = "scf.for"(%arg16, %arg17, %arg18, %24) ({
    ^bb0(%arg19: index loc("<stdin>":72:10), %arg20: i32 loc("<stdin>":72:25)):
      %26 = "arith.constant"() <{value = 20 : i32}> : () -> i32 loc("<stdin>":73:13)
      %27 = "arith.cmpi"(%arg20, %26) <{predicate = 6 : i64}> : (i32, i32) -> i1 loc("<stdin>":74:13)
      %28 = "scf.if"(%27) ({
        %30 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":76:15)
        "scf.yield"(%30) : (i32) -> () loc("<stdin>":77:9)
      }, {
        %29 = "arith.addi"(%arg20, %24) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":79:15)
        "scf.yield"(%29) : (i32) -> () loc("<stdin>":80:9)
      }) : (i1) -> i32 loc("<stdin>":75:13)
      "scf.yield"(%28) : (i32) -> () loc("<stdin>":82:7)
    }) : (index, index, index, i32) -> i32 loc("<stdin>":71:11)
    "func.return"(%25) : (i32) -> () loc("<stdin>":84:5)
  }) : () -> () loc("<stdin>":68:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "loop_region_branch_terminator_op"}> ({
  ^bb0(%arg13: i32 loc("<stdin>":87:8)):
    %21 = "arith.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":88:11)
    %22 = "scf.while"(%21) ({
    ^bb0(%arg15: i32 loc("<stdin>":90:10)):
      %23 = "arith.cmpi"(%arg13, %arg15) <{predicate = 4 : i64}> : (i32, i32) -> i1 loc("<stdin>":91:13)
      "scf.condition"(%23, %arg15) : (i1, i32) -> () loc("<stdin>":92:7)
    }, {
    ^bb0(%arg14: i32 loc("<stdin>":94:10)):
      "scf.yield"(%arg14) : (i32) -> () loc("<stdin>":95:7)
    }) : (i32) -> i32 loc("<stdin>":89:11)
    "func.return"() : () -> () loc("<stdin>":97:5)
  }) : () -> () loc("<stdin>":86:3)
  "func.func"() <{function_type = () -> i32, sym_name = "affine_loop_one_iter"}> ({
    %17 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":100:11)
    %18 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":101:11)
    %19 = "affine.for"(%17) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = affine_map<() -> (1)>}> ({
    ^bb0(%arg11: index loc("<stdin>":103:10), %arg12: i32 loc("<stdin>":103:25)):
      %20 = "arith.addi"(%arg12, %18) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":104:13)
      "affine.yield"(%20) : (i32) -> () loc("<stdin>":105:7)
    }) : (i32) -> i32 loc("<stdin>":102:11)
    "func.return"(%19) : (i32) -> () loc("<stdin>":107:5)
  }) : () -> () loc("<stdin>":99:3)
  "func.func"() <{function_type = () -> i32, sym_name = "affine_loop_zero_iter"}> ({
    %14 = "arith.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":110:11)
    %15 = "affine.for"(%14) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = affine_map<() -> (0)>}> ({
    ^bb0(%arg9: index loc("<stdin>":112:10), %arg10: i32 loc("<stdin>":112:24)):
      %16 = "arith.addi"(%arg10, %arg10) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":113:13)
      "affine.yield"(%16) : (i32) -> () loc("<stdin>":114:7)
    }) : (i32) -> i32 loc("<stdin>":111:11)
    "func.return"(%15) : (i32) -> () loc("<stdin>":116:5)
  }) : () -> () loc("<stdin>":109:3)
  "func.func"() <{function_type = (index) -> i32, sym_name = "affine_loop_unknown_trip_count"}> ({
  ^bb0(%arg6: index loc("<stdin>":119:8)):
    %11 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":120:11)
    %12 = "affine.for"(%arg6, %11) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 1>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg7: index loc("<stdin>":122:10), %arg8: i32 loc("<stdin>":122:24)):
      %13 = "arith.addi"(%arg8, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":123:13)
      "affine.yield"(%13) : (i32) -> () loc("<stdin>":124:7)
    }) : (index, i32) -> i32 loc("<stdin>":121:11)
    "func.return"(%12) : (i32) -> () loc("<stdin>":126:5)
  }) : () -> () loc("<stdin>":118:3)
  "func.func"() <{function_type = () -> index, sym_name = "while_loop_different_arg_count"}> ({
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":129:10)
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":130:10)
    %8 = "scf.while"(%6, %7) ({
    ^bb0(%arg4: index loc("<stdin>":132:10), %arg5: index loc("<stdin>":132:24)):
      %10 = "arith.cmpi"(%arg4, %7) <{predicate = 2 : i64}> : (index, index) -> i1 loc("<stdin>":133:13)
      "scf.condition"(%10, %arg5) : (i1, index) -> () loc("<stdin>":134:7)
    }, {
    ^bb0(%arg3: index loc("<stdin>":136:10)):
      %9 = "arith.muli"(%arg3, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":137:12)
      "scf.yield"(%6, %9) : (index, index) -> () loc("<stdin>":138:7)
    }) : (index, index) -> index loc("<stdin>":131:10)
    "func.return"(%8) : (index) -> () loc("<stdin>":140:5)
  }) : () -> () loc("<stdin>":128:3)
  "func.func"() <{function_type = (index) -> index, sym_name = "while_loop_false_condition"}> ({
  ^bb0(%arg0: index loc("<stdin>":143:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":144:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":145:10)
    %2 = "arith.muli"(%arg0, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":146:10)
    %3 = "scf.while"(%2) ({
    ^bb0(%arg2: index loc("<stdin>":148:10)):
      %5 = "arith.cmpi"(%arg2, %0) <{predicate = 2 : i64}> : (index, index) -> i1 loc("<stdin>":149:12)
      "scf.condition"(%5, %arg2) : (i1, index) -> () loc("<stdin>":150:7)
    }, {
    ^bb0(%arg1: index loc("<stdin>":152:10)):
      %4 = "arith.addi"(%arg1, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":153:12)
      "scf.yield"(%4) : (index) -> () loc("<stdin>":154:7)
    }) : (index) -> index loc("<stdin>":147:10)
    "func.return"(%3) : (index) -> () loc("<stdin>":156:5)
  }) : () -> () loc("<stdin>":142:3)
}) : () -> () loc("<stdin>":4:1)
