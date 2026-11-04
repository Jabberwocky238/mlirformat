#map = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map1 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi32>, i32, i32, i32, i32, i32) -> (), sym_name = "storeValuesTo"}> ({
  ^bb0(%arg6: memref<?xi32>, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32):
    %46 = "arith.constant"() <{value = 0 : index}> : () -> index
    %47 = "arith.constant"() <{value = 1 : index}> : () -> index
    %48 = "arith.constant"() <{value = 2 : index}> : () -> index
    %49 = "arith.constant"() <{value = 3 : index}> : () -> index
    %50 = "arith.constant"() <{value = 4 : index}> : () -> index
    "memref.store"(%arg7, %arg6, %46) : (i32, memref<?xi32>, index) -> ()
    "memref.store"(%arg8, %arg6, %47) : (i32, memref<?xi32>, index) -> ()
    "memref.store"(%arg9, %arg6, %48) : (i32, memref<?xi32>, index) -> ()
    "memref.store"(%arg10, %arg6, %49) : (i32, memref<?xi32>, index) -> ()
    "memref.store"(%arg11, %arg6, %50) : (i32, memref<?xi32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> (), sym_name = "storeValuesToStrided"}> ({
  ^bb0(%arg0: memref<?xi32, strided<[4], offset: ?>>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32):
    %41 = "arith.constant"() <{value = 0 : index}> : () -> index
    %42 = "arith.constant"() <{value = 1 : index}> : () -> index
    %43 = "arith.constant"() <{value = 2 : index}> : () -> index
    %44 = "arith.constant"() <{value = 3 : index}> : () -> index
    %45 = "arith.constant"() <{value = 4 : index}> : () -> index
    "memref.store"(%arg1, %arg0, %41) : (i32, memref<?xi32, strided<[4], offset: ?>>, index) -> ()
    "memref.store"(%arg2, %arg0, %42) : (i32, memref<?xi32, strided<[4], offset: ?>>, index) -> ()
    "memref.store"(%arg3, %arg0, %43) : (i32, memref<?xi32, strided<[4], offset: ?>>, index) -> ()
    "memref.store"(%arg4, %arg0, %44) : (i32, memref<?xi32, strided<[4], offset: ?>>, index) -> ()
    "memref.store"(%arg5, %arg0, %45) : (i32, memref<?xi32, strided<[4], offset: ?>>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = 6 : i32}> : () -> i32
    %7 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %8 = "arith.constant"() <{value = 8 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = 9 : i32}> : () -> i32
    %10 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %11 = "arith.constant"() <{value = 100 : i32}> : () -> i32
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index
    %13 = "arith.constant"() <{value = 1 : index}> : () -> index
    %14 = "arith.constant"() <{value = 2 : index}> : () -> index
    %15 = "arith.constant"() <{value = 3 : index}> : () -> index
    %16 = "arith.constant"() <{value = 4 : index}> : () -> index
    %17 = "arith.constant"() <{value = 5 : index}> : () -> index
    %18 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<20xi32>
    %19 = "memref.cast"(%18) : (memref<20xi32>) -> memref<?xi32>
    %20 = "memref.subview"(%19, %12, %17) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 4>}> : (memref<?xi32>, index, index) -> memref<?xi32, strided<[4], offset: ?>>
    %21 = "memref.subview"(%19, %13, %17) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 4>}> : (memref<?xi32>, index, index) -> memref<?xi32, strided<[4], offset: ?>>
    %22 = "memref.subview"(%19, %14, %17) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 4>}> : (memref<?xi32>, index, index) -> memref<?xi32, strided<[4], offset: ?>>
    %23 = "memref.subview"(%19, %15, %17) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 4>}> : (memref<?xi32>, index, index) -> memref<?xi32, strided<[4], offset: ?>>
    %24 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<7xi32>
    %25 = "memref.cast"(%24) : (memref<7xi32>) -> memref<?xi32>
    "func.call"(%20, %1, %1, %3, %10, %3) <{callee = @storeValuesToStrided}> : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    "func.call"(%21, %10, %2, %1, %5, %1) <{callee = @storeValuesToStrided}> : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    "func.call"(%22, %2, %4, %9, %7, %9) <{callee = @storeValuesToStrided}> : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    "func.call"(%23, %6, %10, %8, %9, %7) <{callee = @storeValuesToStrided}> : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    "func.call"(%25, %5, %7, %4, %9, %7) <{callee = @storeValuesTo}> : (memref<?xi32>, i32, i32, i32, i32, i32) -> ()
    "sparse_tensor.sort"(%17, %19, %25) <{algorithm = #sparse_tensor<SparseTensorSortAlgorithm quick_sort>, ny = 1 : index, perm_map = #map}> : (index, memref<?xi32>, memref<?xi32>) -> ()
    %26 = "vector.transfer_read"(%21, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32, strided<[4], offset: ?>>, index, i32) -> vector<5xi32>
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    %27 = "vector.transfer_read"(%22, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32, strided<[4], offset: ?>>, index, i32) -> vector<5xi32>
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    %28 = "vector.transfer_read"(%20, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32, strided<[4], offset: ?>>, index, i32) -> vector<5xi32>
    "vector.print"(%28) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    %29 = "vector.transfer_read"(%23, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32, strided<[4], offset: ?>>, index, i32) -> vector<5xi32>
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    %30 = "vector.transfer_read"(%25, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32>, index, i32) -> vector<5xi32>
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    "func.call"(%20, %1, %1, %3, %10, %3) <{callee = @storeValuesToStrided}> : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    "func.call"(%21, %10, %2, %1, %5, %1) <{callee = @storeValuesToStrided}> : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    "func.call"(%22, %2, %4, %9, %7, %9) <{callee = @storeValuesToStrided}> : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    "func.call"(%23, %6, %10, %8, %9, %7) <{callee = @storeValuesToStrided}> : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    "func.call"(%25, %5, %7, %4, %9, %7) <{callee = @storeValuesTo}> : (memref<?xi32>, i32, i32, i32, i32, i32) -> ()
    "sparse_tensor.sort"(%17, %19, %25) <{algorithm = #sparse_tensor<SparseTensorSortAlgorithm insertion_sort_stable>, ny = 1 : index, perm_map = #map}> : (index, memref<?xi32>, memref<?xi32>) -> ()
    %31 = "vector.transfer_read"(%21, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32, strided<[4], offset: ?>>, index, i32) -> vector<5xi32>
    "vector.print"(%31) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    %32 = "vector.transfer_read"(%22, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32, strided<[4], offset: ?>>, index, i32) -> vector<5xi32>
    "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    %33 = "vector.transfer_read"(%20, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32, strided<[4], offset: ?>>, index, i32) -> vector<5xi32>
    "vector.print"(%33) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    %34 = "vector.transfer_read"(%23, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32, strided<[4], offset: ?>>, index, i32) -> vector<5xi32>
    "vector.print"(%34) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    %35 = "vector.transfer_read"(%25, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32>, index, i32) -> vector<5xi32>
    "vector.print"(%35) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    "func.call"(%20, %1, %1, %3, %10, %3) <{callee = @storeValuesToStrided}> : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    "func.call"(%21, %10, %2, %1, %5, %1) <{callee = @storeValuesToStrided}> : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    "func.call"(%22, %2, %4, %9, %7, %9) <{callee = @storeValuesToStrided}> : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    "func.call"(%23, %6, %10, %8, %9, %7) <{callee = @storeValuesToStrided}> : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    "func.call"(%25, %5, %7, %4, %9, %7) <{callee = @storeValuesTo}> : (memref<?xi32>, i32, i32, i32, i32, i32) -> ()
    "sparse_tensor.sort"(%17, %19, %25) <{algorithm = #sparse_tensor<SparseTensorSortAlgorithm heap_sort>, ny = 1 : index, perm_map = #map}> : (index, memref<?xi32>, memref<?xi32>) -> ()
    %36 = "vector.transfer_read"(%21, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32, strided<[4], offset: ?>>, index, i32) -> vector<5xi32>
    "vector.print"(%36) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    %37 = "vector.transfer_read"(%22, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32, strided<[4], offset: ?>>, index, i32) -> vector<5xi32>
    "vector.print"(%37) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    %38 = "vector.transfer_read"(%20, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32, strided<[4], offset: ?>>, index, i32) -> vector<5xi32>
    "vector.print"(%38) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    %39 = "vector.transfer_read"(%23, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32, strided<[4], offset: ?>>, index, i32) -> vector<5xi32>
    "vector.print"(%39) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    %40 = "vector.transfer_read"(%25, %12, %11) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi32>, index, i32) -> vector<5xi32>
    "vector.print"(%40) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi32>) -> ()
    "memref.dealloc"(%19) : (memref<?xi32>) -> ()
    "memref.dealloc"(%25) : (memref<?xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

