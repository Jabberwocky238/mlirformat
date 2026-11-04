#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (40)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<40xi32>, index) -> (), sym_name = "transfer_read_2d"}> ({
  ^bb0(%arg7: memref<40xi32>, %arg8: index):
    %25 = "arith.constant"() <{value = -42 : i32}> : () -> i32
    %26 = "vector.transfer_read"(%arg7, %arg8, %25) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<40xi32>, index, i32) -> vector<40xi32>
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<40xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 20 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = -10 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 2147483647 : i32}> : () -> i32
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<40xi32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg6: index):
      %23 = "arith.index_cast"(%arg6) : (index) -> i32
      %24 = "arith.subi"(%23, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "memref.store"(%24, %5, %arg6) : (i32, memref<40xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg5: index):
      %20 = "arith.index_cast"(%arg5) : (index) -> i32
      %21 = "arith.subi"(%20, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %22 = "arith.ceildivsi"(%21, %2) : (i32, i32) -> i32
      "memref.store"(%22, %5, %arg5) : (i32, memref<40xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg4: index):
      %17 = "arith.index_cast"(%arg4) : (index) -> i32
      %18 = "arith.subi"(%17, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %19 = "arith.floordivsi"(%18, %2) : (i32, i32) -> i32
      "memref.store"(%19, %5, %arg4) : (i32, memref<40xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg3: index):
      %14 = "arith.index_cast"(%arg3) : (index) -> i32
      %15 = "arith.subi"(%14, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %16 = "arith.ceildivsi"(%15, %3) : (i32, i32) -> i32
      "memref.store"(%16, %5, %arg3) : (i32, memref<40xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg2: index):
      %11 = "arith.index_cast"(%arg2) : (index) -> i32
      %12 = "arith.subi"(%11, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %13 = "arith.floordivsi"(%12, %3) : (i32, i32) -> i32
      "memref.store"(%13, %5, %arg2) : (i32, memref<40xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg1: index):
      %9 = "arith.index_cast"(%arg1) : (index) -> i32
      %10 = "arith.ceildivui"(%9, %2) : (i32, i32) -> i32
      "memref.store"(%10, %5, %arg1) : (i32, memref<40xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg0: index):
      %6 = "arith.index_cast"(%arg0) : (index) -> i32
      %7 = "arith.subi"(%6, %1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %8 = "arith.ceildivui"(%7, %4) : (i32, i32) -> i32
      "memref.store"(%8, %5, %arg0) : (i32, memref<40xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.call"(%5, %0) <{callee = @transfer_read_2d}> : (memref<40xi32>, index) -> ()
    "memref.dealloc"(%5) : (memref<40xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (i64, i64, i64, i64, i64, i64), sym_name = "non_inline_function"}> ({
    %4 = "arith.constant"() <{value = -9223372036854775807 : i64}> : () -> i64
    %5 = "arith.constant"() <{value = -1 : i64}> : () -> i64
    %6 = "arith.constant"() <{value = -9223372036854775808 : i64}> : () -> i64
    %7 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %8 = "arith.constant"() <{value = 9223372036854775807 : i64}> : () -> i64
    "func.return"(%4, %5, %6, %7, %8, %5) : (i64, i64, i64, i64, i64, i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0:6 = "func.call"() <{callee = @non_inline_function}> : () -> (i64, i64, i64, i64, i64, i64)
    %1 = "arith.floordivsi"(%0#0, %0#1) : (i64, i64) -> i64
    %2 = "arith.floordivsi"(%0#2, %0#3) : (i64, i64) -> i64
    %3 = "arith.floordivsi"(%0#4, %0#5) : (i64, i64) -> i64
    "vector.print"(%1) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    "vector.print"(%3) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

