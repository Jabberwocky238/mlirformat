#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1)>
#map4 = affine_map<(d0, d1) -> (d0)>
#map5 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map6 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map7 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @dot_product_i32() {
    %c0_i32 = arith.constant 0 : i32
    %cst = arith.constant dense<123> : vector<[4]xi32>
    %cst_0 = arith.constant dense<314> : vector<[4]xi32>
    %cst_1 = arith.constant dense<0> : vector<[4]xi32>
    %0 = vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["reduction"], kind = #vector.kind<add>} %cst, %cst_0, %c0_i32 : vector<[4]xi32>, vector<[4]xi32> into i32
    %vscale = vector.vscale
    %1 = arith.index_cast %vscale : index to i32
    %2 = arith.divui %0, %1 : i32
    vector.print %2 : i32
    %3 = vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["reduction"], kind = #vector.kind<add>} %cst, %cst_1, %c0_i32 : vector<[4]xi32>, vector<[4]xi32> into i32
    vector.print %3 : i32
    vector.print str "SVE: END OF TEST OUTPUT"
    return
  }
  func.func @matvec_i32() {
    %cst = arith.constant dense<0> : vector<3xi32>
    %cst_0 = arith.constant dense<123> : vector<3x[4]xi32>
    %cst_1 = arith.constant dense<314> : vector<[4]xi32>
    %cst_2 = arith.constant dense<0> : vector<[4]xi32>
    %0 = vector.contract {indexing_maps = [#map2, #map3, #map4], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %cst_0, %cst_1, %cst : vector<3x[4]xi32>, vector<[4]xi32> into vector<3xi32>
    %vscale = vector.vscale
    %1 = vector.broadcast %vscale : index to vector<3xindex>
    %2 = arith.index_cast %1 : vector<3xindex> to vector<3xi32>
    %3 = arith.divui %0, %2 : vector<3xi32>
    vector.print %3 : vector<3xi32>
    %4 = vector.contract {indexing_maps = [#map2, #map3, #map4], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %cst_0, %cst_2, %cst : vector<3x[4]xi32>, vector<[4]xi32> into vector<3xi32>
    vector.print %4 : vector<3xi32>
    vector.print str "SVE: END OF TEST OUTPUT"
    return
  }
  func.func @matmul_i32() {
    %cst = arith.constant dense<123> : vector<3x5xi32>
    %cst_0 = arith.constant dense<123> : vector<5x[2]xi32>
    %cst_1 = arith.constant dense<314> : vector<3x[2]xi32>
    %0 = vector.contract {indexing_maps = [#map5, #map6, #map7], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %cst, %cst_0, %cst_1 : vector<3x5xi32>, vector<5x[2]xi32> into vector<3x[2]xi32>
    %1 = vector.extract %0[0] : vector<[2]xi32> from vector<3x[2]xi32>
    vector.print %1 : vector<[2]xi32>
    %2 = vector.extract %0[1] : vector<[2]xi32> from vector<3x[2]xi32>
    vector.print %2 : vector<[2]xi32>
    %3 = vector.extract %0[2] : vector<[2]xi32> from vector<3x[2]xi32>
    vector.print %3 : vector<[2]xi32>
    vector.print str "SVE: END OF TEST OUTPUT"
    return
  }
  func.func @matmul_f32() {
    %cst = arith.constant dense<1.230000e+00> : vector<3x5xf32>
    %cst_0 = arith.constant dense<1.230000e+00> : vector<5x[2]xf32>
    %cst_1 = arith.constant dense<3.140000e+00> : vector<3x[2]xf32>
    %0 = vector.contract {indexing_maps = [#map5, #map6, #map7], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %cst, %cst_0, %cst_1 : vector<3x5xf32>, vector<5x[2]xf32> into vector<3x[2]xf32>
    %1 = vector.extract %0[0] : vector<[2]xf32> from vector<3x[2]xf32>
    vector.print %1 : vector<[2]xf32>
    %2 = vector.extract %0[1] : vector<[2]xf32> from vector<3x[2]xf32>
    vector.print %2 : vector<[2]xf32>
    %3 = vector.extract %0[2] : vector<[2]xf32> from vector<3x[2]xf32>
    vector.print %3 : vector<[2]xf32>
    vector.print str "SVE: END OF TEST OUTPUT"
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.lower_contraction
      } : !transform.any_op
      transform.yield 
    }
  }
}

