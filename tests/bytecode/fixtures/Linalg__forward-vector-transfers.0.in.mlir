"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> vector<32xf32>, sym_name = "testAllocRead"}> ({
  ^bb0(%arg16: memref<?xf32> loc("<stdin>":4:8)):
    %36 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:11)
    %37 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:11)
    %38 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32> loc("<stdin>":7:11)
    %39 = "memref.subview"(%38) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32> loc("<stdin>":8:11)
    "memref.copy"(%arg16, %39) : (memref<?xf32>, memref<16xf32>) -> () loc("<stdin>":9:5)
    %40 = "vector.transfer_read"(%38, %36, %37) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<32xf32>, index, f32) -> vector<32xf32> loc("<stdin>":10:11)
    "memref.dealloc"(%38) : (memref<32xf32>) -> () loc("<stdin>":11:5)
    "func.return"(%40) : (vector<32xf32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = (memref<?xf32>) -> vector<32xf32>, sym_name = "testAllocFillRead"}> ({
  ^bb0(%arg13: memref<?xf32> loc("<stdin>":15:8)):
    %31 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":16:11)
    %32 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":17:11)
    %33 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32> loc("<stdin>":18:11)
    "linalg.fill"(%32, %33) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32 loc("<stdin>":20:10), %arg15: f32 loc("<stdin>":20:23)):
      "linalg.yield"(%arg14) : (f32) -> () loc("<stdin>":21:7)
    }) : (f32, memref<32xf32>) -> () loc("<stdin>":19:5)
    %34 = "memref.subview"(%33) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32> loc("<stdin>":23:11)
    "memref.copy"(%arg13, %34) : (memref<?xf32>, memref<16xf32>) -> () loc("<stdin>":24:5)
    %35 = "vector.transfer_read"(%33, %31, %32) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<32xf32>, index, f32) -> vector<32xf32> loc("<stdin>":25:11)
    "memref.dealloc"(%33) : (memref<32xf32>) -> () loc("<stdin>":26:5)
    "func.return"(%35) : (vector<32xf32>) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (memref<?xf32>) -> vector<32xf32>, sym_name = "testViewRead"}> ({
  ^bb0(%arg12: memref<?xf32> loc("<stdin>":30:8)):
    %25 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":31:11)
    %26 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":32:11)
    %27 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xi8> loc("<stdin>":33:11)
    %28 = "memref.view"(%27, %25) : (memref<128xi8>, index) -> memref<32xf32> loc("<stdin>":34:11)
    %29 = "memref.subview"(%28) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32> loc("<stdin>":35:11)
    "memref.copy"(%arg12, %29) : (memref<?xf32>, memref<16xf32>) -> () loc("<stdin>":36:5)
    %30 = "vector.transfer_read"(%28, %25, %26) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<32xf32>, index, f32) -> vector<32xf32> loc("<stdin>":37:11)
    "memref.dealloc"(%27) : (memref<128xi8>) -> () loc("<stdin>":38:5)
    "func.return"(%30) : (vector<32xf32>) -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = (memref<?xf32>) -> vector<32xf32>, sym_name = "testViewFillRead"}> ({
  ^bb0(%arg9: memref<?xf32> loc("<stdin>":42:8)):
    %19 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":43:11)
    %20 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":44:11)
    %21 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xi8> loc("<stdin>":45:11)
    %22 = "memref.view"(%21, %19) : (memref<128xi8>, index) -> memref<32xf32> loc("<stdin>":46:11)
    %23 = "memref.subview"(%22) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32> loc("<stdin>":47:11)
    "linalg.fill"(%20, %22) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32 loc("<stdin>":49:10), %arg11: f32 loc("<stdin>":49:23)):
      "linalg.yield"(%arg10) : (f32) -> () loc("<stdin>":50:7)
    }) : (f32, memref<32xf32>) -> () loc("<stdin>":48:5)
    "memref.copy"(%arg9, %23) : (memref<?xf32>, memref<16xf32>) -> () loc("<stdin>":52:5)
    %24 = "vector.transfer_read"(%22, %19, %20) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<32xf32>, index, f32) -> vector<32xf32> loc("<stdin>":53:11)
    "memref.dealloc"(%21) : (memref<128xi8>) -> () loc("<stdin>":54:5)
    "func.return"(%24) : (vector<32xf32>) -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (vector<32xf32>, memref<?xf32>) -> (), sym_name = "testAllocWrite"}> ({
  ^bb0(%arg7: vector<32xf32> loc("<stdin>":58:8), %arg8: memref<?xf32> loc("<stdin>":58:31)):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":59:11)
    %16 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":60:11)
    %17 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32> loc("<stdin>":61:11)
    %18 = "memref.subview"(%17) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32> loc("<stdin>":62:11)
    "vector.transfer_write"(%arg7, %17, %15) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<32xf32>, memref<32xf32>, index) -> () loc("<stdin>":63:5)
    "memref.copy"(%18, %arg8) : (memref<16xf32>, memref<?xf32>) -> () loc("<stdin>":64:5)
    "memref.dealloc"(%17) : (memref<32xf32>) -> () loc("<stdin>":65:5)
    "func.return"() : () -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":57:3)
  "func.func"() <{function_type = (vector<32xf32>, memref<?xf32>) -> (), sym_name = "testViewWrite"}> ({
  ^bb0(%arg5: vector<32xf32> loc("<stdin>":69:8), %arg6: memref<?xf32> loc("<stdin>":69:31)):
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":70:11)
    %11 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":71:11)
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xi8> loc("<stdin>":72:11)
    %13 = "memref.view"(%12, %10) : (memref<128xi8>, index) -> memref<32xf32> loc("<stdin>":73:11)
    %14 = "memref.subview"(%13) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32> loc("<stdin>":74:11)
    "vector.transfer_write"(%arg5, %13, %10) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<32xf32>, memref<32xf32>, index) -> () loc("<stdin>":75:5)
    "memref.copy"(%14, %arg6) : (memref<16xf32>, memref<?xf32>) -> () loc("<stdin>":76:5)
    "memref.dealloc"(%12) : (memref<128xi8>) -> () loc("<stdin>":77:5)
    "func.return"() : () -> () loc("<stdin>":78:5)
  }) : () -> () loc("<stdin>":68:3)
  "func.func"() <{function_type = (memref<?xf32>) -> vector<32xf32>, sym_name = "failAllocFillRead"}> ({
  ^bb0(%arg2: memref<?xf32> loc("<stdin>":81:8)):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":82:10)
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":83:10)
    %6 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":84:10)
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32> loc("<stdin>":85:10)
    "linalg.fill"(%5, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":87:10), %arg4: f32 loc("<stdin>":87:22)):
      "linalg.yield"(%arg3) : (f32) -> () loc("<stdin>":88:7)
    }) : (f32, memref<32xf32>) -> () loc("<stdin>":86:5)
    %8 = "memref.subview"(%7) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32> loc("<stdin>":90:10)
    "memref.copy"(%arg2, %8) : (memref<?xf32>, memref<16xf32>) -> () loc("<stdin>":91:5)
    "some_interleaved_use"(%8) : (memref<16xf32>) -> () loc("<stdin>":92:5)
    %9 = "vector.transfer_read"(%7, %4, %6) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<32xf32>, index, f32) -> vector<32xf32> loc("<stdin>":93:10)
    "memref.dealloc"(%7) : (memref<32xf32>) -> () loc("<stdin>":94:5)
    "func.return"(%9) : (vector<32xf32>) -> () loc("<stdin>":95:5)
  }) : () -> () loc("<stdin>":80:3)
  "func.func"() <{function_type = (vector<32xf32>, memref<?xf32>) -> (), sym_name = "failAllocWrite"}> ({
  ^bb0(%arg0: vector<32xf32> loc("<stdin>":98:8), %arg1: memref<?xf32> loc("<stdin>":98:31)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":99:10)
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":100:10)
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32> loc("<stdin>":101:10)
    %3 = "memref.subview"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32> loc("<stdin>":102:10)
    "vector.transfer_write"(%arg0, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<32xf32>, memref<32xf32>, index) -> () loc("<stdin>":103:5)
    "some_interleaved_use"(%3) : (memref<16xf32>) -> () loc("<stdin>":104:5)
    "memref.copy"(%3, %arg1) : (memref<16xf32>, memref<?xf32>) -> () loc("<stdin>":105:5)
    "memref.dealloc"(%2) : (memref<32xf32>) -> () loc("<stdin>":106:5)
    "func.return"() : () -> () loc("<stdin>":107:5)
  }) : () -> () loc("<stdin>":97:3)
}) : () -> () loc("<stdin>":2:1)
