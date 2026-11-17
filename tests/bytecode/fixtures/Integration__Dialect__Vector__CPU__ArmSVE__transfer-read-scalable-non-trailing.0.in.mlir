"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x8xi8>) -> (), no_inline, sym_name = "transfer_read_scalable_non_trailing"}> ({
  ^bb0(%arg1: memref<?x8xi8> loc("<stdin>":4:8)):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %9 = "arith.constant"() <{value = 0 : i8}> : () -> i8 loc("<stdin>":6:10)
    %10 = "vector.transfer_read"(%arg1, %8, %8, %9) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x8xi8>, index, index, i8) -> vector<[4]x8xi8> loc("<stdin>":7:11)
    %11 = "vector.shape_cast"(%10) : (vector<[4]x8xi8>) -> vector<[32]xi8> loc("<stdin>":8:11)
    "func.call"(%11) <{callee = @printVec}> : (vector<[32]xi8>) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":13:10)
    %3 = "arith.constant"() <{value = dense<[[11, 12, 13, 14, 15, 16, 17, 18], [21, 22, 23, 24, 25, 26, 27, 28], [31, 32, 33, 34, 35, 36, 37, 38], [41, 42, 43, 44, 45, 46, 47, 48], [51, 52, 53, 54, 55, 56, 57, 58], [61, 62, 63, 64, 65, 66, 67, 68], [71, 72, 73, 74, 75, 76, 77, 78], [81, 82, 83, 84, 85, 86, 87, 88]]> : vector<8x8xi8>}> : () -> vector<8x8xi8> loc("<stdin>":14:10)
    %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8xi8> loc("<stdin>":15:10)
    "vector.transfer_write"(%3, %4, %2, %2) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<8x8xi8>, memref<8x8xi8>, index, index) -> () loc("<stdin>":16:5)
    %5 = "memref.cast"(%4) : (memref<8x8xi8>) -> memref<?x8xi8> loc("<stdin>":17:10)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(VL128):\0A"}> : () -> () loc("<stdin>":18:5)
    %6 = "arith.constant"() <{value = 128 : i32}> : () -> i32 loc("<stdin>":19:10)
    "func.call"(%6) <{callee = @setArmVLBits}> : (i32) -> () loc("<stdin>":20:5)
    "func.call"(%5) <{callee = @transfer_read_scalable_non_trailing}> : (memref<?x8xi8>) -> () loc("<stdin>":21:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(VL256):\0A"}> : () -> () loc("<stdin>":22:5)
    %7 = "arith.constant"() <{value = 256 : i32}> : () -> i32 loc("<stdin>":23:10)
    "func.call"(%7) <{callee = @setArmVLBits}> : (i32) -> () loc("<stdin>":24:5)
    "func.call"(%5) <{callee = @transfer_read_scalable_non_trailing}> : (memref<?x8xi8>) -> () loc("<stdin>":25:5)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<[32]xi8>) -> (), sym_name = "printVec", sym_visibility = "private"}> ({
  ^bb0(%arg0: vector<[32]xi8> loc("<stdin>":29:8)):
    %0 = "vector.scalable.extract"(%arg0) <{pos = 0 : i64}> : (vector<[32]xi8>) -> vector<[16]xi8> loc("<stdin>":30:10)
    %1 = "vector.scalable.extract"(%arg0) <{pos = 16 : i64}> : (vector<[32]xi8>) -> vector<[16]xi8> loc("<stdin>":31:10)
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<[16]xi8>) -> () loc("<stdin>":32:5)
    "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (vector<[16]xi8>) -> () loc("<stdin>":33:5)
    "func.return"() : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmVLBits", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":36:3)
}) : () -> () loc("<stdin>":2:1)
