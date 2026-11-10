#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_smmla"}> ({
    %57 = "arith.constant"() <{value = 0 : index}> : () -> index
    %58 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %59 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %60 = "arith.constant"() <{value = dense<[[-44, 20, 44, -46], [-8, 25, -34, 26], [-20, -36, -3, 39], [-48, -31, -25, -21]]> : vector<4x4xi32>}> : () -> vector<4x4xi32>
    %61 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xi32>
    "vector.transfer_write"(%60, %61, %57, %57) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xi32>, memref<4x4xi32>, index, index) -> ()
    %62 = "vector.transfer_read"(%61, %57, %57, %58) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xi32>, index, index, i32) -> vector<4x4xi32>
    %63 = "arith.constant"() <{value = dense<[[-35, -27, -36, -31, 23, -34, -8, -33], [-20, 17, -32, -47, 37, 22, -7, -21], [-7, -35, 20, -4, 39, 46, -23, 40], [40, 27, 37, 43, 38, -6, 37, 49]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %64 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi8>
    "vector.transfer_write"(%63, %64, %57, %57) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x8xi8>, memref<4x8xi8>, index, index) -> ()
    %65 = "vector.transfer_read"(%64, %57, %57, %59) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi8>, index, index, i8) -> vector<4x8xi8>
    %66 = "arith.constant"() <{value = dense<[[-17, -50, -1, 48, -13, 22, 39, 33], [-35, -24, 37, -32, 33, 30, -11, -17], [-28, 31, 3, -44, -15, -27, 22, 35], [-23, 39, 48, 26, -23, 32, -39, -38]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %67 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi8>
    "vector.transfer_write"(%66, %67, %57, %57) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x8xi8>, memref<4x8xi8>, index, index) -> ()
    %68 = "vector.transfer_read"(%67, %57, %57, %59) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi8>, index, index, i8) -> vector<4x8xi8>
    %69 = "arith.extsi"(%65) : (vector<4x8xi8>) -> vector<4x8xi32>
    %70 = "arith.extsi"(%68) : (vector<4x8xi8>) -> vector<4x8xi32>
    %71 = "vector.contract"(%69, %70, %62) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map1, #map2, #map3], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<4x8xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(SMMLA):\0A"}> : () -> ()
    %72 = "vector.extract"(%71) <{static_position = array<i64: 0>}> : (vector<4x4xi32>) -> vector<4xi32>
    %73 = "vector.extract"(%71) <{static_position = array<i64: 1>}> : (vector<4x4xi32>) -> vector<4xi32>
    %74 = "vector.extract"(%71) <{static_position = array<i64: 2>}> : (vector<4x4xi32>) -> vector<4xi32>
    %75 = "vector.extract"(%71) <{static_position = array<i64: 3>}> : (vector<4x4xi32>) -> vector<4xi32>
    "vector.print"(%72) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "vector.print"(%73) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "vector.print"(%74) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "vector.print"(%75) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_ummla"}> ({
    %38 = "arith.constant"() <{value = 0 : index}> : () -> index
    %39 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %40 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %41 = "arith.constant"() <{value = dense<[[16, 16, 48, 40], [40, 24, 35, 12], [33, 24, 29, 19], [28, 13, 33, 18]]> : vector<4x4xi32>}> : () -> vector<4x4xi32>
    %42 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xi32>
    "vector.transfer_write"(%41, %42, %38, %38) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xi32>, memref<4x4xi32>, index, index) -> ()
    %43 = "vector.transfer_read"(%42, %38, %38, %39) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xi32>, index, index, i32) -> vector<4x4xi32>
    %44 = "arith.constant"() <{value = dense<[[35, 42, 37, 49, 36, 36, 23, 33], [39, 34, 33, 45, 43, 10, 44, 47], [18, 35, 29, 25, 36, 33, 28, 29], [26, 49, 43, 32, 27, 16, 45, 33]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %45 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi8>
    "vector.transfer_write"(%44, %45, %38, %38) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x8xi8>, memref<4x8xi8>, index, index) -> ()
    %46 = "vector.transfer_read"(%45, %38, %38, %40) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi8>, index, index, i8) -> vector<4x8xi8>
    %47 = "arith.constant"() <{value = dense<[[18, 31, 37, 35, 44, 22, 37, 28], [21, 22, 49, 39, 30, 28, 35, 37], [21, 47, 39, 35, 23, 43, 24, 49], [49, 49, 40, 32, 37, 20, 47, 40]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %48 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi8>
    "vector.transfer_write"(%47, %48, %38, %38) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x8xi8>, memref<4x8xi8>, index, index) -> ()
    %49 = "vector.transfer_read"(%48, %38, %38, %40) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi8>, index, index, i8) -> vector<4x8xi8>
    %50 = "arith.extui"(%46) : (vector<4x8xi8>) -> vector<4x8xi32>
    %51 = "arith.extui"(%49) : (vector<4x8xi8>) -> vector<4x8xi32>
    %52 = "vector.contract"(%50, %51, %43) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map1, #map2, #map3], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<4x8xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(UMMLA):\0A"}> : () -> ()
    %53 = "vector.extract"(%52) <{static_position = array<i64: 0>}> : (vector<4x4xi32>) -> vector<4xi32>
    %54 = "vector.extract"(%52) <{static_position = array<i64: 1>}> : (vector<4x4xi32>) -> vector<4xi32>
    %55 = "vector.extract"(%52) <{static_position = array<i64: 2>}> : (vector<4x4xi32>) -> vector<4xi32>
    %56 = "vector.extract"(%52) <{static_position = array<i64: 3>}> : (vector<4x4xi32>) -> vector<4xi32>
    "vector.print"(%53) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "vector.print"(%54) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "vector.print"(%55) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "vector.print"(%56) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_usmmla"}> ({
    %19 = "arith.constant"() <{value = 0 : index}> : () -> index
    %20 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %21 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %22 = "arith.constant"() <{value = dense<[[-44, 20, 44, -46], [-8, 25, -34, 26], [-20, -36, -3, 39], [-48, -31, -25, -21]]> : vector<4x4xi32>}> : () -> vector<4x4xi32>
    %23 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xi32>
    "vector.transfer_write"(%22, %23, %19, %19) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xi32>, memref<4x4xi32>, index, index) -> ()
    %24 = "vector.transfer_read"(%23, %19, %19, %20) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xi32>, index, index, i32) -> vector<4x4xi32>
    %25 = "arith.constant"() <{value = dense<[[-103, -95, 24, -99, -45, -102, 52, 27], [-88, 77, -120, 124, -7, 28, 13, 122], [97, 82, -75, 39, 53, 25, 80, -16], [-72, -29, 106, -91, 126, 113, 121, -28]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %26 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi8>
    "vector.transfer_write"(%25, %26, %19, %19) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x8xi8>, memref<4x8xi8>, index, index) -> ()
    %27 = "vector.transfer_read"(%26, %19, %19, %21) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi8>, index, index, i8) -> vector<4x8xi8>
    %28 = "arith.constant"() <{value = dense<[[40, 27, 37, 43, 38, -6, 37, 49], [-17, -50, -1, 48, -13, 22, 39, 33], [-35, -24, 37, -32, 33, 30, -11, -17], [-28, 31, 3, -44, -15, -27, 22, 35]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %29 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi8>
    "vector.transfer_write"(%28, %29, %19, %19) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x8xi8>, memref<4x8xi8>, index, index) -> ()
    %30 = "vector.transfer_read"(%29, %19, %19, %21) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi8>, index, index, i8) -> vector<4x8xi8>
    %31 = "arith.extui"(%27) : (vector<4x8xi8>) -> vector<4x8xi32>
    %32 = "arith.extsi"(%30) : (vector<4x8xi8>) -> vector<4x8xi32>
    %33 = "vector.contract"(%31, %32, %24) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map1, #map2, #map3], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<4x8xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(USMMLA):\0A"}> : () -> ()
    %34 = "vector.extract"(%33) <{static_position = array<i64: 0>}> : (vector<4x4xi32>) -> vector<4xi32>
    %35 = "vector.extract"(%33) <{static_position = array<i64: 1>}> : (vector<4x4xi32>) -> vector<4xi32>
    %36 = "vector.extract"(%33) <{static_position = array<i64: 2>}> : (vector<4x4xi32>) -> vector<4xi32>
    %37 = "vector.extract"(%33) <{static_position = array<i64: 3>}> : (vector<4x4xi32>) -> vector<4xi32>
    "vector.print"(%34) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "vector.print"(%35) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "vector.print"(%36) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "vector.print"(%37) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_summla"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %3 = "arith.constant"() <{value = dense<[[-44, 20, 44, -46], [-8, 25, -34, 26], [-20, -36, -3, 39], [-48, -31, -25, -21]]> : vector<4x4xi32>}> : () -> vector<4x4xi32>
    %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xi32>
    "vector.transfer_write"(%3, %4, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xi32>, memref<4x4xi32>, index, index) -> ()
    %5 = "vector.transfer_read"(%4, %0, %0, %1) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xi32>, index, index, i32) -> vector<4x4xi32>
    %6 = "arith.constant"() <{value = dense<[[-35, -27, -36, -31, 23, -34, -8, -33], [-20, 17, -32, -47, 37, 22, -7, -21], [-7, -35, 20, -4, 39, 46, -23, 40], [40, 27, 37, 43, 38, -6, 37, 49]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %7 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi8>
    "vector.transfer_write"(%6, %7, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x8xi8>, memref<4x8xi8>, index, index) -> ()
    %8 = "vector.transfer_read"(%7, %0, %0, %2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi8>, index, index, i8) -> vector<4x8xi8>
    %9 = "arith.constant"() <{value = dense<[[125, -85, -118, -69, 108, -81, 82, 99], [-35, 25, -92, 97, -100, -35, -38, -79], [-85, -96, -37, -65, -112, 45, -95, -46], [-33, -91, 123, 99, 108, 86, 37, 92]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %10 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi8>
    "vector.transfer_write"(%9, %10, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x8xi8>, memref<4x8xi8>, index, index) -> ()
    %11 = "vector.transfer_read"(%10, %0, %0, %2) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi8>, index, index, i8) -> vector<4x8xi8>
    %12 = "arith.extsi"(%8) : (vector<4x8xi8>) -> vector<4x8xi32>
    %13 = "arith.extui"(%11) : (vector<4x8xi8>) -> vector<4x8xi32>
    %14 = "vector.contract"(%12, %13, %5) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map1, #map2, #map3], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<4x8xi32>, vector<4x4xi32>) -> vector<4x4xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(SUMMLA (i.e. USMMLA transposed)):\0A"}> : () -> ()
    %15 = "vector.extract"(%14) <{static_position = array<i64: 0>}> : (vector<4x4xi32>) -> vector<4xi32>
    %16 = "vector.extract"(%14) <{static_position = array<i64: 1>}> : (vector<4x4xi32>) -> vector<4xi32>
    %17 = "vector.extract"(%14) <{static_position = array<i64: 2>}> : (vector<4x4xi32>) -> vector<4xi32>
    %18 = "vector.extract"(%14) <{static_position = array<i64: 3>}> : (vector<4x4xi32>) -> vector<4xi32>
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "func.call"() <{callee = @test_smmla}> : () -> ()
    "func.call"() <{callee = @test_ummla}> : () -> ()
    "func.call"() <{callee = @test_usmmla}> : () -> ()
    "func.call"() <{callee = @test_summla}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

