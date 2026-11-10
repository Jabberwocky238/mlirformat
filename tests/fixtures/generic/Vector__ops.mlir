#map = affine_map<() -> ()>
#map1 = affine_map<(d0) -> ()>
#map2 = affine_map<(d0, d1) -> ()>
#map3 = affine_map<(d0, d1) -> (d0)>
#map4 = affine_map<(d0, d1) -> (d1, d0)>
#map5 = affine_map<(d0, d1) -> (d1)>
#map6 = affine_map<(d0, d1) -> (d0, d1)>
#map7 = affine_map<(d0, d1, d2) -> (d1, d0, 0)>
#map8 = affine_map<(d0) -> (d0)>
#map9 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d0, d4, d1)>
#map10 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d3, d2)>
#map11 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
#map12 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d0, d5, d2)>
#map13 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d1, d5, d4, d3)>
#map14 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
#map15 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map16 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map17 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map18 = affine_map<(d0, d1) -> (0, 0, 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, memref<f32>) -> tensor<f32>, sym_name = "vector_transfer_ops_0d"}> ({
  ^bb0(%arg212: tensor<f32>, %arg213: memref<f32>):
    %241 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %242 = "vector.transfer_read"(%arg212, %241) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 0, 1, 0>, permutation_map = #map}> : (tensor<f32>, f32) -> vector<f32>
    %243 = "vector.transfer_write"(%242, %arg212) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 0, 0>, permutation_map = #map}> : (vector<f32>, tensor<f32>) -> tensor<f32>
    %244 = "vector.transfer_read"(%arg213, %241) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 0, 1, 0>, permutation_map = #map}> : (memref<f32>, f32) -> vector<f32>
    "vector.transfer_write"(%244, %arg213) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 0, 0>, permutation_map = #map}> : (vector<f32>, memref<f32>) -> ()
    "func.return"(%243) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, memref<?x?xf32>) -> tensor<?xf32>, sym_name = "vector_transfer_ops_0d_from_higher_d"}> ({
  ^bb0(%arg210: tensor<?xf32>, %arg211: memref<?x?xf32>):
    %236 = "arith.constant"() <{value = 0 : index}> : () -> index
    %237 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %238 = "vector.transfer_read"(%arg210, %236, %237) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (tensor<?xf32>, index, f32) -> vector<f32>
    %239 = "vector.transfer_write"(%238, %arg210, %236) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (vector<f32>, tensor<?xf32>, index) -> tensor<?xf32>
    %240 = "vector.transfer_read"(%arg211, %236, %236, %237) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<?x?xf32>, index, index, f32) -> vector<f32>
    "vector.transfer_write"(%240, %arg211, %236, %236) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<f32>, memref<?x?xf32>, index, index) -> ()
    "func.return"(%239) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xvector<4x3xf32>>, memref<?x?xvector<4x3xi32>>, memref<?x?xvector<4x3xindex>>, memref<?x?x?xf32>) -> (), sym_name = "vector_transfer_ops"}> ({
  ^bb0(%arg205: memref<?x?xf32>, %arg206: memref<?x?xvector<4x3xf32>>, %arg207: memref<?x?xvector<4x3xi32>>, %arg208: memref<?x?xvector<4x3xindex>>, %arg209: memref<?x?x?xf32>):
    %215 = "arith.constant"() <{value = 3 : index}> : () -> index
    %216 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %217 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %218 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %219 = "arith.constant"() <{value = 0 : index}> : () -> index
    %220 = "arith.constant"() <{value = true}> : () -> i1
    %221 = "vector.broadcast"(%217) : (f32) -> vector<4x3xf32>
    %222 = "vector.broadcast"(%218) : (i32) -> vector<4x3xi32>
    %223 = "vector.broadcast"(%219) : (index) -> vector<4x3xindex>
    %224 = "arith.constant"() <{value = dense<[false, false, true, false, true]> : vector<5xi1>}> : () -> vector<5xi1>
    %225 = "vector.broadcast"(%220) : (i1) -> vector<4x5xi1>
    %226 = "vector.transfer_read"(%arg205, %215, %215, %217) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (memref<?x?xf32>, index, index, f32) -> vector<128xf32>
    %227 = "vector.transfer_read"(%arg205, %215, %215, %217) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (memref<?x?xf32>, index, index, f32) -> vector<3x7xf32>
    %228 = "vector.transfer_read"(%arg205, %215, %215, %216) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (memref<?x?xf32>, index, index, f32) -> vector<128xf32>
    %229 = "vector.transfer_read"(%arg205, %215, %215, %216) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map5}> : (memref<?x?xf32>, index, index, f32) -> vector<128xf32>
    %230 = "vector.transfer_read"(%arg206, %215, %215, %221) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map6}> : (memref<?x?xvector<4x3xf32>>, index, index, vector<4x3xf32>) -> vector<1x1x4x3xf32>
    %231 = "vector.transfer_read"(%arg206, %215, %215, %221) <{in_bounds = [false, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map6}> : (memref<?x?xvector<4x3xf32>>, index, index, vector<4x3xf32>) -> vector<1x1x4x3xf32>
    %232 = "vector.transfer_read"(%arg207, %215, %215, %222) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<?x?xvector<4x3xi32>>, index, index, vector<4x3xi32>) -> vector<5x24xi8>
    %233 = "vector.transfer_read"(%arg208, %215, %215, %223) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<?x?xvector<4x3xindex>>, index, index, vector<4x3xindex>) -> vector<5x48xi8>
    %234 = "vector.transfer_read"(%arg205, %215, %215, %217, %224) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map5}> : (memref<?x?xf32>, index, index, f32, vector<5xi1>) -> vector<5xf32>
    %235 = "vector.transfer_read"(%arg209, %215, %215, %215, %217, %225) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 1>, permutation_map = #map7}> : (memref<?x?x?xf32>, index, index, index, f32, vector<4x5xi1>) -> vector<5x4x8xf32>
    "vector.transfer_write"(%226, %arg205, %215, %215) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<128xf32>, memref<?x?xf32>, index, index) -> ()
    "vector.transfer_write"(%227, %arg205, %215, %215) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map4}> : (vector<3x7xf32>, memref<?x?xf32>, index, index) -> ()
    "vector.transfer_write"(%230, %arg206, %215, %215) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map6}> : (vector<1x1x4x3xf32>, memref<?x?xvector<4x3xf32>>, index, index) -> ()
    "vector.transfer_write"(%231, %arg206, %215, %215) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map6}> : (vector<1x1x4x3xf32>, memref<?x?xvector<4x3xf32>>, index, index) -> ()
    "vector.transfer_write"(%232, %arg207, %215, %215) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<5x24xi8>, memref<?x?xvector<4x3xi32>>, index, index) -> ()
    "vector.transfer_write"(%233, %arg208, %215, %215) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<5x48xi8>, memref<?x?xvector<4x3xindex>>, index, index) -> ()
    "vector.transfer_write"(%234, %arg205, %215, %215, %224) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map5}> : (vector<5xf32>, memref<?x?xf32>, index, index, vector<5xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xvector<4x3xf32>>, tensor<?x?xvector<4x3xi32>>, tensor<?x?xvector<4x3xindex>>) -> (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xvector<4x3xf32>>, tensor<?x?xvector<4x3xf32>>, tensor<?x?xvector<4x3xi32>>, tensor<?x?xvector<4x3xindex>>), sym_name = "vector_transfer_ops_tensor"}> ({
  ^bb0(%arg201: tensor<?x?xf32>, %arg202: tensor<?x?xvector<4x3xf32>>, %arg203: tensor<?x?xvector<4x3xi32>>, %arg204: tensor<?x?xvector<4x3xindex>>):
    %193 = "arith.constant"() <{value = 3 : index}> : () -> index
    %194 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %195 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %196 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %197 = "arith.constant"() <{value = 0 : index}> : () -> index
    %198 = "vector.broadcast"(%195) : (f32) -> vector<4x3xf32>
    %199 = "vector.broadcast"(%196) : (i32) -> vector<4x3xi32>
    %200 = "vector.broadcast"(%197) : (index) -> vector<4x3xindex>
    %201 = "vector.transfer_read"(%arg201, %193, %193, %195) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<?x?xf32>, index, index, f32) -> vector<128xf32>
    %202 = "vector.transfer_read"(%arg201, %193, %193, %195) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map4}> : (tensor<?x?xf32>, index, index, f32) -> vector<3x7xf32>
    %203 = "vector.transfer_read"(%arg201, %193, %193, %194) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (tensor<?x?xf32>, index, index, f32) -> vector<128xf32>
    %204 = "vector.transfer_read"(%arg201, %193, %193, %194) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map5}> : (tensor<?x?xf32>, index, index, f32) -> vector<128xf32>
    %205 = "vector.transfer_read"(%arg202, %193, %193, %198) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map6}> : (tensor<?x?xvector<4x3xf32>>, index, index, vector<4x3xf32>) -> vector<1x1x4x3xf32>
    %206 = "vector.transfer_read"(%arg202, %193, %193, %198) <{in_bounds = [false, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map6}> : (tensor<?x?xvector<4x3xf32>>, index, index, vector<4x3xf32>) -> vector<1x1x4x3xf32>
    %207 = "vector.transfer_read"(%arg203, %193, %193, %199) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (tensor<?x?xvector<4x3xi32>>, index, index, vector<4x3xi32>) -> vector<5x24xi8>
    %208 = "vector.transfer_read"(%arg204, %193, %193, %200) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (tensor<?x?xvector<4x3xindex>>, index, index, vector<4x3xindex>) -> vector<5x48xi8>
    %209 = "vector.transfer_write"(%201, %arg201, %193, %193) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<128xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    %210 = "vector.transfer_write"(%202, %arg201, %193, %193) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map4}> : (vector<3x7xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    %211 = "vector.transfer_write"(%205, %arg202, %193, %193) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map6}> : (vector<1x1x4x3xf32>, tensor<?x?xvector<4x3xf32>>, index, index) -> tensor<?x?xvector<4x3xf32>>
    %212 = "vector.transfer_write"(%206, %arg202, %193, %193) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map6}> : (vector<1x1x4x3xf32>, tensor<?x?xvector<4x3xf32>>, index, index) -> tensor<?x?xvector<4x3xf32>>
    %213 = "vector.transfer_write"(%207, %arg203, %193, %193) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<5x24xi8>, tensor<?x?xvector<4x3xi32>>, index, index) -> tensor<?x?xvector<4x3xi32>>
    %214 = "vector.transfer_write"(%208, %arg204, %193, %193) <{in_bounds = [], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map2}> : (vector<5x48xi8>, tensor<?x?xvector<4x3xindex>>, index, index) -> tensor<?x?xvector<4x3xindex>>
    "func.return"(%209, %210, %211, %212, %213, %214) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xvector<4x3xf32>>, tensor<?x?xvector<4x3xf32>>, tensor<?x?xvector<4x3xi32>>, tensor<?x?xvector<4x3xindex>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<f32>, vector<16xf32>, vector<1x16xf32>, vector<8x1xf32>, vector<8x1x!llvm.ptr<1>>, !llvm.ptr<1>) -> (), sym_name = "vector_broadcast"}> ({
  ^bb0(%arg194: f32, %arg195: vector<f32>, %arg196: vector<16xf32>, %arg197: vector<1x16xf32>, %arg198: vector<8x1xf32>, %arg199: vector<8x1x!llvm.ptr<1>>, %arg200: !llvm.ptr<1>):
    %185 = "vector.broadcast"(%arg194) : (f32) -> vector<f32>
    %186 = "vector.broadcast"(%arg195) : (vector<f32>) -> vector<4xf32>
    %187 = "vector.broadcast"(%arg194) : (f32) -> vector<16xf32>
    %188 = "vector.broadcast"(%arg196) : (vector<16xf32>) -> vector<8x16xf32>
    %189 = "vector.broadcast"(%arg197) : (vector<1x16xf32>) -> vector<8x16xf32>
    %190 = "vector.broadcast"(%arg198) : (vector<8x1xf32>) -> vector<8x16xf32>
    %191 = "vector.broadcast"(%arg199) : (vector<8x1x!llvm.ptr<1>>) -> vector<8x16x!llvm.ptr<1>>
    %192 = "vector.broadcast"(%arg200) : (!llvm.ptr<1>) -> vector<8x16x!llvm.ptr<1>>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<f32>) -> vector<3xf32>, sym_name = "shuffle0D"}> ({
  ^bb0(%arg193: vector<f32>):
    %184 = "vector.shuffle"(%arg193, %arg193) <{mask = array<i64: 0, 1, 0>}> : (vector<f32>, vector<f32>) -> vector<3xf32>
    "func.return"(%184) : (vector<3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, vector<4xf32>) -> vector<2xf32>, sym_name = "shuffle1D"}> ({
  ^bb0(%arg191: vector<2xf32>, %arg192: vector<4xf32>):
    %181 = "vector.shuffle"(%arg191, %arg191) <{mask = array<i64: 0, 1, 2, 3>}> : (vector<2xf32>, vector<2xf32>) -> vector<4xf32>
    %182 = "vector.shuffle"(%181, %arg192) <{mask = array<i64: 0, 1, 2>}> : (vector<4xf32>, vector<4xf32>) -> vector<3xf32>
    %183 = "vector.shuffle"(%182, %arg192) <{mask = array<i64: 0, 6>}> : (vector<3xf32>, vector<4xf32>) -> vector<2xf32>
    "func.return"(%183) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x4xf32>, vector<2x4xf32>) -> vector<3x4xf32>, sym_name = "shuffle2D"}> ({
  ^bb0(%arg189: vector<1x4xf32>, %arg190: vector<2x4xf32>):
    %180 = "vector.shuffle"(%arg189, %arg190) <{mask = array<i64: 0, 1, 2>}> : (vector<1x4xf32>, vector<2x4xf32>) -> vector<3x4xf32>
    "func.return"(%180) : (vector<3x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>) -> vector<4xf32>, sym_name = "shuffle_poison_mask"}> ({
  ^bb0(%arg187: vector<4xf32>, %arg188: vector<4xf32>):
    %179 = "vector.shuffle"(%arg187, %arg187) <{mask = array<i64: 1, -1, 6, -1>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%179) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x8x16xf32>) -> (vector<4x8x16xf32>, vector<8x16xf32>, vector<16xf32>, f32), sym_name = "extract_const_idx"}> ({
  ^bb0(%arg186: vector<4x8x16xf32>):
    %175 = "vector.extract"(%arg186) <{static_position = array<i64>}> : (vector<4x8x16xf32>) -> vector<4x8x16xf32>
    %176 = "vector.extract"(%arg186) <{static_position = array<i64: 3>}> : (vector<4x8x16xf32>) -> vector<8x16xf32>
    %177 = "vector.extract"(%arg186) <{static_position = array<i64: 3, 3>}> : (vector<4x8x16xf32>) -> vector<16xf32>
    %178 = "vector.extract"(%arg186) <{static_position = array<i64: 3, 3, 3>}> : (vector<4x8x16xf32>) -> f32
    "func.return"(%175, %176, %177, %178) : (vector<4x8x16xf32>, vector<8x16xf32>, vector<16xf32>, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x8x16xf32>, index) -> (vector<8x16xf32>, vector<16xf32>, f32), sym_name = "extract_val_idx"}> ({
  ^bb0(%arg184: vector<4x8x16xf32>, %arg185: index):
    %172 = "vector.extract"(%arg184, %arg185) <{static_position = array<i64: -9223372036854775808>}> : (vector<4x8x16xf32>, index) -> vector<8x16xf32>
    %173 = "vector.extract"(%arg184, %arg185, %arg185) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<4x8x16xf32>, index, index) -> vector<16xf32>
    %174 = "vector.extract"(%arg184, %arg185, %arg185) <{static_position = array<i64: -9223372036854775808, 5, -9223372036854775808>}> : (vector<4x8x16xf32>, index, index) -> f32
    "func.return"(%172, %173, %174) : (vector<8x16xf32>, vector<16xf32>, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<f32>) -> f32, sym_name = "extract_0d"}> ({
  ^bb0(%arg183: vector<f32>):
    %171 = "vector.extract"(%arg183) <{static_position = array<i64>}> : (vector<f32>) -> f32
    "func.return"(%171) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x5xf32>) -> f32, sym_name = "extract_poison_idx"}> ({
  ^bb0(%arg182: vector<4x5xf32>):
    %170 = "vector.extract"(%arg182) <{static_position = array<i64: -1, 0>}> : (vector<4x5xf32>) -> f32
    "func.return"(%170) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<16xf32>, vector<8x16xf32>, vector<4x8x16xf32>) -> vector<4x8x16xf32>, sym_name = "insert_const_idx"}> ({
  ^bb0(%arg178: f32, %arg179: vector<16xf32>, %arg180: vector<8x16xf32>, %arg181: vector<4x8x16xf32>):
    %166 = "vector.insert"(%arg180, %arg181) <{static_position = array<i64: 3>}> : (vector<8x16xf32>, vector<4x8x16xf32>) -> vector<4x8x16xf32>
    %167 = "vector.insert"(%arg179, %arg181) <{static_position = array<i64: 3, 3>}> : (vector<16xf32>, vector<4x8x16xf32>) -> vector<4x8x16xf32>
    %168 = "vector.insert"(%arg178, %arg181) <{static_position = array<i64: 3, 3, 3>}> : (f32, vector<4x8x16xf32>) -> vector<4x8x16xf32>
    %169 = "vector.insert"(%168, %168) <{static_position = array<i64>}> : (vector<4x8x16xf32>, vector<4x8x16xf32>) -> vector<4x8x16xf32>
    "func.return"(%169) : (vector<4x8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<16xf32>, vector<8x16xf32>, index, vector<4x8x16xf32>) -> vector<4x8x16xf32>, sym_name = "insert_val_idx"}> ({
  ^bb0(%arg173: f32, %arg174: vector<16xf32>, %arg175: vector<8x16xf32>, %arg176: index, %arg177: vector<4x8x16xf32>):
    %163 = "vector.insert"(%arg175, %arg177, %arg176) <{static_position = array<i64: -9223372036854775808>}> : (vector<8x16xf32>, vector<4x8x16xf32>, index) -> vector<4x8x16xf32>
    %164 = "vector.insert"(%arg174, %arg177, %arg176, %arg176) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<16xf32>, vector<4x8x16xf32>, index, index) -> vector<4x8x16xf32>
    %165 = "vector.insert"(%arg173, %arg177, %arg176, %arg176) <{static_position = array<i64: -9223372036854775808, 5, -9223372036854775808>}> : (f32, vector<4x8x16xf32>, index, index) -> vector<4x8x16xf32>
    "func.return"(%165) : (vector<4x8x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<f32>) -> vector<f32>, sym_name = "insert_0d"}> ({
  ^bb0(%arg171: f32, %arg172: vector<f32>):
    %162 = "vector.insert"(%arg171, %arg172) <{static_position = array<i64>}> : (f32, vector<f32>) -> vector<f32>
    "func.return"(%162) : (vector<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x5xf32>, f32) -> (), sym_name = "insert_poison_idx"}> ({
  ^bb0(%arg169: vector<4x5xf32>, %arg170: f32):
    %161 = "vector.insert"(%arg170, %arg169) <{static_position = array<i64: -1, 0>}> : (f32, vector<4x5xf32>) -> vector<4x5xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<8xf32>, vector<4x8xf32>) -> vector<4x8xf32>, sym_name = "outerproduct"}> ({
  ^bb0(%arg166: vector<4xf32>, %arg167: vector<8xf32>, %arg168: vector<4x8xf32>):
    %159 = "vector.outerproduct"(%arg166, %arg167) <{kind = #vector.kind<add>}> : (vector<4xf32>, vector<8xf32>) -> vector<4x8xf32>
    %160 = "vector.outerproduct"(%arg166, %arg167, %arg168) <{kind = #vector.kind<add>}> : (vector<4xf32>, vector<8xf32>, vector<4x8xf32>) -> vector<4x8xf32>
    "func.return"(%160) : (vector<4x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]xf32>, vector<[8]xf32>) -> (), sym_name = "outerproduct_scalable"}> ({
  ^bb0(%arg164: vector<[4]xf32>, %arg165: vector<[8]xf32>):
    %156 = "vector.outerproduct"(%arg164, %arg165) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, vector<[8]xf32>) -> vector<[4]x[8]xf32>
    %157 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %158 = "vector.outerproduct"(%arg164, %157) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, f32) -> vector<[4]xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xf32>, vector<4x8x16xf32>) -> (), sym_name = "insert_strided_slice"}> ({
  ^bb0(%arg162: vector<4x4xf32>, %arg163: vector<4x8x16xf32>):
    %155 = "vector.insert_strided_slice"(%arg162, %arg163) <{offsets = [2, 2, 2], strides = [1, 1]}> : (vector<4x4xf32>, vector<4x8x16xf32>) -> vector<4x8x16xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x[16]xf32>, vector<4x8x[16]xf32>) -> (), sym_name = "insert_strided_slice_scalable"}> ({
  ^bb0(%arg160: vector<4x[16]xf32>, %arg161: vector<4x8x[16]xf32>):
    %154 = "vector.insert_strided_slice"(%arg160, %arg161) <{offsets = [2, 2, 0], strides = [1, 1]}> : (vector<4x[16]xf32>, vector<4x8x[16]xf32>) -> vector<4x8x[16]xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x8x16xf32>) -> vector<2x2x16xf32>, sym_name = "extract_strided_slice"}> ({
  ^bb0(%arg159: vector<4x8x16xf32>):
    %153 = "vector.extract_strided_slice"(%arg159) <{offsets = [2, 2], sizes = [2, 2], strides = [1, 1]}> : (vector<4x8x16xf32>) -> vector<2x2x16xf32>
    "func.return"(%153) : (vector<2x2x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x[8]x16xf32>) -> vector<2x[8]x16xf32>, sym_name = "extract_strided_slice_scalable"}> ({
  ^bb0(%arg158: vector<4x[8]x16xf32>):
    %152 = "vector.extract_strided_slice"(%arg158) <{offsets = [2, 0], sizes = [2, 8], strides = [1, 1]}> : (vector<4x[8]x16xf32>) -> vector<2x[8]x16xf32>
    "func.return"(%152) : (vector<2x[8]x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<10xf32>, vector<10xf32>) -> f32, sym_name = "contraction_to_scalar"}> ({
  ^bb0(%arg156: vector<10xf32>, %arg157: vector<10xf32>):
    %150 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %151 = "vector.contract"(%arg156, %arg157, %150) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map8, #map8, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<10xf32>, vector<10xf32>, f32) -> f32
    "func.return"(%151) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[10]xf32>, vector<[10]xf32>) -> f32, sym_name = "contraction_to_scalar_scalable"}> ({
  ^bb0(%arg154: vector<[10]xf32>, %arg155: vector<[10]xf32>):
    %148 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %149 = "vector.contract"(%arg154, %arg155, %148) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map8, #map8, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<[10]xf32>, vector<[10]xf32>, f32) -> f32
    "func.return"(%149) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<10xf32>, vector<10xf32>) -> f32, sym_name = "contraction_extra_attrs"}> ({
  ^bb0(%arg152: vector<10xf32>, %arg153: vector<10xf32>):
    %146 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %147 = "vector.contract"(%arg152, %arg153, %146) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map8, #map8, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> {first_attr = 1 : i32, second_attr = "string"} : (vector<10xf32>, vector<10xf32>, f32) -> f32
    "func.return"(%147) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<10xf32>, vector<10xf32>) -> f32, sym_name = "contraction_to_scalar_with_max"}> ({
  ^bb0(%arg150: vector<10xf32>, %arg151: vector<10xf32>):
    %144 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %145 = "vector.contract"(%arg150, %arg151, %144) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map8, #map8, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<maxnumf>}> : (vector<10xf32>, vector<10xf32>, f32) -> f32
    "func.return"(%145) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<7x8x16x15xf32>, vector<8x16x7x5xf32>, vector<8x15x5xf32>, vector<8x8x15x5xf32>, vector<7x8x16x15xf16>, vector<8x16x7x5xf16>) -> (), sym_name = "contraction"}> ({
  ^bb0(%arg144: vector<7x8x16x15xf32>, %arg145: vector<8x16x7x5xf32>, %arg146: vector<8x15x5xf32>, %arg147: vector<8x8x15x5xf32>, %arg148: vector<7x8x16x15xf16>, %arg149: vector<8x16x7x5xf16>):
    %140 = "vector.contract"(%arg144, %arg145, %arg146) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map9, #map10, #map11], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<7x8x16x15xf32>, vector<8x16x7x5xf32>, vector<8x15x5xf32>) -> vector<8x15x5xf32>
    %141 = "vector.contract"(%arg144, %arg145, %arg147) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map12, #map13, #map14], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<7x8x16x15xf32>, vector<8x16x7x5xf32>, vector<8x8x15x5xf32>) -> vector<8x8x15x5xf32>
    %142 = "vector.contract"(%arg148, %arg149, %arg147) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map12, #map13, #map14], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<7x8x16x15xf16>, vector<8x16x7x5xf16>, vector<8x8x15x5xf32>) -> vector<8x8x15x5xf32>
    %143 = "vector.contract"(%arg144, %arg145, %arg147) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map12, #map13, #map14], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>, #vector.iterator_type<reduction>], kind = #vector.kind<maxnumf>}> : (vector<7x8x16x15xf32>, vector<8x16x7x5xf32>, vector<8x8x15x5xf32>) -> vector<8x8x15x5xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x1xf32>, vector<1x[32]xf32>, vector<8x[32]xf32>) -> vector<8x[32]xf32>, sym_name = "contraction_matmul_scalable"}> ({
  ^bb0(%arg141: vector<8x1xf32>, %arg142: vector<1x[32]xf32>, %arg143: vector<8x[32]xf32>):
    %139 = "vector.contract"(%arg141, %arg142, %arg143) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map15, #map16, #map17], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8x1xf32>, vector<1x[32]xf32>, vector<8x[32]xf32>) -> vector<8x[32]xf32>
    "func.return"(%139) : (vector<8x[32]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "create_vector_mask"}> ({
    %136 = "arith.constant"() <{value = 2 : index}> : () -> index
    %137 = "arith.constant"() <{value = 3 : index}> : () -> index
    %138 = "vector.create_mask"(%137, %136) : (index, index) -> vector<4x3xi1>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "constant_vector_mask_0d"}> ({
    %134 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<i1>
    %135 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1>}> : () -> vector<i1>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "constant_vector_mask"}> ({
    %130 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 3, 2>}> : () -> vector<4x3xi1>
    %131 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<[4]xi1>
    %132 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<[4]xi1>
    %133 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1, 4>}> : () -> vector<2x[4]xi1>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x4xf32>) -> (), sym_name = "vector_print_on_vector"}> ({
  ^bb0(%arg140: vector<8x4xf32>):
    "vector.print"(%arg140) <{punctuation = #vector.punctuation<newline>}> : (vector<8x4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64) -> (), sym_name = "vector_print_on_scalar"}> ({
  ^bb0(%arg139: i64):
    "vector.print"(%arg139) <{punctuation = #vector.punctuation<newline>}> : (i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<5x1x3x2xf32>, vector<8x1xf32>, vector<16x1x1xf32>) -> (vector<15x2xf32>, vector<8xf32>, vector<16xf32>, vector<16x1xf32>), sym_name = "shape_cast"}> ({
  ^bb0(%arg136: vector<5x1x3x2xf32>, %arg137: vector<8x1xf32>, %arg138: vector<16x1x1xf32>):
    %126 = "vector.shape_cast"(%arg136) : (vector<5x1x3x2xf32>) -> vector<15x2xf32>
    %127 = "vector.shape_cast"(%arg137) : (vector<8x1xf32>) -> vector<8xf32>
    %128 = "vector.shape_cast"(%arg138) : (vector<16x1x1xf32>) -> vector<16xf32>
    %129 = "vector.shape_cast"(%arg138) : (vector<16x1x1xf32>) -> vector<16x1xf32>
    "func.return"(%126, %127, %128, %129) : (vector<15x2xf32>, vector<8xf32>, vector<16xf32>, vector<16x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3xf32>) -> vector<3x1x2xf32>, sym_name = "shape_cast_general_reshape"}> ({
  ^bb0(%arg135: vector<2x3xf32>):
    %125 = "vector.shape_cast"(%arg135) : (vector<2x3xf32>) -> vector<3x1x2xf32>
    "func.return"(%125) : (vector<3x1x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1x1x1x1xf32>) -> vector<1x1x1x1xf32>, sym_name = "shape_cast_0d"}> ({
  ^bb0(%arg134: vector<1x1x1x1xf32>):
    %123 = "vector.shape_cast"(%arg134) : (vector<1x1x1x1xf32>) -> vector<f32>
    %124 = "vector.shape_cast"(%123) : (vector<f32>) -> vector<1x1x1x1xf32>
    "func.return"(%124) : (vector<1x1x1x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<5x1x3x2xf32>, vector<8x1xi32>, vector<16x1x8xi8>, vector<8x2x1xindex>, vector<f32>) -> (vector<5x1x3x4xf16>, vector<5x1x3x8xi8>, vector<8x4xi8>, vector<8x1xf32>, vector<16x1x2xi32>, vector<16x1x4xi16>, vector<16x1x1xindex>, vector<8x2x2xf32>, vector<i32>), sym_name = "bitcast"}> ({
  ^bb0(%arg129: vector<5x1x3x2xf32>, %arg130: vector<8x1xi32>, %arg131: vector<16x1x8xi8>, %arg132: vector<8x2x1xindex>, %arg133: vector<f32>):
    %114 = "vector.bitcast"(%arg129) : (vector<5x1x3x2xf32>) -> vector<5x1x3x4xf16>
    %115 = "vector.bitcast"(%arg129) : (vector<5x1x3x2xf32>) -> vector<5x1x3x8xi8>
    %116 = "vector.bitcast"(%arg130) : (vector<8x1xi32>) -> vector<8x4xi8>
    %117 = "vector.bitcast"(%arg130) : (vector<8x1xi32>) -> vector<8x1xf32>
    %118 = "vector.bitcast"(%arg131) : (vector<16x1x8xi8>) -> vector<16x1x2xi32>
    %119 = "vector.bitcast"(%arg131) : (vector<16x1x8xi8>) -> vector<16x1x4xi16>
    %120 = "vector.bitcast"(%arg131) : (vector<16x1x8xi8>) -> vector<16x1x1xindex>
    %121 = "vector.bitcast"(%arg132) : (vector<8x2x1xindex>) -> vector<8x2x2xf32>
    %122 = "vector.bitcast"(%arg133) : (vector<f32>) -> vector<i32>
    "func.return"(%114, %115, %116, %117, %118, %119, %120, %121, %122) : (vector<5x1x3x4xf16>, vector<5x1x3x8xi8>, vector<8x4xi8>, vector<8x1xf32>, vector<16x1x2xi32>, vector<16x1x4xi16>, vector<16x1x1xindex>, vector<8x2x2xf32>, vector<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, vector<8x4xf32>, vector<f32>) -> (), sym_name = "vector_fma"}> ({
  ^bb0(%arg126: vector<8xf32>, %arg127: vector<8x4xf32>, %arg128: vector<f32>):
    %111 = "vector.fma"(%arg126, %arg126, %arg126) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    %112 = "vector.fma"(%arg127, %arg127, %arg127) : (vector<8x4xf32>, vector<8x4xf32>, vector<8x4xf32>) -> vector<8x4xf32>
    %113 = "vector.fma"(%arg128, %arg128, %arg128) : (vector<f32>, vector<f32>, vector<f32>) -> vector<f32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>, f32) -> f32, sym_name = "reduce_fp"}> ({
  ^bb0(%arg124: vector<16xf32>, %arg125: f32):
    %103 = "vector.reduction"(%arg124) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<16xf32>) -> f32
    %104 = "vector.reduction"(%arg124, %arg125) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<16xf32>, f32) -> f32
    %105 = "vector.reduction"(%arg124) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<16xf32>) -> f32
    %106 = "vector.reduction"(%arg124, %arg125) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<16xf32>, f32) -> f32
    %107 = "vector.reduction"(%arg124) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minnumf>}> : (vector<16xf32>) -> f32
    %108 = "vector.reduction"(%arg124) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxnumf>}> : (vector<16xf32>) -> f32
    %109 = "vector.reduction"(%arg124) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minimumf>}> : (vector<16xf32>) -> f32
    %110 = "vector.reduction"(%arg124) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maximumf>}> : (vector<16xf32>) -> f32
    "func.return"(%108) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi32>) -> i32, sym_name = "reduce_int"}> ({
  ^bb0(%arg123: vector<16xi32>):
    %94 = "vector.reduction"(%arg123) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<16xi32>) -> i32
    %95 = "vector.reduction"(%arg123) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<16xi32>) -> i32
    %96 = "vector.reduction"(%arg123) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minui>}> : (vector<16xi32>) -> i32
    %97 = "vector.reduction"(%arg123) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minsi>}> : (vector<16xi32>) -> i32
    %98 = "vector.reduction"(%arg123) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxui>}> : (vector<16xi32>) -> i32
    %99 = "vector.reduction"(%arg123) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxsi>}> : (vector<16xi32>) -> i32
    %100 = "vector.reduction"(%arg123) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<and>}> : (vector<16xi32>) -> i32
    %101 = "vector.reduction"(%arg123) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<or>}> : (vector<16xi32>) -> i32
    %102 = "vector.reduction"(%arg123) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<xor>}> : (vector<16xi32>) -> i32
    "func.return"(%102) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<i32>) -> i32, sym_name = "reduce_int_0d"}> ({
  ^bb0(%arg122: vector<i32>):
    %85 = "vector.reduction"(%arg122) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<i32>) -> i32
    %86 = "vector.reduction"(%arg122) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<i32>) -> i32
    %87 = "vector.reduction"(%arg122) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minui>}> : (vector<i32>) -> i32
    %88 = "vector.reduction"(%arg122) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minsi>}> : (vector<i32>) -> i32
    %89 = "vector.reduction"(%arg122) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxui>}> : (vector<i32>) -> i32
    %90 = "vector.reduction"(%arg122) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxsi>}> : (vector<i32>) -> i32
    %91 = "vector.reduction"(%arg122) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<and>}> : (vector<i32>) -> i32
    %92 = "vector.reduction"(%arg122) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<or>}> : (vector<i32>) -> i32
    %93 = "vector.reduction"(%arg122) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<xor>}> : (vector<i32>) -> i32
    "func.return"(%93) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x7xf32>) -> vector<7x3xf32>, sym_name = "transpose_fp"}> ({
  ^bb0(%arg121: vector<3x7xf32>):
    %84 = "vector.transpose"(%arg121) <{permutation = array<i64: 1, 0>}> : (vector<3x7xf32>) -> vector<7x3xf32>
    "func.return"(%84) : (vector<7x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<11x7x3x2xi32>) -> vector<2x11x7x3xi32>, sym_name = "transpose_int"}> ({
  ^bb0(%arg120: vector<11x7x3x2xi32>):
    %83 = "vector.transpose"(%arg120) <{permutation = array<i64: 3, 0, 1, 2>}> : (vector<11x7x3x2xi32>) -> vector<2x11x7x3xi32>
    "func.return"(%83) : (vector<2x11x7x3xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<f32>) -> vector<f32>, sym_name = "transpose_fp_0d"}> ({
  ^bb0(%arg119: vector<f32>):
    %82 = "vector.transpose"(%arg119) <{permutation = array<i64>}> : (vector<f32>) -> vector<f32>
    "func.return"(%82) : (vector<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<i32>) -> vector<i32>, sym_name = "transpose_int_0d"}> ({
  ^bb0(%arg118: vector<i32>):
    %81 = "vector.transpose"(%arg118) <{permutation = array<i64>}> : (vector<i32>) -> vector<i32>
    "func.return"(%81) : (vector<i32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<200x100xf32>, index, index) -> (), sym_name = "vector_load_and_store_0d_scalar_memref"}> ({
  ^bb0(%arg115: memref<200x100xf32>, %arg116: index, %arg117: index):
    %80 = "vector.load"(%arg115, %arg116, %arg117) : (memref<200x100xf32>, index, index) -> vector<f32>
    "vector.store"(%80, %arg115, %arg116, %arg117) : (vector<f32>, memref<200x100xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<200x100xf32, strided<[?, ?], offset: ?>>, index, index) -> (), sym_name = "vector_load_and_store_0d_scalar_strided_memref"}> ({
  ^bb0(%arg112: memref<200x100xf32, strided<[?, ?], offset: ?>>, %arg113: index, %arg114: index):
    %79 = "vector.load"(%arg112, %arg113, %arg114) : (memref<200x100xf32, strided<[?, ?], offset: ?>>, index, index) -> vector<f32>
    "vector.store"(%79, %arg112, %arg113, %arg114) : (vector<f32>, memref<200x100xf32, strided<[?, ?], offset: ?>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<200x100xf32, strided<[?, ?], offset: ?>>, index, index) -> (), sym_name = "vector_load_and_store_unit_vec_strided_memref"}> ({
  ^bb0(%arg109: memref<200x100xf32, strided<[?, ?], offset: ?>>, %arg110: index, %arg111: index):
    %78 = "vector.load"(%arg109, %arg110, %arg111) : (memref<200x100xf32, strided<[?, ?], offset: ?>>, index, index) -> vector<1xf32>
    "vector.store"(%78, %arg109, %arg110, %arg111) : (vector<1xf32>, memref<200x100xf32, strided<[?, ?], offset: ?>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<200x100xf32>, index, index) -> (), sym_name = "vector_load_and_store_1d_scalar_memref"}> ({
  ^bb0(%arg106: memref<200x100xf32>, %arg107: index, %arg108: index):
    %77 = "vector.load"(%arg106, %arg107, %arg108) : (memref<200x100xf32>, index, index) -> vector<8xf32>
    "vector.store"(%77, %arg106, %arg107, %arg108) : (vector<8xf32>, memref<200x100xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<200x100xvector<8xf32>>, index, index) -> (), sym_name = "vector_load_and_store_1d_vector_memref"}> ({
  ^bb0(%arg103: memref<200x100xvector<8xf32>>, %arg104: index, %arg105: index):
    %76 = "vector.load"(%arg103, %arg104, %arg105) : (memref<200x100xvector<8xf32>>, index, index) -> vector<8xf32>
    "vector.store"(%76, %arg103, %arg104, %arg105) : (vector<8xf32>, memref<200x100xvector<8xf32>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]xi32>, memref<?xi32>) -> vector<[4]xi32>, sym_name = "vector_load_and_store_scalable_vector_memref"}> ({
  ^bb0(%arg101: vector<[4]xi32>, %arg102: memref<?xi32>):
    %74 = "arith.constant"() <{value = 0 : index}> : () -> index
    %75 = "vector.load"(%arg102, %74) : (memref<?xi32>, index) -> vector<[4]xi32>
    "vector.store"(%arg101, %arg102, %74) : (vector<[4]xi32>, memref<?xi32>, index) -> ()
    "func.return"(%75) : (vector<[4]xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<200x100xvector<8xf32>>, index, index) -> (), sym_name = "vector_load_and_store_1d_scalable_vector_memref"}> ({
  ^bb0(%arg98: memref<200x100xvector<8xf32>>, %arg99: index, %arg100: index):
    %73 = "vector.load"(%arg98, %arg99, %arg100) : (memref<200x100xvector<8xf32>>, index, index) -> vector<8xf32>
    "vector.store"(%73, %arg98, %arg99, %arg100) : (vector<8xf32>, memref<200x100xvector<8xf32>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<7xf32>) -> (), sym_name = "vector_load_and_store_out_of_bounds"}> ({
  ^bb0(%arg97: memref<7xf32>):
    %71 = "arith.constant"() <{value = 0 : index}> : () -> index
    %72 = "vector.load"(%arg97, %71) : (memref<7xf32>, index) -> vector<8xf32>
    "vector.store"(%72, %arg97, %71) : (vector<8xf32>, memref<7xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<200x100xf32>, index, index) -> (), sym_name = "vector_load_and_store_2d_scalar_memref"}> ({
  ^bb0(%arg94: memref<200x100xf32>, %arg95: index, %arg96: index):
    %70 = "vector.load"(%arg94, %arg95, %arg96) : (memref<200x100xf32>, index, index) -> vector<4x8xf32>
    "vector.store"(%70, %arg94, %arg95, %arg96) : (vector<4x8xf32>, memref<200x100xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<200x100xvector<4x8xf32>>, index, index) -> (), sym_name = "vector_load_and_store_2d_vector_memref"}> ({
  ^bb0(%arg91: memref<200x100xvector<4x8xf32>>, %arg92: index, %arg93: index):
    %69 = "vector.load"(%arg91, %arg92, %arg93) : (memref<200x100xvector<4x8xf32>>, index, index) -> vector<4x8xf32>
    "vector.store"(%69, %arg91, %arg92, %arg93) : (vector<4x8xf32>, memref<200x100xvector<4x8xf32>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4xi32>) -> (), sym_name = "load_store_alignment"}> ({
  ^bb0(%arg90: memref<4xi32>):
    %67 = "arith.constant"() <{value = 0 : index}> : () -> index
    %68 = "vector.load"(%arg90, %67) <{alignment = 16 : i64}> : (memref<4xi32>, index) -> vector<4xi32>
    "vector.store"(%68, %arg90, %67) <{alignment = 16 : i64}> : (vector<4xi32>, memref<4xi32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> (), sym_name = "masked_load_and_store"}> ({
  ^bb0(%arg87: memref<?xf32>, %arg88: vector<16xi1>, %arg89: vector<16xf32>):
    %65 = "arith.constant"() <{value = 0 : index}> : () -> index
    %66 = "vector.maskedload"(%arg87, %65, %arg88, %arg89) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.maskedstore"(%arg87, %65, %arg88, %66) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<16xi1>, vector<16xf32>) -> (), sym_name = "masked_load_and_store2d"}> ({
  ^bb0(%arg84: memref<?x?xf32>, %arg85: vector<16xi1>, %arg86: vector<16xf32>):
    %63 = "arith.constant"() <{value = 0 : index}> : () -> index
    %64 = "vector.maskedload"(%arg84, %63, %63, %arg85, %arg86) : (memref<?x?xf32>, index, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.maskedstore"(%arg84, %63, %63, %arg85, %64) : (memref<?x?xf32>, index, index, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> (), sym_name = "gather_and_scatter"}> ({
  ^bb0(%arg80: memref<?xf32>, %arg81: vector<16xi32>, %arg82: vector<16xi1>, %arg83: vector<16xf32>):
    %61 = "arith.constant"() <{value = 0 : index}> : () -> index
    %62 = "vector.gather"(%arg80, %61, %arg81, %arg82, %arg83) : (memref<?xf32>, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.scatter"(%arg80, %61, %arg81, %arg82, %62) : (memref<?xf32>, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> (), sym_name = "gather_and_scatter2d"}> ({
  ^bb0(%arg76: memref<?x?xf32>, %arg77: vector<16xi32>, %arg78: vector<16xi1>, %arg79: vector<16xf32>):
    %59 = "arith.constant"() <{value = 0 : index}> : () -> index
    %60 = "vector.gather"(%arg76, %59, %59, %arg77, %arg78, %arg79) : (memref<?x?xf32>, index, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.scatter"(%arg76, %59, %59, %arg77, %arg78, %60) : (memref<?x?xf32>, index, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, vector<2x16xi32>, vector<2x16xi1>, vector<2x16xf32>) -> vector<2x16xf32>, sym_name = "gather_and_scatter_multi_dims"}> ({
  ^bb0(%arg72: memref<?xf32>, %arg73: vector<2x16xi32>, %arg74: vector<2x16xi1>, %arg75: vector<2x16xf32>):
    %57 = "arith.constant"() <{value = 0 : index}> : () -> index
    %58 = "vector.gather"(%arg72, %57, %arg73, %arg74, %arg75) : (memref<?xf32>, index, vector<2x16xi32>, vector<2x16xi1>, vector<2x16xf32>) -> vector<2x16xf32>
    "vector.scatter"(%arg72, %57, %arg73, %arg74, %58) : (memref<?xf32>, index, vector<2x16xi32>, vector<2x16xi1>, vector<2x16xf32>) -> ()
    "func.return"(%58) : (vector<2x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>, sym_name = "gather_on_tensor"}> ({
  ^bb0(%arg68: tensor<?xf32>, %arg69: vector<16xi32>, %arg70: vector<16xi1>, %arg71: vector<16xf32>):
    %55 = "arith.constant"() <{value = 0 : index}> : () -> index
    %56 = "vector.gather"(%arg68, %55, %arg69, %arg70, %arg71) : (tensor<?xf32>, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%56) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> (), sym_name = "expand_and_compress"}> ({
  ^bb0(%arg65: memref<?xf32>, %arg66: vector<16xi1>, %arg67: vector<16xf32>):
    %53 = "arith.constant"() <{value = 0 : index}> : () -> index
    %54 = "vector.expandload"(%arg65, %53, %arg66, %arg67) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.compressstore"(%arg65, %53, %arg66, %54) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<16xi1>, vector<16xf32>) -> (), sym_name = "expand_and_compress2d"}> ({
  ^bb0(%arg62: memref<?x?xf32>, %arg63: vector<16xi1>, %arg64: vector<16xf32>):
    %51 = "arith.constant"() <{value = 0 : index}> : () -> index
    %52 = "vector.expandload"(%arg62, %51, %51, %arg63, %arg64) : (memref<?x?xf32>, index, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.compressstore"(%arg62, %51, %51, %arg63, %52) : (memref<?x?xf32>, index, index, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x8x16x32xf32>, vector<4x16xf32>, f32) -> f32, sym_name = "multi_reduction"}> ({
  ^bb0(%arg59: vector<4x8x16x32xf32>, %arg60: vector<4x16xf32>, %arg61: f32):
    %49 = "vector.multi_reduction"(%arg59, %arg60) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1, 3>}> : (vector<4x8x16x32xf32>, vector<4x16xf32>) -> vector<4x16xf32>
    %50 = "vector.multi_reduction"(%49, %arg61) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 1>}> : (vector<4x16xf32>, f32) -> f32
    "func.return"(%50) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> index, sym_name = "get_vector_scale"}> ({
    %48 = "vector.vscale"() : () -> index
    "func.return"(%48) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x8x16x32xf32>) -> vector<4x8x16x32xf32>, sym_name = "vector_scan"}> ({
  ^bb0(%arg58: vector<4x8x16x32xf32>):
    %46 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4x16x32xf32>}> : () -> vector<4x16x32xf32>
    %47:2 = "vector.scan"(%arg58, %46) <{inclusive = true, kind = #vector.kind<add>, reduction_dim = 1 : i64}> : (vector<4x8x16x32xf32>, vector<4x16x32xf32>) -> (vector<4x8x16x32xf32>, vector<4x16x32xf32>)
    "func.return"(%47#0) : (vector<4x8x16x32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>, vector<8xi1>) -> i32, sym_name = "vector_mask"}> ({
  ^bb0(%arg56: vector<8xi32>, %arg57: vector<8xi1>):
    %44 = "vector.mask"(%arg57) ({
      %45 = "vector.reduction"(%arg56) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<8xi32>) -> i32
      "vector.yield"(%45) : (i32) -> ()
    }) : (vector<8xi1>) -> i32
    "func.return"(%44) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>, sym_name = "vector_mask_passthru"}> ({
  ^bb0(%arg52: tensor<?xf32>, %arg53: index, %arg54: vector<16xi1>, %arg55: vector<16xf32>):
    %41 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %42 = "vector.mask"(%arg54, %arg55) ({
      %43 = "vector.transfer_read"(%arg52, %arg53, %41) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map8}> : (tensor<?xf32>, index, f32) -> vector<16xf32>
      "vector.yield"(%43) : (vector<16xf32>) -> ()
    }) : (vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%42) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>, memref<?xf32>, index, vector<16xi1>) -> (), sym_name = "vector_mask_no_return"}> ({
  ^bb0(%arg48: vector<16xf32>, %arg49: memref<?xf32>, %arg50: index, %arg51: vector<16xi1>):
    "vector.mask"(%arg51) ({
      "vector.transfer_write"(%arg48, %arg49, %arg50) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map8}> : (vector<16xf32>, memref<?xf32>, index) -> ()
      "vector.yield"() : () -> ()
    }) : (vector<16xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>, tensor<?xf32>, index, vector<16xi1>) -> (), sym_name = "vector_mask_tensor_return"}> ({
  ^bb0(%arg44: vector<16xf32>, %arg45: tensor<?xf32>, %arg46: index, %arg47: vector<16xi1>):
    %39 = "vector.mask"(%arg47) ({
      %40 = "vector.transfer_write"(%arg44, %arg45, %arg46) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map8}> : (vector<16xf32>, tensor<?xf32>, index) -> tensor<?xf32>
      "vector.yield"(%40) : (tensor<?xf32>) -> ()
    }) : (vector<16xi1>) -> tensor<?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi1>) -> (), sym_name = "vector_mask_empty"}> ({
  ^bb0(%arg43: vector<16xi1>):
    "vector.mask"(%arg43) ({
      "vector.yield"() : () -> ()
    }) : (vector<16xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi1>) -> (), sym_name = "vector_mask_empty_with_yield"}> ({
  ^bb0(%arg42: vector<16xi1>):
    "vector.mask"(%arg42) ({
      "vector.yield"() : () -> ()
    }) : (vector<16xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi1>, vector<16xf32>) -> vector<16xf32>, sym_name = "vector_mask_empty_return"}> ({
  ^bb0(%arg40: vector<16xi1>, %arg41: vector<16xf32>):
    %38 = "vector.mask"(%arg40) ({
      "vector.yield"(%arg41) : (vector<16xf32>) -> ()
    }) : (vector<16xi1>) -> vector<16xf32>
    "func.return"(%38) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4xi32>, index, index, vector<1xi1>) -> vector<1x1x4xi32>, sym_name = "vector_mask_scalar_broadcast_transfer"}> ({
  ^bb0(%arg36: tensor<2x4xi32>, %arg37: index, %arg38: index, %arg39: vector<1xi1>):
    %35 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %36 = "vector.mask"(%arg39) ({
      %37 = "vector.transfer_read"(%arg36, %arg37, %arg38, %35) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map18}> : (tensor<2x4xi32>, index, index, i32) -> vector<1x1x4xi32>
      "vector.yield"(%37) : (vector<1x1x4xi32>) -> ()
    }) : (vector<1xi1>) -> vector<1x1x4xi32>
    "func.return"(%36) : (vector<1x1x4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<8xi32>, vector<[4]xi32>, vector<[8]xi32>) -> (), sym_name = "vector_scalable_insert"}> ({
  ^bb0(%arg32: vector<4xi32>, %arg33: vector<8xi32>, %arg34: vector<[4]xi32>, %arg35: vector<[8]xi32>):
    %32 = "vector.scalable.insert"(%arg32, %arg35) <{pos = 12 : i64}> : (vector<4xi32>, vector<[8]xi32>) -> vector<[8]xi32>
    %33 = "vector.scalable.insert"(%arg33, %arg35) <{pos = 0 : i64}> : (vector<8xi32>, vector<[8]xi32>) -> vector<[8]xi32>
    %34 = "vector.scalable.insert"(%arg34, %arg35) <{pos = 0 : i64}> : (vector<[4]xi32>, vector<[8]xi32>) -> vector<[8]xi32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi32>) -> (), sym_name = "vector_scalable_extract"}> ({
  ^bb0(%arg31: vector<[8]xi32>):
    %29 = "vector.scalable.extract"(%arg31) <{pos = 0 : i64}> : (vector<[8]xi32>) -> vector<16xi32>
    %30 = "vector.scalable.extract"(%arg31) <{pos = 0 : i64}> : (vector<[8]xi32>) -> vector<[4]xi32>
    %31 = "vector.scalable.extract"(%arg31) <{pos = 4 : i64}> : (vector<[8]xi32>) -> vector<4xi32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x4xf32>, vector<4x[8]xf32>, vector<3x[8]xf32>, vector<3x[8]x4xi1>) -> vector<3x[8]xf32>, sym_name = "contraction_masked_scalable"}> ({
  ^bb0(%arg27: vector<3x4xf32>, %arg28: vector<4x[8]xf32>, %arg29: vector<3x[8]xf32>, %arg30: vector<3x[8]x4xi1>):
    %27 = "vector.mask"(%arg30) ({
      %28 = "vector.contract"(%arg27, %arg28, %arg29) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map15, #map16, #map17], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<3x4xf32>, vector<4x[8]xf32>, vector<3x[8]xf32>) -> vector<3x[8]xf32>
      "vector.yield"(%28) : (vector<3x[8]xf32>) -> ()
    }) : (vector<3x[8]x4xi1>) -> vector<3x[8]xf32>
    "func.return"(%27) : (vector<3x[8]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<42xf32>) -> f32, sym_name = "fastmath"}> ({
  ^bb0(%arg26: vector<42xf32>):
    %26 = "vector.reduction"(%arg26) <{fastmath = #arith.fastmath<reassoc,nnan,ninf>, kind = #vector.kind<minnumf>}> : (vector<42xf32>) -> f32
    "func.return"(%26) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<f32>, vector<f32>) -> vector<2xf32>, sym_name = "interleave_0d"}> ({
  ^bb0(%arg24: vector<f32>, %arg25: vector<f32>):
    %25 = "vector.interleave"(%arg24, %arg25) : (vector<f32>, vector<f32>) -> vector<2xf32>
    "func.return"(%25) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>) -> vector<8xf32>, sym_name = "interleave_1d"}> ({
  ^bb0(%arg22: vector<4xf32>, %arg23: vector<4xf32>):
    %24 = "vector.interleave"(%arg22, %arg23) : (vector<4xf32>, vector<4xf32>) -> vector<8xf32>
    "func.return"(%24) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[8]xi16>, vector<[8]xi16>) -> vector<[16]xi16>, sym_name = "interleave_1d_scalable"}> ({
  ^bb0(%arg20: vector<[8]xi16>, %arg21: vector<[8]xi16>):
    %23 = "vector.interleave"(%arg20, %arg21) : (vector<[8]xi16>, vector<[8]xi16>) -> vector<[16]xi16>
    "func.return"(%23) : (vector<[16]xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x8xf32>, vector<2x8xf32>) -> vector<2x16xf32>, sym_name = "interleave_2d"}> ({
  ^bb0(%arg18: vector<2x8xf32>, %arg19: vector<2x8xf32>):
    %22 = "vector.interleave"(%arg18, %arg19) : (vector<2x8xf32>, vector<2x8xf32>) -> vector<2x16xf32>
    "func.return"(%22) : (vector<2x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x[2]xf64>, vector<2x[2]xf64>) -> vector<2x[4]xf64>, sym_name = "interleave_2d_scalable"}> ({
  ^bb0(%arg16: vector<2x[2]xf64>, %arg17: vector<2x[2]xf64>):
    %21 = "vector.interleave"(%arg16, %arg17) : (vector<2x[2]xf64>, vector<2x[2]xf64>) -> vector<2x[4]xf64>
    "func.return"(%21) : (vector<2x[4]xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> (vector<2xf32>, vector<2xf32>), sym_name = "deinterleave_1d"}> ({
  ^bb0(%arg15: vector<4xf32>):
    %20:2 = "vector.deinterleave"(%arg15) : (vector<4xf32>) -> (vector<2xf32>, vector<2xf32>)
    "func.return"(%20#0, %20#1) : (vector<2xf32>, vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]xf32>) -> (vector<[2]xf32>, vector<[2]xf32>), sym_name = "deinterleave_1d_scalable"}> ({
  ^bb0(%arg14: vector<[4]xf32>):
    %19:2 = "vector.deinterleave"(%arg14) : (vector<[4]xf32>) -> (vector<[2]xf32>, vector<[2]xf32>)
    "func.return"(%19#0, %19#1) : (vector<[2]xf32>, vector<[2]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x4xf32>) -> (vector<3x2xf32>, vector<3x2xf32>), sym_name = "deinterleave_2d"}> ({
  ^bb0(%arg13: vector<3x4xf32>):
    %18:2 = "vector.deinterleave"(%arg13) : (vector<3x4xf32>) -> (vector<3x2xf32>, vector<3x2xf32>)
    "func.return"(%18#0, %18#1) : (vector<3x2xf32>, vector<3x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x[4]xf32>) -> (vector<3x[2]xf32>, vector<3x[2]xf32>), sym_name = "deinterleave_2d_scalable"}> ({
  ^bb0(%arg12: vector<3x[4]xf32>):
    %17:2 = "vector.deinterleave"(%arg12) : (vector<3x[4]xf32>) -> (vector<3x[2]xf32>, vector<3x[2]xf32>)
    "func.return"(%17#0, %17#1) : (vector<3x[2]xf32>, vector<3x[2]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3x4x6xf32>) -> (vector<2x3x4x3xf32>, vector<2x3x4x3xf32>), sym_name = "deinterleave_nd"}> ({
  ^bb0(%arg11: vector<2x3x4x6xf32>):
    %16:2 = "vector.deinterleave"(%arg11) : (vector<2x3x4x6xf32>) -> (vector<2x3x4x3xf32>, vector<2x3x4x3xf32>)
    "func.return"(%16#0, %16#1) : (vector<2x3x4x3xf32>, vector<2x3x4x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x3x4x[6]xf32>) -> (vector<2x3x4x[3]xf32>, vector<2x3x4x[3]xf32>), sym_name = "deinterleave_nd_scalable"}> ({
  ^bb0(%arg10: vector<2x3x4x[6]xf32>):
    %15:2 = "vector.deinterleave"(%arg10) : (vector<2x3x4x[6]xf32>) -> (vector<2x3x4x[3]xf32>, vector<2x3x4x[3]xf32>)
    "func.return"(%15#0, %15#1) : (vector<2x3x4x[3]xf32>, vector<2x3x4x[3]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<f32>, vector<1xf32>, vector<1x2xf32>, vector<2x2xf32>) -> (f32, f32, f32, f32, f32, f32, f32, f32), sym_name = "to_elements"}> ({
  ^bb0(%arg6: vector<f32>, %arg7: vector<1xf32>, %arg8: vector<1x2xf32>, %arg9: vector<2x2xf32>):
    %11 = "vector.to_elements"(%arg6) : (vector<f32>) -> f32
    %12 = "vector.to_elements"(%arg7) : (vector<1xf32>) -> f32
    %13:2 = "vector.to_elements"(%arg8) : (vector<1x2xf32>) -> (f32, f32)
    %14:4 = "vector.to_elements"(%arg9) : (vector<2x2xf32>) -> (f32, f32, f32, f32)
    "func.return"(%11, %12, %13#0, %13#1, %14#0, %14#1, %14#2, %14#3) : (f32, f32, f32, f32, f32, f32, f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> (vector<f32>, vector<1xf32>, vector<1x2xf32>, vector<2x2xf32>), sym_name = "from_elements"}> ({
  ^bb0(%arg4: f32, %arg5: f32):
    %7 = "vector.from_elements"(%arg4) : (f32) -> vector<f32>
    %8 = "vector.from_elements"(%arg4) : (f32) -> vector<1xf32>
    %9 = "vector.from_elements"(%arg4, %arg5) : (f32, f32) -> vector<1x2xf32>
    %10 = "vector.from_elements"(%arg5, %arg5, %arg4, %arg4) : (f32, f32, f32, f32) -> vector<2x2xf32>
    "func.return"(%7, %8, %9, %10) : (vector<f32>, vector<1xf32>, vector<1x2xf32>, vector<2x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "step"}> ({
    %2 = "vector.step"() : () -> vector<2xindex>
    %3 = "vector.step"() : () -> vector<[4]xindex>
    %4 = "vector.step"() : () -> vector<2xi32>
    %5 = "vector.step"() : () -> vector<8xi8>
    %6 = "vector.step"() : () -> vector<[4]xi16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16x16xf32>, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> tensor<16x16xf32>, sym_name = "scatter_tensor"}> ({
  ^bb0(%arg0: tensor<16x16xf32>, %arg1: vector<16xi32>, %arg2: vector<16xi1>, %arg3: vector<16xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "vector.scatter"(%arg0, %0, %0, %arg1, %arg2, %arg3) : (tensor<16x16xf32>, index, index, vector<16xi32>, vector<16xi1>, vector<16xf32>) -> tensor<16x16xf32>
    "func.return"(%1) : (tensor<16x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

