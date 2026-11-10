#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x4xi32>) -> memref<4x?xi32>, sym_name = "prepareAccTestData", sym_visibility = "private"}> ({
  ^bb0(%arg3: vector<4x4xi32>):
    %93 = "arith.constant"() <{value = 0 : index}> : () -> index
    %94 = "arith.constant"() <{value = 1 : index}> : () -> index
    %95 = "arith.constant"() <{value = 4 : index}> : () -> index
    %96 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %97 = "vector.vscale"() : () -> index
    %98 = "arith.muli"(%95, %97) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %99 = "memref.alloc"(%98) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<4x?xi32>
    "scf.for"(%93, %98, %95) ({
    ^bb0(%arg4: index):
      "vector.transfer_write"(%arg3, %99, %93, %arg4) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xi32>, memref<4x?xi32>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"(%99) : (memref<4x?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x8xi8>) -> memref<4x8xi8>, sym_name = "prepareLHSTestData", sym_visibility = "private"}> ({
  ^bb0(%arg2: vector<4x8xi8>):
    %90 = "arith.constant"() <{value = 0 : index}> : () -> index
    %91 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %92 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x8xi8>
    "vector.transfer_write"(%arg2, %92, %90, %90) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x8xi8>, memref<4x8xi8>, index, index) -> ()
    "func.return"(%92) : (memref<4x8xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x8xi8>) -> memref<?xi8>, sym_name = "prepareRHSTestData", sym_visibility = "private"}> ({
  ^bb0(%arg0: vector<4x8xi8>):
    %82 = "arith.constant"() <{value = 0 : index}> : () -> index
    %83 = "arith.constant"() <{value = 1 : index}> : () -> index
    %84 = "arith.constant"() <{value = 4 : index}> : () -> index
    %85 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %86 = "vector.vscale"() : () -> index
    %87 = "arith.muli"(%84, %86) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %88 = "memref.alloc"(%87) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?x8xi8>
    "scf.for"(%82, %87, %84) ({
    ^bb0(%arg1: index):
      "vector.transfer_write"(%arg0, %88, %arg1, %82) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x8xi8>, memref<?x8xi8>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %89 = "memref.collapse_shape"(%88) <{reassociation = [[0, 1]]}> : (memref<?x8xi8>) -> memref<?xi8>
    "func.return"(%89) : (memref<?xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), no_inline, sym_name = "test_smmla"}> ({
    %62 = "arith.constant"() <{value = 0 : index}> : () -> index
    %63 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %64 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %65 = "arith.constant"() <{value = dense<[[-44, 20, 44, -46], [-8, 25, -34, 26], [-20, -36, -3, 39], [-48, -31, -25, -21]]> : vector<4x4xi32>}> : () -> vector<4x4xi32>
    %66 = "func.call"(%65) <{callee = @prepareAccTestData}> : (vector<4x4xi32>) -> memref<4x?xi32>
    %67 = "vector.transfer_read"(%66, %62, %62, %63) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x?xi32>, index, index, i32) -> vector<4x[4]xi32>
    %68 = "arith.constant"() <{value = dense<[[-35, -27, -36, -31, 23, -34, -8, -33], [-20, 17, -32, -47, 37, 22, -7, -21], [-7, -35, 20, -4, 39, 46, -23, 40], [40, 27, 37, 43, 38, -6, 37, 49]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %69 = "func.call"(%68) <{callee = @prepareLHSTestData}> : (vector<4x8xi8>) -> memref<4x8xi8>
    %70 = "vector.transfer_read"(%69, %62, %62, %64) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi8>, index, index, i8) -> vector<4x8xi8>
    %71 = "arith.constant"() <{value = dense<[[-17, -50, -1, 48, -13, 22, 39, 33], [-35, -24, 37, -32, 33, 30, -11, -17], [-28, 31, 3, -44, -15, -27, 22, 35], [-23, 39, 48, 26, -23, 32, -39, -38]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %72 = "func.call"(%71) <{callee = @prepareRHSTestData}> : (vector<4x8xi8>) -> memref<?xi8>
    %73 = "vector.transfer_read"(%72, %62, %64) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi8>, index, i8) -> vector<[32]xi8>
    %74 = "vector.shape_cast"(%73) : (vector<[32]xi8>) -> vector<[4]x8xi8>
    %75 = "arith.extsi"(%70) : (vector<4x8xi8>) -> vector<4x8xi32>
    %76 = "arith.extsi"(%74) : (vector<[4]x8xi8>) -> vector<[4]x8xi32>
    %77 = "vector.contract"(%75, %76, %67) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<[4]x8xi32>, vector<4x[4]xi32>) -> vector<4x[4]xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(SMMLA):\0A"}> : () -> ()
    %78 = "vector.extract"(%77) <{static_position = array<i64: 0>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    %79 = "vector.extract"(%77) <{static_position = array<i64: 1>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    %80 = "vector.extract"(%77) <{static_position = array<i64: 2>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    %81 = "vector.extract"(%77) <{static_position = array<i64: 3>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    "vector.print"(%78) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "vector.print"(%79) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "vector.print"(%80) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "vector.print"(%81) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "memref.dealloc"(%66) : (memref<4x?xi32>) -> ()
    "memref.dealloc"(%69) : (memref<4x8xi8>) -> ()
    "memref.dealloc"(%72) : (memref<?xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), no_inline, sym_name = "test_ummla"}> ({
    %42 = "arith.constant"() <{value = 0 : index}> : () -> index
    %43 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %44 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %45 = "arith.constant"() <{value = dense<[[16, 16, 48, 40], [40, 24, 35, 12], [33, 24, 29, 19], [28, 13, 33, 18]]> : vector<4x4xi32>}> : () -> vector<4x4xi32>
    %46 = "func.call"(%45) <{callee = @prepareAccTestData}> : (vector<4x4xi32>) -> memref<4x?xi32>
    %47 = "vector.transfer_read"(%46, %42, %42, %43) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x?xi32>, index, index, i32) -> vector<4x[4]xi32>
    %48 = "arith.constant"() <{value = dense<[[35, 42, 37, 49, 36, 36, 23, 33], [39, 34, 33, 45, 43, 10, 44, 47], [18, 35, 29, 25, 36, 33, 28, 29], [26, 49, 43, 32, 27, 16, 45, 33]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %49 = "func.call"(%48) <{callee = @prepareLHSTestData}> : (vector<4x8xi8>) -> memref<4x8xi8>
    %50 = "vector.transfer_read"(%49, %42, %42, %44) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi8>, index, index, i8) -> vector<4x8xi8>
    %51 = "arith.constant"() <{value = dense<[[18, 31, 37, 35, 44, 22, 37, 28], [21, 22, 49, 39, 30, 28, 35, 37], [21, 47, 39, 35, 23, 43, 24, 49], [49, 49, 40, 32, 37, 20, 47, 40]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %52 = "func.call"(%51) <{callee = @prepareRHSTestData}> : (vector<4x8xi8>) -> memref<?xi8>
    %53 = "vector.transfer_read"(%52, %42, %44) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi8>, index, i8) -> vector<[32]xi8>
    %54 = "vector.shape_cast"(%53) : (vector<[32]xi8>) -> vector<[4]x8xi8>
    %55 = "arith.extui"(%50) : (vector<4x8xi8>) -> vector<4x8xi32>
    %56 = "arith.extui"(%54) : (vector<[4]x8xi8>) -> vector<[4]x8xi32>
    %57 = "vector.contract"(%55, %56, %47) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<[4]x8xi32>, vector<4x[4]xi32>) -> vector<4x[4]xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(UMMLA):\0A"}> : () -> ()
    %58 = "vector.extract"(%57) <{static_position = array<i64: 0>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    %59 = "vector.extract"(%57) <{static_position = array<i64: 1>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    %60 = "vector.extract"(%57) <{static_position = array<i64: 2>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    %61 = "vector.extract"(%57) <{static_position = array<i64: 3>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    "vector.print"(%58) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "vector.print"(%59) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "vector.print"(%60) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "vector.print"(%61) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "memref.dealloc"(%46) : (memref<4x?xi32>) -> ()
    "memref.dealloc"(%49) : (memref<4x8xi8>) -> ()
    "memref.dealloc"(%52) : (memref<?xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), no_inline, sym_name = "test_usmmla"}> ({
    %22 = "arith.constant"() <{value = 0 : index}> : () -> index
    %23 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %24 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %25 = "arith.constant"() <{value = dense<[[-44, 20, 44, -46], [-8, 25, -34, 26], [-20, -36, -3, 39], [-48, -31, -25, -21]]> : vector<4x4xi32>}> : () -> vector<4x4xi32>
    %26 = "func.call"(%25) <{callee = @prepareAccTestData}> : (vector<4x4xi32>) -> memref<4x?xi32>
    %27 = "vector.transfer_read"(%26, %22, %22, %23) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x?xi32>, index, index, i32) -> vector<4x[4]xi32>
    %28 = "arith.constant"() <{value = dense<[[-103, -95, 24, -99, -45, -102, 52, 27], [-88, 77, -120, 124, -7, 28, 13, 122], [97, 82, -75, 39, 53, 25, 80, -16], [-72, -29, 106, -91, 126, 113, 121, -28]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %29 = "func.call"(%28) <{callee = @prepareLHSTestData}> : (vector<4x8xi8>) -> memref<4x8xi8>
    %30 = "vector.transfer_read"(%29, %22, %22, %24) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi8>, index, index, i8) -> vector<4x8xi8>
    %31 = "arith.constant"() <{value = dense<[[40, 27, 37, 43, 38, -6, 37, 49], [-17, -50, -1, 48, -13, 22, 39, 33], [-35, -24, 37, -32, 33, 30, -11, -17], [-28, 31, 3, -44, -15, -27, 22, 35]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %32 = "func.call"(%31) <{callee = @prepareRHSTestData}> : (vector<4x8xi8>) -> memref<?xi8>
    %33 = "vector.transfer_read"(%32, %22, %24) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi8>, index, i8) -> vector<[32]xi8>
    %34 = "vector.shape_cast"(%33) : (vector<[32]xi8>) -> vector<[4]x8xi8>
    %35 = "arith.extui"(%30) : (vector<4x8xi8>) -> vector<4x8xi32>
    %36 = "arith.extsi"(%34) : (vector<[4]x8xi8>) -> vector<[4]x8xi32>
    %37 = "vector.contract"(%35, %36, %27) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<[4]x8xi32>, vector<4x[4]xi32>) -> vector<4x[4]xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(USMMLA):\0A"}> : () -> ()
    %38 = "vector.extract"(%37) <{static_position = array<i64: 0>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    %39 = "vector.extract"(%37) <{static_position = array<i64: 1>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    %40 = "vector.extract"(%37) <{static_position = array<i64: 2>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    %41 = "vector.extract"(%37) <{static_position = array<i64: 3>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    "vector.print"(%38) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "vector.print"(%39) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "vector.print"(%40) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "vector.print"(%41) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "memref.dealloc"(%26) : (memref<4x?xi32>) -> ()
    "memref.dealloc"(%29) : (memref<4x8xi8>) -> ()
    "memref.dealloc"(%32) : (memref<?xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), no_inline, sym_name = "test_summla"}> ({
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %5 = "arith.constant"() <{value = dense<[[-44, 20, 44, -46], [-8, 25, -34, 26], [-20, -36, -3, 39], [-48, -31, -25, -21]]> : vector<4x4xi32>}> : () -> vector<4x4xi32>
    %6 = "func.call"(%5) <{callee = @prepareAccTestData}> : (vector<4x4xi32>) -> memref<4x?xi32>
    %7 = "vector.transfer_read"(%6, %2, %2, %3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x?xi32>, index, index, i32) -> vector<4x[4]xi32>
    %8 = "arith.constant"() <{value = dense<[[-35, -27, -36, -31, 23, -34, -8, -33], [-20, 17, -32, -47, 37, 22, -7, -21], [-7, -35, 20, -4, 39, 46, -23, 40], [40, 27, 37, 43, 38, -6, 37, 49]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %9 = "func.call"(%8) <{callee = @prepareLHSTestData}> : (vector<4x8xi8>) -> memref<4x8xi8>
    %10 = "vector.transfer_read"(%9, %2, %2, %4) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x8xi8>, index, index, i8) -> vector<4x8xi8>
    %11 = "arith.constant"() <{value = dense<[[125, -85, -118, -69, 108, -81, 82, 99], [-35, 25, -92, 97, -100, -35, -38, -79], [-85, -96, -37, -65, -112, 45, -95, -46], [-33, -91, 123, 99, 108, 86, 37, 92]]> : vector<4x8xi8>}> : () -> vector<4x8xi8>
    %12 = "func.call"(%11) <{callee = @prepareRHSTestData}> : (vector<4x8xi8>) -> memref<?xi8>
    %13 = "vector.transfer_read"(%12, %2, %4) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xi8>, index, i8) -> vector<[32]xi8>
    %14 = "vector.shape_cast"(%13) : (vector<[32]xi8>) -> vector<[4]x8xi8>
    %15 = "arith.extsi"(%10) : (vector<4x8xi8>) -> vector<4x8xi32>
    %16 = "arith.extui"(%14) : (vector<[4]x8xi8>) -> vector<[4]x8xi32>
    %17 = "vector.contract"(%15, %16, %7) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x8xi32>, vector<[4]x8xi32>, vector<4x[4]xi32>) -> vector<4x[4]xi32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(SUMMLA (i.e. USMMLA transposed)):\0A"}> : () -> ()
    %18 = "vector.extract"(%17) <{static_position = array<i64: 0>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    %19 = "vector.extract"(%17) <{static_position = array<i64: 1>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    %20 = "vector.extract"(%17) <{static_position = array<i64: 2>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    %21 = "vector.extract"(%17) <{static_position = array<i64: 3>}> : (vector<4x[4]xi32>) -> vector<[4]xi32>
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xi32>) -> ()
    "memref.dealloc"(%6) : (memref<4x?xi32>) -> ()
    "memref.dealloc"(%9) : (memref<4x8xi8>) -> ()
    "memref.dealloc"(%12) : (memref<?xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 128 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 256 : i32}> : () -> i32
    "func.call"(%0) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"() <{callee = @test_smmla}> : () -> ()
    "func.call"(%1) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"() <{callee = @test_smmla}> : () -> ()
    "func.call"(%0) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"() <{callee = @test_ummla}> : () -> ()
    "func.call"(%1) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"() <{callee = @test_ummla}> : () -> ()
    "func.call"(%0) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"() <{callee = @test_usmmla}> : () -> ()
    "func.call"(%1) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"() <{callee = @test_usmmla}> : () -> ()
    "func.call"(%0) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"() <{callee = @test_summla}> : () -> ()
    "func.call"(%1) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"() <{callee = @test_summla}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmVLBits", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

