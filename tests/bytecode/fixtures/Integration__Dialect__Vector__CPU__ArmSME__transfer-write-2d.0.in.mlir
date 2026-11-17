"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_2d"}> ({
  ^bb0(%arg18: memref<?x?xf32> loc("<stdin>":5:8), %arg19: index loc("<stdin>":5:33), %arg20: index loc("<stdin>":5:48)):
    %27 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:11)
    %28 = "vector.broadcast"(%27) : (f32) -> vector<[4]x[4]xf32> loc("<stdin>":7:11)
    "vector.transfer_write"(%28, %arg18, %arg19, %arg20) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<[4]x[4]xf32>, memref<?x?xf32>, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_2d_mask"}> ({
  ^bb0(%arg15: memref<?x?xf32> loc("<stdin>":12:8), %arg16: index loc("<stdin>":12:33), %arg17: index loc("<stdin>":12:48)):
    %22 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":13:11)
    %23 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":14:11)
    %24 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":15:11)
    %25 = "vector.create_mask"(%23, %24) : (index, index) -> vector<[4]x[4]xi1> loc("<stdin>":16:11)
    %26 = "vector.broadcast"(%22) : (f32) -> vector<[4]x[4]xf32> loc("<stdin>":17:11)
    "vector.transfer_write"(%26, %arg15, %arg16, %arg17, %25) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<[4]x[4]xf32>, memref<?x?xf32>, index, index, vector<[4]x[4]xi1>) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_2d_transposed"}> ({
  ^bb0(%arg12: memref<?x?xf32> loc("<stdin>":22:8), %arg13: index loc("<stdin>":22:33), %arg14: index loc("<stdin>":22:48)):
    %21 = "vector.load"(%arg12, %arg13, %arg14) : (memref<?x?xf32>, index, index) -> vector<[4]x[4]xf32> loc("<stdin>":23:11)
    "vector.transfer_write"(%21, %arg12, %arg13, %arg14) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d1, d0)>}> : (vector<[4]x[4]xf32>, memref<?x?xf32>, index, index) -> () loc("<stdin>":24:5)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_write_2d_mask_transposed"}> ({
  ^bb0(%arg9: memref<?x?xf32> loc("<stdin>":28:8), %arg10: index loc("<stdin>":28:32), %arg11: index loc("<stdin>":28:47)):
    %17 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":29:11)
    %18 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":30:11)
    %19 = "vector.create_mask"(%18, %17) : (index, index) -> vector<[4]x[4]xi1> loc("<stdin>":31:11)
    %20 = "vector.load"(%arg9, %arg10, %arg11) : (memref<?x?xf32>, index, index) -> vector<[4]x[4]xf32> loc("<stdin>":32:11)
    "vector.transfer_write"(%20, %arg9, %arg10, %arg11, %19) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = affine_map<(d0, d1) -> (d1, d0)>}> : (vector<[4]x[4]xf32>, memref<?x?xf32>, index, index, vector<[4]x[4]xi1>) -> () loc("<stdin>":33:5)
    "func.return"() : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "load_and_print"}> ({
  ^bb0(%arg6: memref<?x?xf32> loc("<stdin>":37:8), %arg7: index loc("<stdin>":37:32), %arg8: index loc("<stdin>":37:46)):
    %16 = "vector.load"(%arg6, %arg7, %arg8) : (memref<?x?xf32>, index, index) -> vector<[4]x[4]xf32> loc("<stdin>":38:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> () loc("<stdin>":39:5)
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> () loc("<stdin>":40:5)
    "func.return"() : () -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":36:3)
  "func.func"() <{function_type = (index, index) -> memref<?x?xf32>, sym_name = "initialize_memory"}> ({
  ^bb0(%arg0: index loc("<stdin>":44:8), %arg1: index loc("<stdin>":44:22)):
    %6 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":45:10)
    %7 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":46:10)
    %8 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":47:10)
    %9 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32 loc("<stdin>":48:10)
    %10 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":49:11)
    %11 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":50:11)
    %12 = "scf.for"(%6, %arg0, %7, %11) ({
    ^bb0(%arg2: index loc("<stdin>":52:10), %arg3: f32 loc("<stdin>":52:24)):
      %13 = "scf.for"(%6, %arg1, %7, %arg3) ({
      ^bb0(%arg4: index loc("<stdin>":54:12), %arg5: f32 loc("<stdin>":54:26)):
        "memref.store"(%arg5, %10, %arg2, %arg4) : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":55:9)
        %15 = "arith.addf"(%arg5, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":56:15)
        "scf.yield"(%15) : (f32) -> () loc("<stdin>":57:9)
      }) : (index, index, index, f32) -> f32 loc("<stdin>":53:13)
      %14 = "arith.addf"(%arg3, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":59:13)
      "scf.yield"(%14) : (f32) -> () loc("<stdin>":60:7)
    }) : (index, index, index, f32) -> f32 loc("<stdin>":51:11)
    "func.return"(%10) : (memref<?x?xf32>) -> () loc("<stdin>":62:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":65:10)
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":66:10)
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":67:10)
    %3 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index loc("<stdin>":68:10)
    %4 = "arith.addi"(%3, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":69:10)
    %5 = "func.call"(%4, %4) <{callee = @initialize_memory}> : (index, index) -> memref<?x?xf32> loc("<stdin>":70:10)
    "func.call"(%5, %0, %0) <{callee = @load_and_print}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":71:5)
    "func.call"(%5, %1, %1) <{callee = @transfer_write_2d}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":72:5)
    "func.call"(%5, %0, %0) <{callee = @load_and_print}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":73:5)
    "func.call"(%5, %0, %0) <{callee = @transfer_write_2d_mask}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":74:5)
    "func.call"(%5, %0, %0) <{callee = @load_and_print}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":75:5)
    "func.call"(%5, %0, %0) <{callee = @transfer_write_2d_transposed}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":76:5)
    "func.call"(%5, %0, %0) <{callee = @load_and_print}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":77:5)
    "func.call"(%5, %0, %0) <{callee = @transfer_write_2d_mask_transposed}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":78:5)
    "func.call"(%5, %0, %0) <{callee = @load_and_print}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":79:5)
    "memref.dealloc"(%5) : (memref<?x?xf32>) -> () loc("<stdin>":80:5)
    "func.return"() : () -> () loc("<stdin>":81:5)
  }) : () -> () loc("<stdin>":64:3)
}) : () -> () loc("<stdin>":3:1)
