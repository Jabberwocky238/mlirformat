"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d"}> ({
  ^bb0(%arg21: memref<?x?xf32> loc("<stdin>":5:8), %arg22: index loc("<stdin>":5:33), %arg23: index loc("<stdin>":5:48)):
    %39 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":6:11)
    %40 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:11)
    %41 = "vector.transfer_read"(%arg21, %arg22, %arg23, %40) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x?xf32>, index, index, f32) -> vector<[4]x[4]xf32> loc("<stdin>":8:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> () loc("<stdin>":9:5)
    "vector.print"(%41) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_transposed"}> ({
  ^bb0(%arg18: memref<?x?xf32> loc("<stdin>":14:8), %arg19: index loc("<stdin>":14:33), %arg20: index loc("<stdin>":14:48)):
    %37 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":15:11)
    %38 = "vector.transfer_read"(%arg18, %arg19, %arg20, %37) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1, d0)>}> : (memref<?x?xf32>, index, index, f32) -> vector<[4]x[4]xf32> loc("<stdin>":16:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> () loc("<stdin>":17:5)
    "vector.print"(%38) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> () loc("<stdin>":18:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask"}> ({
  ^bb0(%arg15: memref<?x?xf32> loc("<stdin>":22:8), %arg16: index loc("<stdin>":22:33), %arg17: index loc("<stdin>":22:48)):
    %32 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":23:11)
    %33 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":24:11)
    %34 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":25:11)
    %35 = "vector.create_mask"(%32, %33) : (index, index) -> vector<[4]x[4]xi1> loc("<stdin>":26:11)
    %36 = "vector.transfer_read"(%arg15, %arg16, %arg17, %34, %35) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x?xf32>, index, index, f32, vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32> loc("<stdin>":27:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> () loc("<stdin>":28:5)
    "vector.print"(%36) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> () loc("<stdin>":29:5)
    "func.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask_transposed"}> ({
  ^bb0(%arg12: memref<?x?xf32> loc("<stdin>":33:8), %arg13: index loc("<stdin>":33:33), %arg14: index loc("<stdin>":33:48)):
    %27 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":34:11)
    %28 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":35:11)
    %29 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":36:11)
    %30 = "vector.create_mask"(%27, %28) : (index, index) -> vector<[4]x[4]xi1> loc("<stdin>":37:11)
    %31 = "vector.transfer_read"(%arg12, %arg13, %arg14, %29, %30) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = affine_map<(d0, d1) -> (d1, d0)>}> : (memref<?x?xf32>, index, index, f32, vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32> loc("<stdin>":38:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> () loc("<stdin>":39:5)
    "vector.print"(%31) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> () loc("<stdin>":40:5)
    "func.return"() : () -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask_non_zero_pad"}> ({
  ^bb0(%arg9: memref<?x?xf32> loc("<stdin>":44:8), %arg10: index loc("<stdin>":44:32), %arg11: index loc("<stdin>":44:47)):
    %22 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":45:11)
    %23 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":46:11)
    %24 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":47:11)
    %25 = "vector.create_mask"(%22, %23) : (index, index) -> vector<[4]x[4]xi1> loc("<stdin>":48:11)
    %26 = "vector.transfer_read"(%arg9, %arg10, %arg11, %24, %25) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x?xf32>, index, index, f32, vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32> loc("<stdin>":49:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> () loc("<stdin>":50:5)
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> () loc("<stdin>":51:5)
    "func.return"() : () -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = (memref<?x?xf32>, index, index) -> (), sym_name = "transfer_read_2d_mask_non_zero_pad_transposed"}> ({
  ^bb0(%arg6: memref<?x?xf32> loc("<stdin>":55:8), %arg7: index loc("<stdin>":55:32), %arg8: index loc("<stdin>":55:46)):
    %17 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":56:11)
    %18 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":57:11)
    %19 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32 loc("<stdin>":58:11)
    %20 = "vector.create_mask"(%17, %18) : (index, index) -> vector<[4]x[4]xi1> loc("<stdin>":59:11)
    %21 = "vector.transfer_read"(%arg6, %arg7, %arg8, %19, %20) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = affine_map<(d0, d1) -> (d1, d0)>}> : (memref<?x?xf32>, index, index, f32, vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32> loc("<stdin>":60:11)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "TILE BEGIN:\0A"}> : () -> () loc("<stdin>":61:5)
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> () loc("<stdin>":62:5)
    "func.return"() : () -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":54:3)
  "func.func"() <{function_type = (index, index) -> memref<?x?xf32>, sym_name = "initialize_memory"}> ({
  ^bb0(%arg0: index loc("<stdin>":66:8), %arg1: index loc("<stdin>":66:22)):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":67:10)
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":68:10)
    %9 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":69:10)
    %10 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32 loc("<stdin>":70:11)
    %11 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":71:11)
    %12 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":72:11)
    %13 = "scf.for"(%7, %arg0, %8, %12) ({
    ^bb0(%arg2: index loc("<stdin>":74:10), %arg3: f32 loc("<stdin>":74:24)):
      %14 = "scf.for"(%7, %arg1, %8, %arg3) ({
      ^bb0(%arg4: index loc("<stdin>":76:12), %arg5: f32 loc("<stdin>":76:26)):
        "memref.store"(%arg5, %11, %arg2, %arg4) : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":77:9)
        %16 = "arith.addf"(%arg5, %9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":78:15)
        "scf.yield"(%16) : (f32) -> () loc("<stdin>":79:9)
      }) : (index, index, index, f32) -> f32 loc("<stdin>":75:13)
      %15 = "arith.addf"(%arg3, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":81:13)
      "scf.yield"(%15) : (f32) -> () loc("<stdin>":82:7)
    }) : (index, index, index, f32) -> f32 loc("<stdin>":73:11)
    "func.return"(%11) : (memref<?x?xf32>) -> () loc("<stdin>":84:5)
  }) : () -> () loc("<stdin>":65:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":87:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":88:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":89:10)
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":90:10)
    %4 = "arm_sme.streaming_vl"() <{type_size = #arm_sme.type_size<word>}> : () -> index loc("<stdin>":91:10)
    %5 = "arith.addi"(%4, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":92:10)
    %6 = "func.call"(%5, %5) <{callee = @initialize_memory}> : (index, index) -> memref<?x?xf32> loc("<stdin>":93:10)
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":94:5)
    "func.call"(%6, %1, %2) <{callee = @transfer_read_2d}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":95:5)
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_mask}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":96:5)
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_mask_non_zero_pad}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":97:5)
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_transposed}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":98:5)
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_mask_transposed}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":99:5)
    "func.call"(%6, %0, %0) <{callee = @transfer_read_2d_mask_non_zero_pad_transposed}> : (memref<?x?xf32>, index, index) -> () loc("<stdin>":100:5)
    "memref.dealloc"(%6) : (memref<?x?xf32>) -> () loc("<stdin>":101:5)
    "func.return"() : () -> () loc("<stdin>":102:5)
  }) : () -> () loc("<stdin>":86:3)
}) : () -> () loc("<stdin>":3:1)
