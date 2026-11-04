#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1)>
#map4 = affine_map<(d0, d1) -> (d0)>
#map5 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map6 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map7 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "dot_product_i32"}> ({
    %25 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %26 = "arith.constant"() <{value = dense<123> : vector<[4]xi32>}> : () -> vector<[4]xi32>
    %27 = "arith.constant"() <{value = dense<314> : vector<[4]xi32>}> : () -> vector<[4]xi32>
    %28 = "arith.constant"() <{value = dense<0> : vector<[4]xi32>}> : () -> vector<[4]xi32>
    %29 = "vector.contract"(%26, %27, %25) <{indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<[4]xi32>, vector<[4]xi32>, i32) -> i32
    %30 = "vector.vscale"() : () -> index
    %31 = "arith.index_cast"(%30) : (index) -> i32
    %32 = "arith.divui"(%29, %31) : (i32, i32) -> i32
    "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    %33 = "vector.contract"(%26, %28, %25) <{indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<[4]xi32>, vector<[4]xi32>, i32) -> i32
    "vector.print"(%33) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "matvec_i32"}> ({
    %15 = "arith.constant"() <{value = dense<0> : vector<3xi32>}> : () -> vector<3xi32>
    %16 = "arith.constant"() <{value = dense<123> : vector<3x[4]xi32>}> : () -> vector<3x[4]xi32>
    %17 = "arith.constant"() <{value = dense<314> : vector<[4]xi32>}> : () -> vector<[4]xi32>
    %18 = "arith.constant"() <{value = dense<0> : vector<[4]xi32>}> : () -> vector<[4]xi32>
    %19 = "vector.contract"(%16, %17, %15) <{indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3x[4]xi32>, vector<[4]xi32>, vector<3xi32>) -> vector<3xi32>
    %20 = "vector.vscale"() : () -> index
    %21 = "vector.broadcast"(%20) : (index) -> vector<3xindex>
    %22 = "arith.index_cast"(%21) : (vector<3xindex>) -> vector<3xi32>
    %23 = "arith.divui"(%19, %22) : (vector<3xi32>, vector<3xi32>) -> vector<3xi32>
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<3xi32>) -> ()
    %24 = "vector.contract"(%16, %18, %15) <{indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3x[4]xi32>, vector<[4]xi32>, vector<3xi32>) -> vector<3xi32>
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<3xi32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "matmul_i32"}> ({
    %8 = "arith.constant"() <{value = dense<123> : vector<3x5xi32>}> : () -> vector<3x5xi32>
    %9 = "arith.constant"() <{value = dense<123> : vector<5x[2]xi32>}> : () -> vector<5x[2]xi32>
    %10 = "arith.constant"() <{value = dense<314> : vector<3x[2]xi32>}> : () -> vector<3x[2]xi32>
    %11 = "vector.contract"(%8, %9, %10) <{indexing_maps = [#map5, #map6, #map7], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3x5xi32>, vector<5x[2]xi32>, vector<3x[2]xi32>) -> vector<3x[2]xi32>
    %12 = "vector.extract"(%11) <{static_position = array<i64: 0>}> : (vector<3x[2]xi32>) -> vector<[2]xi32>
    "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xi32>) -> ()
    %13 = "vector.extract"(%11) <{static_position = array<i64: 1>}> : (vector<3x[2]xi32>) -> vector<[2]xi32>
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xi32>) -> ()
    %14 = "vector.extract"(%11) <{static_position = array<i64: 2>}> : (vector<3x[2]xi32>) -> vector<[2]xi32>
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xi32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "matmul_f32"}> ({
    %1 = "arith.constant"() <{value = dense<1.230000e+00> : vector<3x5xf32>}> : () -> vector<3x5xf32>
    %2 = "arith.constant"() <{value = dense<1.230000e+00> : vector<5x[2]xf32>}> : () -> vector<5x[2]xf32>
    %3 = "arith.constant"() <{value = dense<3.140000e+00> : vector<3x[2]xf32>}> : () -> vector<3x[2]xf32>
    %4 = "vector.contract"(%1, %2, %3) <{indexing_maps = [#map5, #map6, #map7], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3x5xf32>, vector<5x[2]xf32>, vector<3x[2]xf32>) -> vector<3x[2]xf32>
    %5 = "vector.extract"(%4) <{static_position = array<i64: 0>}> : (vector<3x[2]xf32>) -> vector<[2]xf32>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xf32>) -> ()
    %6 = "vector.extract"(%4) <{static_position = array<i64: 1>}> : (vector<3x[2]xf32>) -> vector<[2]xf32>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xf32>) -> ()
    %7 = "vector.extract"(%4) <{static_position = array<i64: 2>}> : (vector<3x[2]xf32>) -> vector<[2]xf32>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<[2]xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "SVE: END OF TEST OUTPUT"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.lower_contraction"() <{lowering_strategy = 2 : i32}> : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

