#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1)>
#map4 = affine_map<(d0, d1) -> (d0)>
#map5 = affine_map<(d0, d1) -> (d1, d0)>
#map6 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map7 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map8 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map9 = affine_map<(d0, d1, d2) -> (d1, d0)>
#map10 = affine_map<(d0, d1, d2) -> (d2, d0)>
#map11 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map12 = affine_map<(d0, d1) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 6.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %8 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %9 = "vector.broadcast"(%0) : (f32) -> vector<2xf32>
    %10 = "vector.broadcast"(%0) : (f32) -> vector<2x2xf32>
    %11 = "vector.broadcast"(%0) : (f32) -> vector<3x4xf32>
    %12 = "vector.broadcast"(%1) : (f32) -> vector<2xf32>
    %13 = "vector.insert"(%2, %12) <{static_position = array<i64: 1>}> : (f32, vector<2xf32>) -> vector<2xf32>
    %14 = "vector.broadcast"(%3) : (f32) -> vector<2xf32>
    %15 = "vector.insert"(%4, %14) <{static_position = array<i64: 1>}> : (f32, vector<2xf32>) -> vector<2xf32>
    %16 = "vector.broadcast"(%5) : (f32) -> vector<2xf32>
    %17 = "vector.insert"(%6, %16) <{static_position = array<i64: 1>}> : (f32, vector<2xf32>) -> vector<2xf32>
    %18 = "vector.broadcast"(%7) : (f32) -> vector<2xf32>
    %19 = "vector.insert"(%8, %18) <{static_position = array<i64: 1>}> : (f32, vector<2xf32>) -> vector<2xf32>
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    %20 = "vector.broadcast"(%0) : (f32) -> vector<2x2xf32>
    %21 = "vector.insert"(%13, %20) <{static_position = array<i64: 0>}> : (vector<2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %22 = "vector.insert"(%15, %21) <{static_position = array<i64: 1>}> : (vector<2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %23 = "vector.broadcast"(%0) : (f32) -> vector<2x2xf32>
    %24 = "vector.insert"(%17, %23) <{static_position = array<i64: 0>}> : (vector<2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %25 = "vector.insert"(%19, %24) <{static_position = array<i64: 1>}> : (vector<2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %26 = "vector.broadcast"(%0) : (f32) -> vector<3x2xf32>
    %27 = "vector.insert"(%13, %26) <{static_position = array<i64: 0>}> : (vector<2xf32>, vector<3x2xf32>) -> vector<3x2xf32>
    %28 = "vector.insert"(%15, %27) <{static_position = array<i64: 1>}> : (vector<2xf32>, vector<3x2xf32>) -> vector<3x2xf32>
    %29 = "vector.insert"(%17, %28) <{static_position = array<i64: 2>}> : (vector<2xf32>, vector<3x2xf32>) -> vector<3x2xf32>
    %30 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2x4xf32>}> : () -> vector<2x4xf32>
    %31 = "vector.insert_strided_slice"(%22, %30) <{offsets = [0, 0], strides = [1, 1]}> : (vector<2x2xf32>, vector<2x4xf32>) -> vector<2x4xf32>
    %32 = "vector.insert_strided_slice"(%25, %31) <{offsets = [0, 2], strides = [1, 1]}> : (vector<2x2xf32>, vector<2x4xf32>) -> vector<2x4xf32>
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    "vector.print"(%25) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2xf32>) -> ()
    "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (vector<2x4xf32>) -> ()
    %33 = "vector.contract"(%13, %15, %0) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<2xf32>, f32) -> f32
    %34 = "vector.contract"(%13, %15, %1) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2xf32>, vector<2xf32>, f32) -> f32
    "vector.print"(%33) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "vector.print"(%34) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    %35 = "vector.contract"(%22, %17, %9) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %36 = "vector.contract"(%22, %17, %13) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "vector.print"(%35) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    "vector.print"(%36) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    %37 = "vector.contract"(%22, %17, %9) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map5, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    %38 = "vector.contract"(%22, %17, %13) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map5, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2xf32>, vector<2xf32>) -> vector<2xf32>
    "vector.print"(%37) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    "vector.print"(%38) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    %39 = "vector.contract"(%22, %25, %10) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map6, #map7, #map8], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %40 = "vector.contract"(%22, %25, %22) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map6, #map7, #map8], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    "vector.print"(%39) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    "vector.print"(%40) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    %41 = "vector.contract"(%22, %25, %10) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map7, #map6, #map9], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %42 = "vector.contract"(%22, %25, %22) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map7, #map6, #map9], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    "vector.print"(%41) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    "vector.print"(%42) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    %43 = "vector.contract"(%22, %25, %10) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map10, #map7, #map8], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %44 = "vector.contract"(%22, %25, %22) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map10, #map7, #map8], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    "vector.print"(%43) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    "vector.print"(%44) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    %45 = "vector.contract"(%22, %25, %10) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map6, #map11, #map8], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %46 = "vector.contract"(%22, %25, %22) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map6, #map11, #map8], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    "vector.print"(%45) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    "vector.print"(%46) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    %47 = "vector.contract"(%22, %25, %10) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map10, #map11, #map8], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %48 = "vector.contract"(%22, %25, %22) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map10, #map11, #map8], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    "vector.print"(%47) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    "vector.print"(%48) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    %49 = "vector.contract"(%22, %25, %10) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map6, #map7, #map9], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %50 = "vector.contract"(%22, %25, %22) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map6, #map7, #map9], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    "vector.print"(%49) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    "vector.print"(%50) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    %51 = "vector.contract"(%29, %32, %11) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map6, #map7, #map8], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3x2xf32>, vector<2x4xf32>, vector<3x4xf32>) -> vector<3x4xf32>
    %52 = "vector.contract"(%29, %32, %51) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map6, #map7, #map8], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3x2xf32>, vector<2x4xf32>, vector<3x4xf32>) -> vector<3x4xf32>
    "vector.print"(%51) <{punctuation = #vector.punctuation<newline>}> : (vector<3x4xf32>) -> ()
    "vector.print"(%52) <{punctuation = #vector.punctuation<newline>}> : (vector<3x4xf32>) -> ()
    %53 = "vector.contract"(%22, %25, %0) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map2, #map2, #map12], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, f32) -> f32
    %54 = "vector.contract"(%22, %25, %1) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map2, #map2, #map12], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, f32) -> f32
    %55 = "vector.contract"(%22, %25, %0) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map5, #map5, #map12], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, f32) -> f32
    %56 = "vector.contract"(%22, %25, %1) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map5, #map5, #map12], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, f32) -> f32
    %57 = "vector.contract"(%22, %25, %0) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map2, #map5, #map12], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, f32) -> f32
    %58 = "vector.contract"(%22, %25, %1) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map2, #map5, #map12], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, f32) -> f32
    %59 = "vector.contract"(%22, %25, %0) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map5, #map2, #map12], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, f32) -> f32
    %60 = "vector.contract"(%22, %25, %1) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map5, #map2, #map12], iterator_types = [#vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<2x2xf32>, vector<2x2xf32>, f32) -> f32
    "vector.print"(%53) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "vector.print"(%54) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "vector.print"(%55) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "vector.print"(%56) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "vector.print"(%57) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "vector.print"(%58) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "vector.print"(%59) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "vector.print"(%60) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

