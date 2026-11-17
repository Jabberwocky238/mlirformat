"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index, index, index, index) -> (), sym_name = "transfer_read_3d"}> ({
  ^bb0(%arg29: memref<?x?x?x?xf32> loc("<stdin>":7:8), %arg30: index loc("<stdin>":7:37), %arg31: index loc("<stdin>":7:52), %arg32: index loc("<stdin>":7:67), %arg33: index loc("<stdin>":7:82)):
    %33 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":8:11)
    %34 = "vector.transfer_read"(%arg29, %arg30, %arg31, %arg32, %arg33, %33) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<2x5x3xf32> loc("<stdin>":9:11)
    "vector.print"(%34) <{punctuation = #vector.punctuation<newline>}> : (vector<2x5x3xf32>) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index, index, index, index) -> (), sym_name = "transfer_read_3d_and_extract"}> ({
  ^bb0(%arg24: memref<?x?x?x?xf32> loc("<stdin>":14:8), %arg25: index loc("<stdin>":14:37), %arg26: index loc("<stdin>":14:52), %arg27: index loc("<stdin>":14:67), %arg28: index loc("<stdin>":14:82)):
    %30 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":15:11)
    %31 = "vector.transfer_read"(%arg24, %arg25, %arg26, %arg27, %arg28, %30) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<2x5x3xf32> loc("<stdin>":16:11)
    %32 = "vector.extract"(%31) <{static_position = array<i64: 0>}> : (vector<2x5x3xf32>) -> vector<5x3xf32> loc("<stdin>":17:11)
    "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (vector<5x3xf32>) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index, index, index, index) -> (), sym_name = "transfer_read_3d_broadcast"}> ({
  ^bb0(%arg19: memref<?x?x?x?xf32> loc("<stdin>":22:8), %arg20: index loc("<stdin>":22:37), %arg21: index loc("<stdin>":22:52), %arg22: index loc("<stdin>":22:67), %arg23: index loc("<stdin>":22:82)):
    %28 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":23:11)
    %29 = "vector.transfer_read"(%arg19, %arg20, %arg21, %arg22, %arg23, %28) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, 0, d3)>}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<2x5x3xf32> loc("<stdin>":24:11)
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<2x5x3xf32>) -> () loc("<stdin>":25:5)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index, index, index, index) -> (), sym_name = "transfer_read_3d_mask_broadcast"}> ({
  ^bb0(%arg14: memref<?x?x?x?xf32> loc("<stdin>":29:8), %arg15: index loc("<stdin>":29:37), %arg16: index loc("<stdin>":29:52), %arg17: index loc("<stdin>":29:67), %arg18: index loc("<stdin>":29:82)):
    %25 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":30:11)
    %26 = "arith.constant"() <{value = dense<[false, true]> : vector<2xi1>}> : () -> vector<2xi1> loc("<stdin>":31:11)
    %27 = "vector.transfer_read"(%arg14, %arg15, %arg16, %arg17, %arg18, %25, %26) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 1>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, 0, 0)>}> : (memref<?x?x?x?xf32>, index, index, index, index, f32, vector<2xi1>) -> vector<2x5x3xf32> loc("<stdin>":32:11)
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (vector<2x5x3xf32>) -> () loc("<stdin>":33:5)
    "func.return"() : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index, index, index, index) -> (), sym_name = "transfer_read_3d_transposed"}> ({
  ^bb0(%arg9: memref<?x?x?x?xf32> loc("<stdin>":37:8), %arg10: index loc("<stdin>":37:36), %arg11: index loc("<stdin>":37:51), %arg12: index loc("<stdin>":37:66), %arg13: index loc("<stdin>":37:81)):
    %23 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":38:11)
    %24 = "vector.transfer_read"(%arg9, %arg10, %arg11, %arg12, %arg13, %23) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 4, 1, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d3, d0, d1)>}> : (memref<?x?x?x?xf32>, index, index, index, index, f32) -> vector<3x5x3xf32> loc("<stdin>":39:11)
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<3x5x3xf32>) -> () loc("<stdin>":40:5)
    "func.return"() : () -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, index, index, index, index) -> (), sym_name = "transfer_write_3d"}> ({
  ^bb0(%arg4: memref<?x?x?x?xf32> loc("<stdin>":44:8), %arg5: index loc("<stdin>":44:36), %arg6: index loc("<stdin>":44:50), %arg7: index loc("<stdin>":44:64), %arg8: index loc("<stdin>":44:78)):
    %21 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32 loc("<stdin>":45:11)
    %22 = "vector.broadcast"(%21) : (f32) -> vector<2x9x3xf32> loc("<stdin>":46:11)
    "vector.transfer_write"(%22, %arg4, %arg5, %arg6, %arg7, %arg8) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 1, 4, 0>, permutation_map = affine_map<(d0, d1, d2, d3) -> (d1, d2, d3)>}> : (vector<2x9x3xf32>, memref<?x?x?x?xf32>, index, index, index, index) -> () loc("<stdin>":47:5)
    "func.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":51:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":52:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":53:10)
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":54:10)
    %4 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":55:10)
    %5 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32 loc("<stdin>":56:10)
    %6 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":57:10)
    %7 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":58:10)
    %8 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":59:10)
    %9 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":60:10)
    %10 = "memref.alloc"(%9, %6, %7, %8) <{operandSegmentSizes = array<i32: 4, 0>}> : (index, index, index, index) -> memref<?x?x?x?xf32> loc("<stdin>":61:11)
    "scf.for"(%0, %9, %1) ({
    ^bb0(%arg0: index loc("<stdin>":63:10)):
      "scf.for"(%0, %6, %1) ({
      ^bb0(%arg1: index loc("<stdin>":65:12)):
        %11 = "arith.index_cast"(%arg1) : (index) -> i32 loc("<stdin>":66:15)
        %12 = "arith.sitofp"(%11) : (i32) -> f32 loc("<stdin>":67:15)
        %13 = "arith.mulf"(%12, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":68:15)
        "scf.for"(%0, %7, %1) ({
        ^bb0(%arg2: index loc("<stdin>":70:14)):
          %14 = "arith.index_cast"(%arg2) : (index) -> i32 loc("<stdin>":71:17)
          %15 = "arith.sitofp"(%14) : (i32) -> f32 loc("<stdin>":72:17)
          %16 = "arith.addf"(%13, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":73:17)
          "scf.for"(%0, %8, %1) ({
          ^bb0(%arg3: index loc("<stdin>":75:16)):
            %17 = "arith.index_cast"(%arg3) : (index) -> i32 loc("<stdin>":76:19)
            %18 = "arith.sitofp"(%17) : (i32) -> f32 loc("<stdin>":77:19)
            %19 = "arith.addf"(%4, %18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":78:19)
            %20 = "arith.mulf"(%16, %19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":79:19)
            "memref.store"(%20, %10, %arg0, %arg1, %arg2, %arg3) : (f32, memref<?x?x?x?xf32>, index, index, index, index) -> () loc("<stdin>":80:13)
            "scf.yield"() : () -> () loc("<stdin>":81:13)
          }) : (index, index, index) -> () loc("<stdin>":74:11)
          "scf.yield"() : () -> () loc("<stdin>":83:11)
        }) : (index, index, index) -> () loc("<stdin>":69:9)
        "scf.yield"() : () -> () loc("<stdin>":85:9)
      }) : (index, index, index) -> () loc("<stdin>":64:7)
      "scf.yield"() : () -> () loc("<stdin>":87:7)
    }) : (index, index, index) -> () loc("<stdin>":62:5)
    "func.call"(%10, %0, %0, %0, %0) <{callee = @transfer_read_3d}> : (memref<?x?x?x?xf32>, index, index, index, index) -> () loc("<stdin>":89:5)
    "func.call"(%10, %0, %0, %0, %0) <{callee = @transfer_read_3d_and_extract}> : (memref<?x?x?x?xf32>, index, index, index, index) -> () loc("<stdin>":90:5)
    "func.call"(%10, %0, %0, %1, %1) <{callee = @transfer_write_3d}> : (memref<?x?x?x?xf32>, index, index, index, index) -> () loc("<stdin>":91:5)
    "func.call"(%10, %0, %0, %0, %0) <{callee = @transfer_read_3d}> : (memref<?x?x?x?xf32>, index, index, index, index) -> () loc("<stdin>":92:5)
    "func.call"(%10, %0, %0, %0, %0) <{callee = @transfer_read_3d_transposed}> : (memref<?x?x?x?xf32>, index, index, index, index) -> () loc("<stdin>":93:5)
    "func.call"(%10, %0, %0, %0, %0) <{callee = @transfer_read_3d_broadcast}> : (memref<?x?x?x?xf32>, index, index, index, index) -> () loc("<stdin>":94:5)
    "func.call"(%10, %0, %0, %0, %0) <{callee = @transfer_read_3d_mask_broadcast}> : (memref<?x?x?x?xf32>, index, index, index, index) -> () loc("<stdin>":95:5)
    "memref.dealloc"(%10) : (memref<?x?x?x?xf32>) -> () loc("<stdin>":96:5)
    "func.return"() : () -> () loc("<stdin>":97:5)
  }) : () -> () loc("<stdin>":50:3)
}) : () -> () loc("<stdin>":5:1)
