"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> f16, sym_name = "compute_linspace_val"}> ({
  ^bb0(%arg31: index loc("<stdin>":6:8), %arg32: index loc("<stdin>":6:23), %arg33: index loc("<stdin>":6:38)):
    %44 = "arith.index_cast"(%arg31) : (index) -> i32 loc("<stdin>":7:11)
    %45 = "arith.index_cast"(%arg32) : (index) -> i32 loc("<stdin>":8:11)
    %46 = "arith.index_cast"(%arg33) : (index) -> i32 loc("<stdin>":9:11)
    %47 = "arith.muli"(%44, %46) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":10:11)
    %48 = "arith.addi"(%45, %47) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":11:11)
    %49 = "arith.sitofp"(%48) : (i32) -> f16 loc("<stdin>":12:11)
    %50 = "arith.constant"() <{value = 6.400000e+01 : f16}> : () -> f16 loc("<stdin>":13:11)
    %51 = "arith.divf"(%49, %50) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16 loc("<stdin>":14:11)
    "func.return"(%51) : (f16) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (memref<16x16xf16>) -> (), sym_name = "print_lhs_as_memref_32"}> ({
  ^bb0(%arg28: memref<16x16xf16> loc("<stdin>":18:8)):
    %36 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":19:11)
    %37 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":20:11)
    %38 = "memref.dim"(%arg28, %36) : (memref<16x16xf16>, index) -> index loc("<stdin>":21:11)
    %39 = "memref.dim"(%arg28, %37) : (memref<16x16xf16>, index) -> index loc("<stdin>":22:11)
    %40 = "memref.alloc"(%38, %39) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":23:11)
    "scf.for"(%36, %38, %37) ({
    ^bb0(%arg29: index loc("<stdin>":25:10)):
      "scf.for"(%36, %39, %37) ({
      ^bb0(%arg30: index loc("<stdin>":27:12)):
        %42 = "memref.load"(%arg28, %arg29, %arg30) : (memref<16x16xf16>, index, index) -> f16 loc("<stdin>":28:15)
        %43 = "arith.extf"(%42) : (f16) -> f32 loc("<stdin>":29:15)
        "memref.store"(%43, %40, %arg29, %arg30) : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":30:9)
        "scf.yield"() : () -> () loc("<stdin>":31:9)
      }) : (index, index, index) -> () loc("<stdin>":26:7)
      "scf.yield"() : () -> () loc("<stdin>":33:7)
    }) : (index, index, index) -> () loc("<stdin>":24:5)
    %41 = "memref.cast"(%40) : (memref<?x?xf32>) -> memref<*xf32> loc("<stdin>":35:11)
    "func.call"(%41) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":36:5)
    "memref.dealloc"(%40) : (memref<?x?xf32>) -> () loc("<stdin>":37:5)
    "func.return"() : () -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (memref<16x8xf16>) -> (), sym_name = "print_rhs_as_memref_32"}> ({
  ^bb0(%arg25: memref<16x8xf16> loc("<stdin>":41:8)):
    %28 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":42:11)
    %29 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":43:11)
    %30 = "memref.dim"(%arg25, %28) : (memref<16x8xf16>, index) -> index loc("<stdin>":44:11)
    %31 = "memref.dim"(%arg25, %29) : (memref<16x8xf16>, index) -> index loc("<stdin>":45:11)
    %32 = "memref.alloc"(%30, %31) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":46:11)
    "scf.for"(%28, %30, %29) ({
    ^bb0(%arg26: index loc("<stdin>":48:10)):
      "scf.for"(%28, %31, %29) ({
      ^bb0(%arg27: index loc("<stdin>":50:12)):
        %34 = "memref.load"(%arg25, %arg26, %arg27) : (memref<16x8xf16>, index, index) -> f16 loc("<stdin>":51:15)
        %35 = "arith.extf"(%34) : (f16) -> f32 loc("<stdin>":52:15)
        "memref.store"(%35, %32, %arg26, %arg27) : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":53:9)
        "scf.yield"() : () -> () loc("<stdin>":54:9)
      }) : (index, index, index) -> () loc("<stdin>":49:7)
      "scf.yield"() : () -> () loc("<stdin>":56:7)
    }) : (index, index, index) -> () loc("<stdin>":47:5)
    %33 = "memref.cast"(%32) : (memref<?x?xf32>) -> memref<*xf32> loc("<stdin>":58:11)
    "func.call"(%33) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":59:5)
    "memref.dealloc"(%32) : (memref<?x?xf32>) -> () loc("<stdin>":60:5)
    "func.return"() : () -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":40:3)
  "func.func"() <{function_type = (memref<16x8xf16>) -> (), sym_name = "print_res_as_memref_32"}> ({
  ^bb0(%arg22: memref<16x8xf16> loc("<stdin>":64:8)):
    %20 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":65:11)
    %21 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":66:11)
    %22 = "memref.dim"(%arg22, %20) : (memref<16x8xf16>, index) -> index loc("<stdin>":67:11)
    %23 = "memref.dim"(%arg22, %21) : (memref<16x8xf16>, index) -> index loc("<stdin>":68:11)
    %24 = "memref.alloc"(%22, %23) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":69:11)
    "scf.for"(%20, %22, %21) ({
    ^bb0(%arg23: index loc("<stdin>":71:10)):
      "scf.for"(%20, %23, %21) ({
      ^bb0(%arg24: index loc("<stdin>":73:12)):
        %26 = "memref.load"(%arg22, %arg23, %arg24) : (memref<16x8xf16>, index, index) -> f16 loc("<stdin>":74:15)
        %27 = "arith.extf"(%26) : (f16) -> f32 loc("<stdin>":75:15)
        "memref.store"(%27, %24, %arg23, %arg24) : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":76:9)
        "scf.yield"() : () -> () loc("<stdin>":77:9)
      }) : (index, index, index) -> () loc("<stdin>":72:7)
      "scf.yield"() : () -> () loc("<stdin>":79:7)
    }) : (index, index, index) -> () loc("<stdin>":70:5)
    %25 = "memref.cast"(%24) : (memref<?x?xf32>) -> memref<*xf32> loc("<stdin>":81:11)
    "func.call"(%25) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":82:5)
    "memref.dealloc"(%24) : (memref<?x?xf32>) -> () loc("<stdin>":83:5)
    "func.return"() : () -> () loc("<stdin>":84:5)
  }) : () -> () loc("<stdin>":63:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x16xf16> loc("<stdin>":87:10)
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x8xf16> loc("<stdin>":88:10)
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x8xf16> loc("<stdin>":89:10)
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":90:10)
    %5 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":91:10)
    %6 = "memref.dim"(%3, %4) : (memref<16x8xf16>, index) -> index loc("<stdin>":92:10)
    %7 = "memref.dim"(%3, %5) : (memref<16x8xf16>, index) -> index loc("<stdin>":93:10)
    %8 = "memref.dim"(%1, %5) : (memref<16x16xf16>, index) -> index loc("<stdin>":94:10)
    %9 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16 loc("<stdin>":95:10)
    %10 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16 loc("<stdin>":96:11)
    %11 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":97:11)
    "scf.for"(%4, %6, %5) ({
    ^bb0(%arg20: index loc("<stdin>":99:10)):
      "scf.for"(%4, %8, %5) ({
      ^bb0(%arg21: index loc("<stdin>":101:12)):
        %19 = "func.call"(%arg20, %arg21, %8) <{callee = @compute_linspace_val}> : (index, index, index) -> f16 loc("<stdin>":102:15)
        "memref.store"(%19, %1, %arg20, %arg21) : (f16, memref<16x16xf16>, index, index) -> () loc("<stdin>":103:9)
        "scf.yield"() : () -> () loc("<stdin>":104:9)
      }) : (index, index, index) -> () loc("<stdin>":100:7)
      "scf.yield"() : () -> () loc("<stdin>":106:7)
    }) : (index, index, index) -> () loc("<stdin>":98:5)
    "scf.for"(%4, %8, %5) ({
    ^bb0(%arg18: index loc("<stdin>":109:10)):
      "scf.for"(%4, %7, %5) ({
      ^bb0(%arg19: index loc("<stdin>":111:12)):
        %18 = "func.call"(%arg18, %arg19, %7) <{callee = @compute_linspace_val}> : (index, index, index) -> f16 loc("<stdin>":112:15)
        "memref.store"(%18, %2, %arg18, %arg19) : (f16, memref<16x8xf16>, index, index) -> () loc("<stdin>":113:9)
        "scf.yield"() : () -> () loc("<stdin>":114:9)
      }) : (index, index, index) -> () loc("<stdin>":110:7)
      "scf.yield"() : () -> () loc("<stdin>":116:7)
    }) : (index, index, index) -> () loc("<stdin>":108:5)
    "scf.for"(%4, %6, %5) ({
    ^bb0(%arg16: index loc("<stdin>":119:10)):
      "scf.for"(%4, %7, %5) ({
      ^bb0(%arg17: index loc("<stdin>":121:12)):
        %17 = "func.call"(%arg16, %arg17, %7) <{callee = @compute_linspace_val}> : (index, index, index) -> f16 loc("<stdin>":122:15)
        "memref.store"(%17, %3, %arg16, %arg17) : (f16, memref<16x8xf16>, index, index) -> () loc("<stdin>":123:9)
        "scf.yield"() : () -> () loc("<stdin>":124:9)
      }) : (index, index, index) -> () loc("<stdin>":120:7)
      "scf.yield"() : () -> () loc("<stdin>":126:7)
    }) : (index, index, index) -> () loc("<stdin>":118:5)
    %12 = "memref.cast"(%1) : (memref<16x16xf16>) -> memref<*xf16> loc("<stdin>":128:11)
    %13 = "memref.cast"(%2) : (memref<16x8xf16>) -> memref<*xf16> loc("<stdin>":129:11)
    %14 = "memref.cast"(%3) : (memref<16x8xf16>) -> memref<*xf16> loc("<stdin>":130:11)
    "gpu.host_register"(%12) : (memref<*xf16>) -> () loc("<stdin>":131:5)
    "gpu.host_register"(%13) : (memref<*xf16>) -> () loc("<stdin>":132:5)
    "gpu.host_register"(%14) : (memref<*xf16>) -> () loc("<stdin>":133:5)
    "func.call"(%1) <{callee = @print_lhs_as_memref_32}> : (memref<16x16xf16>) -> () loc("<stdin>":134:5)
    "func.call"(%2) <{callee = @print_rhs_as_memref_32}> : (memref<16x8xf16>) -> () loc("<stdin>":135:5)
    "func.call"(%3) <{callee = @print_res_as_memref_32}> : (memref<16x8xf16>) -> () loc("<stdin>":136:5)
    "gpu.launch"(%5, %5, %5, %11, %5, %5) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: index loc("<stdin>":138:10), %arg2: index loc("<stdin>":138:24), %arg3: index loc("<stdin>":138:38), %arg4: index loc("<stdin>":138:52), %arg5: index loc("<stdin>":138:66), %arg6: index loc("<stdin>":138:80), %arg7: index loc("<stdin>":138:94), %arg8: index loc("<stdin>":138:108), %arg9: index loc("<stdin>":138:122), %arg10: index loc("<stdin>":138:136), %arg11: index loc("<stdin>":138:151), %arg12: index loc("<stdin>":138:166)):
      "linalg.matmul"(%1, %2, %3) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg13: f16 loc("<stdin>":140:12), %arg14: f16 loc("<stdin>":140:25), %arg15: f16 loc("<stdin>":140:38)):
        %15 = "arith.mulf"(%arg13, %arg14) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16 loc("<stdin>":141:15)
        %16 = "arith.addf"(%arg15, %15) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16 loc("<stdin>":142:15)
        "linalg.yield"(%16) : (f16) -> () loc("<stdin>":143:9)
      }) : (memref<16x16xf16>, memref<16x8xf16>, memref<16x8xf16>) -> () loc("<stdin>":139:7)
      "gpu.terminator"() : () -> () loc("<stdin>":145:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":137:5)
    "func.call"(%3) <{callee = @print_res_as_memref_32}> : (memref<16x8xf16>) -> () loc("<stdin>":147:5)
    "func.return"() : () -> () loc("<stdin>":148:5)
  }) : () -> () loc("<stdin>":86:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":150:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":154:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":155:12)
      "transform.nvgpu.rewrite_matmul_as_mma_sync"(%0) : (!transform.any_op) -> () loc("<stdin>":156:7)
      "transform.yield"() : () -> () loc("<stdin>":157:7)
    }) : () -> () loc("<stdin>":153:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":152:3)
}) : () -> () loc("<stdin>":4:1)
