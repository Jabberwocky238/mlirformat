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
module {
  func.func @entry() {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %cst_2 = arith.constant 3.000000e+00 : f32
    %cst_3 = arith.constant 4.000000e+00 : f32
    %cst_4 = arith.constant 5.000000e+00 : f32
    %cst_5 = arith.constant 6.000000e+00 : f32
    %cst_6 = arith.constant 7.000000e+00 : f32
    %cst_7 = arith.constant 8.000000e+00 : f32
    %0 = vector.broadcast %cst : f32 to vector<2xf32>
    %1 = vector.broadcast %cst : f32 to vector<2x2xf32>
    %2 = vector.broadcast %cst : f32 to vector<3x4xf32>
    %3 = vector.broadcast %cst_0 : f32 to vector<2xf32>
    %4 = vector.insert %cst_1, %3 [1] : f32 into vector<2xf32>
    %5 = vector.broadcast %cst_2 : f32 to vector<2xf32>
    %6 = vector.insert %cst_3, %5 [1] : f32 into vector<2xf32>
    %7 = vector.broadcast %cst_4 : f32 to vector<2xf32>
    %8 = vector.insert %cst_5, %7 [1] : f32 into vector<2xf32>
    %9 = vector.broadcast %cst_6 : f32 to vector<2xf32>
    %10 = vector.insert %cst_7, %9 [1] : f32 into vector<2xf32>
    vector.print %4 : vector<2xf32>
    vector.print %6 : vector<2xf32>
    vector.print %8 : vector<2xf32>
    vector.print %10 : vector<2xf32>
    %11 = vector.broadcast %cst : f32 to vector<2x2xf32>
    %12 = vector.insert %4, %11 [0] : vector<2xf32> into vector<2x2xf32>
    %13 = vector.insert %6, %12 [1] : vector<2xf32> into vector<2x2xf32>
    %14 = vector.broadcast %cst : f32 to vector<2x2xf32>
    %15 = vector.insert %8, %14 [0] : vector<2xf32> into vector<2x2xf32>
    %16 = vector.insert %10, %15 [1] : vector<2xf32> into vector<2x2xf32>
    %17 = vector.broadcast %cst : f32 to vector<3x2xf32>
    %18 = vector.insert %4, %17 [0] : vector<2xf32> into vector<3x2xf32>
    %19 = vector.insert %6, %18 [1] : vector<2xf32> into vector<3x2xf32>
    %20 = vector.insert %8, %19 [2] : vector<2xf32> into vector<3x2xf32>
    %cst_8 = arith.constant dense<0.000000e+00> : vector<2x4xf32>
    %21 = vector.insert_strided_slice %13, %cst_8 {offsets = [0, 0], strides = [1, 1]} : vector<2x2xf32> into vector<2x4xf32>
    %22 = vector.insert_strided_slice %16, %21 {offsets = [0, 2], strides = [1, 1]} : vector<2x2xf32> into vector<2x4xf32>
    vector.print %13 : vector<2x2xf32>
    vector.print %16 : vector<2x2xf32>
    vector.print %20 : vector<3x2xf32>
    vector.print %22 : vector<2x4xf32>
    %23 = vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["reduction"], kind = #vector.kind<add>} %4, %6, %cst : vector<2xf32>, vector<2xf32> into f32
    %24 = vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["reduction"], kind = #vector.kind<add>} %4, %6, %cst_0 : vector<2xf32>, vector<2xf32> into f32
    vector.print %23 : f32
    vector.print %24 : f32
    %25 = vector.contract {indexing_maps = [#map2, #map3, #map4], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %13, %8, %0 : vector<2x2xf32>, vector<2xf32> into vector<2xf32>
    %26 = vector.contract {indexing_maps = [#map2, #map3, #map4], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %13, %8, %4 : vector<2x2xf32>, vector<2xf32> into vector<2xf32>
    vector.print %25 : vector<2xf32>
    vector.print %26 : vector<2xf32>
    %27 = vector.contract {indexing_maps = [#map5, #map3, #map4], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %13, %8, %0 : vector<2x2xf32>, vector<2xf32> into vector<2xf32>
    %28 = vector.contract {indexing_maps = [#map5, #map3, #map4], iterator_types = ["parallel", "reduction"], kind = #vector.kind<add>} %13, %8, %4 : vector<2x2xf32>, vector<2xf32> into vector<2xf32>
    vector.print %27 : vector<2xf32>
    vector.print %28 : vector<2xf32>
    %29 = vector.contract {indexing_maps = [#map6, #map7, #map8], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %16, %1 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    %30 = vector.contract {indexing_maps = [#map6, #map7, #map8], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %16, %13 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    vector.print %29 : vector<2x2xf32>
    vector.print %30 : vector<2x2xf32>
    %31 = vector.contract {indexing_maps = [#map7, #map6, #map9], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %16, %1 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    %32 = vector.contract {indexing_maps = [#map7, #map6, #map9], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %16, %13 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    vector.print %31 : vector<2x2xf32>
    vector.print %32 : vector<2x2xf32>
    %33 = vector.contract {indexing_maps = [#map10, #map7, #map8], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %16, %1 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    %34 = vector.contract {indexing_maps = [#map10, #map7, #map8], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %16, %13 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    vector.print %33 : vector<2x2xf32>
    vector.print %34 : vector<2x2xf32>
    %35 = vector.contract {indexing_maps = [#map6, #map11, #map8], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %16, %1 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    %36 = vector.contract {indexing_maps = [#map6, #map11, #map8], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %16, %13 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    vector.print %35 : vector<2x2xf32>
    vector.print %36 : vector<2x2xf32>
    %37 = vector.contract {indexing_maps = [#map10, #map11, #map8], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %16, %1 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    %38 = vector.contract {indexing_maps = [#map10, #map11, #map8], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %16, %13 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    vector.print %37 : vector<2x2xf32>
    vector.print %38 : vector<2x2xf32>
    %39 = vector.contract {indexing_maps = [#map6, #map7, #map9], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %16, %1 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    %40 = vector.contract {indexing_maps = [#map6, #map7, #map9], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %13, %16, %13 : vector<2x2xf32>, vector<2x2xf32> into vector<2x2xf32>
    vector.print %39 : vector<2x2xf32>
    vector.print %40 : vector<2x2xf32>
    %41 = vector.contract {indexing_maps = [#map6, #map7, #map8], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %20, %22, %2 : vector<3x2xf32>, vector<2x4xf32> into vector<3x4xf32>
    %42 = vector.contract {indexing_maps = [#map6, #map7, #map8], iterator_types = ["parallel", "parallel", "reduction"], kind = #vector.kind<add>} %20, %22, %41 : vector<3x2xf32>, vector<2x4xf32> into vector<3x4xf32>
    vector.print %41 : vector<3x4xf32>
    vector.print %42 : vector<3x4xf32>
    %43 = vector.contract {indexing_maps = [#map2, #map2, #map12], iterator_types = ["reduction", "reduction"], kind = #vector.kind<add>} %13, %16, %cst : vector<2x2xf32>, vector<2x2xf32> into f32
    %44 = vector.contract {indexing_maps = [#map2, #map2, #map12], iterator_types = ["reduction", "reduction"], kind = #vector.kind<add>} %13, %16, %cst_0 : vector<2x2xf32>, vector<2x2xf32> into f32
    %45 = vector.contract {indexing_maps = [#map5, #map5, #map12], iterator_types = ["reduction", "reduction"], kind = #vector.kind<add>} %13, %16, %cst : vector<2x2xf32>, vector<2x2xf32> into f32
    %46 = vector.contract {indexing_maps = [#map5, #map5, #map12], iterator_types = ["reduction", "reduction"], kind = #vector.kind<add>} %13, %16, %cst_0 : vector<2x2xf32>, vector<2x2xf32> into f32
    %47 = vector.contract {indexing_maps = [#map2, #map5, #map12], iterator_types = ["reduction", "reduction"], kind = #vector.kind<add>} %13, %16, %cst : vector<2x2xf32>, vector<2x2xf32> into f32
    %48 = vector.contract {indexing_maps = [#map2, #map5, #map12], iterator_types = ["reduction", "reduction"], kind = #vector.kind<add>} %13, %16, %cst_0 : vector<2x2xf32>, vector<2x2xf32> into f32
    %49 = vector.contract {indexing_maps = [#map5, #map2, #map12], iterator_types = ["reduction", "reduction"], kind = #vector.kind<add>} %13, %16, %cst : vector<2x2xf32>, vector<2x2xf32> into f32
    %50 = vector.contract {indexing_maps = [#map5, #map2, #map12], iterator_types = ["reduction", "reduction"], kind = #vector.kind<add>} %13, %16, %cst_0 : vector<2x2xf32>, vector<2x2xf32> into f32
    vector.print %43 : f32
    vector.print %44 : f32
    vector.print %45 : f32
    vector.print %46 : f32
    vector.print %47 : f32
    vector.print %48 : f32
    vector.print %49 : f32
    vector.print %50 : f32
    return
  }
}

