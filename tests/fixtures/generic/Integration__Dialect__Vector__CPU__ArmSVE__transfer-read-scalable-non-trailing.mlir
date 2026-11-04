#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x8xi8>) -> (), no_inline, sym_name = "transfer_read_scalable_non_trailing"}> ({
  ^bb0(%arg1: memref<?x8xi8>):
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index
    %9 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %10 = "vector.transfer_read"(%arg1, %8, %8, %9) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x8xi8>, index, index, i8) -> vector<[4]x8xi8>
    %11 = "vector.shape_cast"(%10) : (vector<[4]x8xi8>) -> vector<[32]xi8>
    "func.call"(%11) <{callee = @printVec}> : (vector<[32]xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = dense<[[11, 12, 13, 14, 15, 16, 17, 18], [21, 22, 23, 24, 25, 26, 27, 28], [31, 32, 33, 34, 35, 36, 37, 38], [41, 42, 43, 44, 45, 46, 47, 48], [51, 52, 53, 54, 55, 56, 57, 58], [61, 62, 63, 64, 65, 66, 67, 68], [71, 72, 73, 74, 75, 76, 77, 78], [81, 82, 83, 84, 85, 86, 87, 88]]> : vector<8x8xi8>}> : () -> vector<8x8xi8>
    %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8xi8>
    "vector.transfer_write"(%3, %4, %2, %2) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<8x8xi8>, memref<8x8xi8>, index, index) -> ()
    %5 = "memref.cast"(%4) : (memref<8x8xi8>) -> memref<?x8xi8>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(VL128):\0A"}> : () -> ()
    %6 = "arith.constant"() <{value = 128 : i32}> : () -> i32
    "func.call"(%6) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"(%5) <{callee = @transfer_read_scalable_non_trailing}> : (memref<?x8xi8>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(VL256):\0A"}> : () -> ()
    %7 = "arith.constant"() <{value = 256 : i32}> : () -> i32
    "func.call"(%7) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"(%5) <{callee = @transfer_read_scalable_non_trailing}> : (memref<?x8xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[32]xi8>) -> (), sym_name = "printVec", sym_visibility = "private"}> ({
  ^bb0(%arg0: vector<[32]xi8>):
    %0 = "vector.scalable.extract"(%arg0) <{pos = 0 : i64}> : (vector<[32]xi8>) -> vector<[16]xi8>
    %1 = "vector.scalable.extract"(%arg0) <{pos = 16 : i64}> : (vector<[32]xi8>) -> vector<[16]xi8>
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<[16]xi8>) -> ()
    "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (vector<[16]xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmVLBits", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

