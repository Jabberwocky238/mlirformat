#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0, d1) -> (d1)>
#map4 = affine_map<(d0) -> (d0 + 3)>
#map5 = affine_map<(d0) -> (d0 + 1)>
#map6 = affine_map<(d0) -> (d0 + 4)>
"builtin.module"() ({
  "func.func"() <{function_type = (i1, memref<4x4xf32>, vector<1x4xf32>, vector<1x4xf32>, index) -> (), sym_name = "forward_dead_store"}> ({
  ^bb0(%arg96: i1, %arg97: memref<4x4xf32>, %arg98: vector<1x4xf32>, %arg99: vector<1x4xf32>, %arg100: index):
    %148 = "arith.constant"() <{value = 1 : index}> : () -> index
    %149 = "arith.constant"() <{value = 4 : index}> : () -> index
    %150 = "arith.constant"() <{value = 0 : index}> : () -> index
    %151 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "vector.transfer_write"(%arg98, %arg97, %148, %150) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    %152 = "vector.transfer_read"(%arg97, %148, %150, %151) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<1x4xf32>
    %153 = "scf.for"(%150, %149, %148, %152) ({
    ^bb0(%arg101: index, %arg102: vector<1x4xf32>):
      %154 = "arith.addf"(%arg102, %arg102) <{fastmath = #arith.fastmath<none>}> : (vector<1x4xf32>, vector<1x4xf32>) -> vector<1x4xf32>
      "scf.yield"(%154) : (vector<1x4xf32>) -> ()
    }) : (index, index, index, vector<1x4xf32>) -> vector<1x4xf32>
    "vector.transfer_write"(%153, %arg97, %148, %150) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, memref<4x4xf32>, vector<1x4xf32>, vector<1x4xf32>, index) -> (), sym_name = "forward_nested"}> ({
  ^bb0(%arg91: i1, %arg92: memref<4x4xf32>, %arg93: vector<1x4xf32>, %arg94: vector<1x4xf32>, %arg95: index):
    %143 = "arith.constant"() <{value = 0 : index}> : () -> index
    %144 = "arith.constant"() <{value = 1 : index}> : () -> index
    %145 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "vector.transfer_write"(%arg94, %arg92, %arg95, %143) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    "vector.transfer_write"(%arg93, %arg92, %144, %143) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    %146 = "scf.if"(%arg91) ({
      %147 = "vector.transfer_read"(%arg92, %144, %143, %145) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<1x4xf32>
      "scf.yield"(%147) : (vector<1x4xf32>) -> ()
    }, {
      "scf.yield"(%arg94) : (vector<1x4xf32>) -> ()
    }) : (i1) -> vector<1x4xf32>
    "vector.transfer_write"(%146, %arg92, %143, %143) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, memref<4x4xf32>, vector<1x4xf32>, vector<1x4xf32>, index) -> (), sym_name = "forward_nested_negative"}> ({
  ^bb0(%arg86: i1, %arg87: memref<4x4xf32>, %arg88: vector<1x4xf32>, %arg89: vector<1x4xf32>, %arg90: index):
    %138 = "arith.constant"() <{value = 0 : index}> : () -> index
    %139 = "arith.constant"() <{value = 1 : index}> : () -> index
    %140 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "vector.transfer_write"(%arg88, %arg87, %139, %138) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    %141 = "scf.if"(%arg86) ({
      %142 = "vector.transfer_read"(%arg87, %139, %138, %140) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<1x4xf32>
      "scf.yield"(%142) : (vector<1x4xf32>) -> ()
    }, {
      "vector.transfer_write"(%arg89, %arg87, %arg90, %138) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
      "scf.yield"(%arg89) : (vector<1x4xf32>) -> ()
    }) : (i1) -> vector<1x4xf32>
    "vector.transfer_write"(%141, %arg87, %138, %arg90) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, memref<4x4xf32>, vector<1x4xf32>, vector<1x4xf32>, index) -> vector<1x4xf32>, sym_name = "dead_store_region"}> ({
  ^bb0(%arg81: i1, %arg82: memref<4x4xf32>, %arg83: vector<1x4xf32>, %arg84: vector<1x4xf32>, %arg85: index):
    %132 = "arith.constant"() <{value = 0 : index}> : () -> index
    %133 = "arith.constant"() <{value = 1 : index}> : () -> index
    %134 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "vector.transfer_write"(%arg83, %arg82, %133, %132) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    %135 = "scf.if"(%arg81) ({
      "scf.yield"(%arg84) : (vector<1x4xf32>) -> ()
    }, {
      %137 = "vector.transfer_read"(%arg82, %arg85, %132, %134) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<1x4xf32>
      "scf.yield"(%137) : (vector<1x4xf32>) -> ()
    }) : (i1) -> vector<1x4xf32>
    "scf.if"(%arg81) ({
      "vector.transfer_write"(%arg83, %arg82, %133, %132) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "vector.transfer_write"(%135, %arg82, %133, %132) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    "vector.transfer_write"(%135, %arg82, %133, %132) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    %136 = "vector.transfer_read"(%arg82, %arg85, %132, %134) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<1x4xf32>
    "func.return"(%136) : (vector<1x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, memref<4x4xf32>, vector<1x4xf32>, vector<1x4xf32>, index) -> (), sym_name = "dead_store_negative"}> ({
  ^bb0(%arg76: i1, %arg77: memref<4x4xf32>, %arg78: vector<1x4xf32>, %arg79: vector<1x4xf32>, %arg80: index):
    %127 = "arith.constant"() <{value = 0 : index}> : () -> index
    %128 = "arith.constant"() <{value = 1 : index}> : () -> index
    %129 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %130 = "scf.if"(%arg76) ({
      "vector.transfer_write"(%arg78, %arg77, %128, %127) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
      %131 = "vector.transfer_read"(%arg77, %arg80, %127, %129) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<1x4xf32>
      "scf.yield"(%131) : (vector<1x4xf32>) -> ()
    }, {
      "scf.yield"(%arg79) : (vector<1x4xf32>) -> ()
    }) : (i1) -> vector<1x4xf32>
    "vector.transfer_write"(%130, %arg77, %128, %127) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i1, memref<4x4xf32>, vector<1x4xf32>, vector<1x4xf32>, index) -> (), sym_name = "dead_store_nested_region"}> ({
  ^bb0(%arg70: i1, %arg71: i1, %arg72: memref<4x4xf32>, %arg73: vector<1x4xf32>, %arg74: vector<1x4xf32>, %arg75: index):
    %123 = "arith.constant"() <{value = 0 : index}> : () -> index
    %124 = "arith.constant"() <{value = 1 : index}> : () -> index
    %125 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "scf.if"(%arg70) ({
      %126 = "vector.transfer_read"(%arg72, %arg75, %123, %125) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<1x4xf32>
      "scf.if"(%arg71) ({
        "vector.transfer_write"(%arg74, %arg72, %124, %123) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "vector.transfer_write"(%arg73, %arg72, %124, %123) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
      "scf.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, memref<4x4xf32>, vector<1x4xf32>, vector<1x1xf32>, vector<1x4xf32>, index) -> vector<1x4xf32>, sym_name = "forward_dead_store_negative"}> ({
  ^bb0(%arg64: i1, %arg65: memref<4x4xf32>, %arg66: vector<1x4xf32>, %arg67: vector<1x1xf32>, %arg68: vector<1x4xf32>, %arg69: index):
    %117 = "memref.subview"(%arg65) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 2, 2>, static_strides = array<i64: 1, 1>}> : (memref<4x4xf32>) -> memref<2x2xf32, strided<[4, 1]>>
    %118 = "arith.constant"() <{value = 1 : index}> : () -> index
    %119 = "arith.constant"() <{value = 4 : index}> : () -> index
    %120 = "arith.constant"() <{value = 0 : index}> : () -> index
    %121 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "vector.transfer_write"(%arg66, %arg65, %118, %120) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    "vector.transfer_write"(%arg67, %117, %120, %120) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x1xf32>, memref<2x2xf32, strided<[4, 1]>>, index, index) -> ()
    "vector.transfer_write"(%arg68, %arg65, %118, %120) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    "vector.transfer_write"(%arg67, %117, %118, %120) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x1xf32>, memref<2x2xf32, strided<[4, 1]>>, index, index) -> ()
    %122 = "vector.transfer_read"(%arg65, %118, %120, %121) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xf32>, index, index, f32) -> vector<1x4xf32>
    "vector.transfer_write"(%arg68, %arg65, %118, %120) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<1x4xf32>, memref<4x4xf32>, index, index) -> ()
    "func.return"(%122) : (vector<1x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x20x1xi32>, vector<4xi32>) -> (), sym_name = "collapse_shape_and_read_from_source"}> ({
  ^bb0(%arg61: memref<1x20x1xi32>, %arg62: vector<4xi32>):
    %108 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %109 = "arith.constant"() <{value = 0 : index}> : () -> index
    %110 = "arith.constant"() <{value = 4 : index}> : () -> index
    %111 = "arith.constant"() <{value = 20 : index}> : () -> index
    %112 = "memref.alloca"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x4x1xi32>
    %113 = "memref.collapse_shape"(%112) <{reassociation = [[0, 1, 2]]}> : (memref<1x4x1xi32>) -> memref<4xi32>
    "scf.for"(%109, %111, %110) ({
    ^bb0(%arg63: index):
      %114 = "memref.subview"(%arg61, %arg63) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808, 0>, static_sizes = array<i64: 1, 4, 1>, static_strides = array<i64: 1, 1, 1>}> : (memref<1x20x1xi32>, index) -> memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>
      %115 = "vector.transfer_read"(%114, %109, %109, %109, %108) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map1}> : (memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>, index, index, index, i32) -> vector<1x4x1xi32>
      "vector.transfer_write"(%115, %112, %109, %109, %109) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<1x4x1xi32>, memref<1x4x1xi32>, index, index, index) -> ()
      "vector.transfer_write"(%arg62, %113, %109) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (vector<4xi32>, memref<4xi32>, index) -> ()
      %116 = "vector.transfer_read"(%112, %109, %109, %109, %108) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map1}> : (memref<1x4x1xi32>, index, index, index, i32) -> vector<1x4x1xi32>
      "vector.transfer_write"(%116, %114, %109, %109, %109) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<1x4x1xi32>, memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>, index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<20xi32>, vector<1x4x1xi32>) -> (), sym_name = "expand_shape_and_read_from_source"}> ({
  ^bb0(%arg58: memref<20xi32>, %arg59: vector<1x4x1xi32>):
    %99 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %100 = "arith.constant"() <{value = 0 : index}> : () -> index
    %101 = "arith.constant"() <{value = 4 : index}> : () -> index
    %102 = "arith.constant"() <{value = 20 : index}> : () -> index
    %103 = "memref.alloca"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi32>
    %104 = "memref.expand_shape"(%103) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 1, 4, 1>}> : (memref<4xi32>) -> memref<1x4x1xi32>
    "scf.for"(%100, %102, %101) ({
    ^bb0(%arg60: index):
      %105 = "memref.subview"(%arg58, %arg60) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (memref<20xi32>, index) -> memref<4xi32, strided<[1], offset: ?>>
      %106 = "vector.transfer_read"(%105, %100, %99) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<4xi32, strided<[1], offset: ?>>, index, i32) -> vector<4xi32>
      "vector.transfer_write"(%106, %103, %100) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (vector<4xi32>, memref<4xi32>, index) -> ()
      "vector.transfer_write"(%arg59, %104, %100, %100, %100) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<1x4x1xi32>, memref<1x4x1xi32>, index, index, index) -> ()
      %107 = "vector.transfer_read"(%103, %100, %99) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<4xi32>, index, i32) -> vector<4xi32>
      "vector.transfer_write"(%107, %105, %100) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (vector<4xi32>, memref<4xi32, strided<[1], offset: ?>>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<20xi32>, vector<1x4x1xi32>) -> (), sym_name = "collapse_shape_and_read_from_collapse"}> ({
  ^bb0(%arg55: memref<20xi32>, %arg56: vector<1x4x1xi32>):
    %90 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %91 = "arith.constant"() <{value = 0 : index}> : () -> index
    %92 = "arith.constant"() <{value = 4 : index}> : () -> index
    %93 = "arith.constant"() <{value = 20 : index}> : () -> index
    %94 = "memref.alloca"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x4x1xi32>
    %95 = "memref.collapse_shape"(%94) <{reassociation = [[0, 1, 2]]}> : (memref<1x4x1xi32>) -> memref<4xi32>
    "scf.for"(%91, %93, %92) ({
    ^bb0(%arg57: index):
      %96 = "memref.subview"(%arg55, %arg57) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (memref<20xi32>, index) -> memref<4xi32, strided<[1], offset: ?>>
      %97 = "vector.transfer_read"(%96, %91, %90) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<4xi32, strided<[1], offset: ?>>, index, i32) -> vector<4xi32>
      "vector.transfer_write"(%97, %95, %91) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (vector<4xi32>, memref<4xi32>, index) -> ()
      "vector.transfer_write"(%arg56, %94, %91, %91, %91) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<1x4x1xi32>, memref<1x4x1xi32>, index, index, index) -> ()
      %98 = "vector.transfer_read"(%95, %91, %90) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (memref<4xi32>, index, i32) -> vector<4xi32>
      "vector.transfer_write"(%98, %96, %91) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (vector<4xi32>, memref<4xi32, strided<[1], offset: ?>>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x20x1xi32>, vector<4xi32>) -> (), sym_name = "expand_shape_and_read_from_expand"}> ({
  ^bb0(%arg52: memref<1x20x1xi32>, %arg53: vector<4xi32>):
    %81 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %82 = "arith.constant"() <{value = 0 : index}> : () -> index
    %83 = "arith.constant"() <{value = 4 : index}> : () -> index
    %84 = "arith.constant"() <{value = 20 : index}> : () -> index
    %85 = "memref.alloca"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi32>
    %86 = "memref.expand_shape"(%85) <{reassociation = [[0, 1, 2]], static_output_shape = array<i64: 1, 4, 1>}> : (memref<4xi32>) -> memref<1x4x1xi32>
    "scf.for"(%82, %84, %83) ({
    ^bb0(%arg54: index):
      %87 = "memref.subview"(%arg52, %arg54) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: 0, -9223372036854775808, 0>, static_sizes = array<i64: 1, 4, 1>, static_strides = array<i64: 1, 1, 1>}> : (memref<1x20x1xi32>, index) -> memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>
      %88 = "vector.transfer_read"(%87, %82, %82, %82, %81) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map1}> : (memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>, index, index, index, i32) -> vector<1x4x1xi32>
      "vector.transfer_write"(%88, %86, %82, %82, %82) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<1x4x1xi32>, memref<1x4x1xi32>, index, index, index) -> ()
      "vector.transfer_write"(%arg53, %85, %82) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map2}> : (vector<4xi32>, memref<4xi32>, index) -> ()
      %89 = "vector.transfer_read"(%86, %82, %82, %82, %81) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map1}> : (memref<1x4x1xi32>, index, index, index, i32) -> vector<1x4x1xi32>
      "vector.transfer_write"(%89, %87, %82, %82, %82) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<1x4x1xi32>, memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>, index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<4xf32>, vector<4xf32>, index) -> (), sym_name = "forward_dead_store_dynamic_same_index"}> ({
  ^bb0(%arg46: memref<?x?xf32>, %arg47: vector<4xf32>, %arg48: vector<4xf32>, %arg49: index):
    %74 = "arith.constant"() <{value = 1 : index}> : () -> index
    %75 = "arith.constant"() <{value = 4 : index}> : () -> index
    %76 = "arith.constant"() <{value = 0 : index}> : () -> index
    %77 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "vector.transfer_write"(%arg47, %arg46, %arg49, %arg49) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
    %78 = "vector.transfer_read"(%arg46, %arg49, %arg49, %77) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (memref<?x?xf32>, index, index, f32) -> vector<4xf32>
    %79 = "scf.for"(%76, %75, %74, %78) ({
    ^bb0(%arg50: index, %arg51: vector<4xf32>):
      %80 = "arith.addf"(%arg51, %arg51) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
      "scf.yield"(%80) : (vector<4xf32>) -> ()
    }) : (index, index, index, vector<4xf32>) -> vector<4xf32>
    "vector.transfer_write"(%79, %arg46, %arg49, %arg49) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<4xf32>, vector<4xf32>, index) -> (), sym_name = "dont_forward_dead_store_dynamic_overlap"}> ({
  ^bb0(%arg40: memref<?x?xf32>, %arg41: vector<4xf32>, %arg42: vector<4xf32>, %arg43: index):
    %66 = "arith.constant"() <{value = 1 : index}> : () -> index
    %67 = "arith.constant"() <{value = 4 : index}> : () -> index
    %68 = "arith.constant"() <{value = 0 : index}> : () -> index
    %69 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %70 = "affine.apply"(%arg43) <{map = #map4}> : (index) -> index
    "vector.transfer_write"(%arg41, %arg40, %arg43, %arg43) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
    "vector.transfer_write"(%arg41, %arg40, %arg43, %70) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
    %71 = "vector.transfer_read"(%arg40, %arg43, %arg43, %69) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (memref<?x?xf32>, index, index, f32) -> vector<4xf32>
    %72 = "scf.for"(%68, %67, %66, %71) ({
    ^bb0(%arg44: index, %arg45: vector<4xf32>):
      %73 = "arith.addf"(%arg45, %arg45) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
      "scf.yield"(%73) : (vector<4xf32>) -> ()
    }) : (index, index, index, vector<4xf32>) -> vector<4xf32>
    "vector.transfer_write"(%72, %arg40, %arg43, %arg43) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<4xf32>, vector<4xf32>, index) -> (), sym_name = "forward_dead_store_dynamic_non_overlap_leading_dim"}> ({
  ^bb0(%arg34: memref<?x?xf32>, %arg35: vector<4xf32>, %arg36: vector<4xf32>, %arg37: index):
    %58 = "arith.constant"() <{value = 1 : index}> : () -> index
    %59 = "arith.constant"() <{value = 4 : index}> : () -> index
    %60 = "arith.constant"() <{value = 0 : index}> : () -> index
    %61 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %62 = "affine.apply"(%arg37) <{map = #map5}> : (index) -> index
    "vector.transfer_write"(%arg35, %arg34, %arg37, %arg37) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
    "vector.transfer_write"(%arg35, %arg34, %62, %arg37) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
    %63 = "vector.transfer_read"(%arg34, %arg37, %arg37, %61) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (memref<?x?xf32>, index, index, f32) -> vector<4xf32>
    %64 = "scf.for"(%60, %59, %58, %63) ({
    ^bb0(%arg38: index, %arg39: vector<4xf32>):
      %65 = "arith.addf"(%arg39, %arg39) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
      "scf.yield"(%65) : (vector<4xf32>) -> ()
    }) : (index, index, index, vector<4xf32>) -> vector<4xf32>
    "vector.transfer_write"(%64, %arg34, %arg37, %arg37) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<4xf32>, vector<4xf32>, index) -> (), sym_name = "forward_dead_store_dynamic_non_overlap_trailing_dim"}> ({
  ^bb0(%arg28: memref<?x?xf32>, %arg29: vector<4xf32>, %arg30: vector<4xf32>, %arg31: index):
    %50 = "arith.constant"() <{value = 1 : index}> : () -> index
    %51 = "arith.constant"() <{value = 4 : index}> : () -> index
    %52 = "arith.constant"() <{value = 0 : index}> : () -> index
    %53 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %54 = "affine.apply"(%arg31) <{map = #map6}> : (index) -> index
    "vector.transfer_write"(%arg29, %arg28, %arg31, %arg31) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
    "vector.transfer_write"(%arg29, %arg28, %arg31, %54) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
    %55 = "vector.transfer_read"(%arg28, %arg31, %arg31, %53) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map3}> : (memref<?x?xf32>, index, index, f32) -> vector<4xf32>
    %56 = "scf.for"(%52, %51, %50, %55) ({
    ^bb0(%arg32: index, %arg33: vector<4xf32>):
      %57 = "arith.addf"(%arg33, %arg33) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
      "scf.yield"(%57) : (vector<4xf32>) -> ()
    }) : (index, index, index, vector<4xf32>) -> vector<4xf32>
    "vector.transfer_write"(%56, %arg28, %arg31, %arg31) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map3}> : (vector<4xf32>, memref<?x?xf32>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<[8]x[8]xi1>) -> (), sym_name = "forward_dead_constant_splat_store_with_masking"}> ({
  ^bb0(%arg24: memref<?x?xf32>, %arg25: vector<[8]x[8]xi1>):
    %42 = "arith.constant"() <{value = dense<0.000000e+00> : vector<[8]x[8]xf32>}> : () -> vector<[8]x[8]xf32>
    %43 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %44 = "arith.constant"() <{value = 1 : index}> : () -> index
    %45 = "arith.constant"() <{value = 0 : index}> : () -> index
    %46 = "arith.constant"() <{value = 512 : index}> : () -> index
    "vector.transfer_write"(%42, %arg24, %45, %45, %arg25) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[8]x[8]xf32>, memref<?x?xf32>, index, index, vector<[8]x[8]xi1>) -> ()
    %47 = "vector.transfer_read"(%arg24, %45, %45, %43, %arg25) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32, vector<[8]x[8]xi1>) -> vector<[8]x[8]xf32>
    %48 = "scf.for"(%45, %46, %44, %47) ({
    ^bb0(%arg26: index, %arg27: vector<[8]x[8]xf32>):
      %49 = "arith.addf"(%arg27, %arg27) <{fastmath = #arith.fastmath<none>}> : (vector<[8]x[8]xf32>, vector<[8]x[8]xf32>) -> vector<[8]x[8]xf32>
      "scf.yield"(%49) : (vector<[8]x[8]xf32>) -> ()
    }) : (index, index, index, vector<[8]x[8]xf32>) -> vector<[8]x[8]xf32>
    "vector.transfer_write"(%48, %arg24, %45, %45, %arg25) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[8]x[8]xf32>, memref<?x?xf32>, index, index, vector<[8]x[8]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<[8]x[8]xi1>) -> (), sym_name = "forward_dead_constant_splat_store_with_masking_unmasked_write"}> ({
  ^bb0(%arg20: memref<?x?xf32>, %arg21: vector<[8]x[8]xi1>):
    %34 = "arith.constant"() <{value = dense<0.000000e+00> : vector<[8]x[8]xf32>}> : () -> vector<[8]x[8]xf32>
    %35 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %36 = "arith.constant"() <{value = 1 : index}> : () -> index
    %37 = "arith.constant"() <{value = 0 : index}> : () -> index
    %38 = "arith.constant"() <{value = 512 : index}> : () -> index
    "vector.transfer_write"(%34, %arg20, %37, %37) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[8]x[8]xf32>, memref<?x?xf32>, index, index) -> ()
    %39 = "vector.transfer_read"(%arg20, %37, %37, %35, %arg21) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32, vector<[8]x[8]xi1>) -> vector<[8]x[8]xf32>
    %40 = "scf.for"(%37, %38, %36, %39) ({
    ^bb0(%arg22: index, %arg23: vector<[8]x[8]xf32>):
      %41 = "arith.addf"(%arg23, %arg23) <{fastmath = #arith.fastmath<none>}> : (vector<[8]x[8]xf32>, vector<[8]x[8]xf32>) -> vector<[8]x[8]xf32>
      "scf.yield"(%41) : (vector<[8]x[8]xf32>) -> ()
    }) : (index, index, index, vector<[8]x[8]xf32>) -> vector<[8]x[8]xf32>
    "vector.transfer_write"(%40, %arg20, %37, %37, %arg21) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[8]x[8]xf32>, memref<?x?xf32>, index, index, vector<[8]x[8]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<[8]x[8]xi1>) -> (), sym_name = "forward_dead_constant_splat_store_with_masking_negative_0"}> ({
  ^bb0(%arg16: memref<?x?xf32>, %arg17: vector<[8]x[8]xi1>):
    %26 = "arith.constant"() <{value = dense<0.000000e+00> : vector<[8]x[8]xf32>}> : () -> vector<[8]x[8]xf32>
    %27 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %28 = "arith.constant"() <{value = 1 : index}> : () -> index
    %29 = "arith.constant"() <{value = 0 : index}> : () -> index
    %30 = "arith.constant"() <{value = 512 : index}> : () -> index
    "vector.transfer_write"(%26, %arg16, %29, %29, %arg17) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[8]x[8]xf32>, memref<?x?xf32>, index, index, vector<[8]x[8]xi1>) -> ()
    %31 = "vector.transfer_read"(%arg16, %29, %29, %27, %arg17) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32, vector<[8]x[8]xi1>) -> vector<[8]x[8]xf32>
    %32 = "scf.for"(%29, %30, %28, %31) ({
    ^bb0(%arg18: index, %arg19: vector<[8]x[8]xf32>):
      %33 = "arith.addf"(%arg19, %arg19) <{fastmath = #arith.fastmath<none>}> : (vector<[8]x[8]xf32>, vector<[8]x[8]xf32>) -> vector<[8]x[8]xf32>
      "scf.yield"(%33) : (vector<[8]x[8]xf32>) -> ()
    }) : (index, index, index, vector<[8]x[8]xf32>) -> vector<[8]x[8]xf32>
    "vector.transfer_write"(%32, %arg16, %29, %29, %arg17) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[8]x[8]xf32>, memref<?x?xf32>, index, index, vector<[8]x[8]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<[8]x[8]xi1>, vector<[8]x[8]xi1>) -> (), sym_name = "forward_dead_constant_splat_store_with_masking_negative_1"}> ({
  ^bb0(%arg11: memref<?x?xf32>, %arg12: vector<[8]x[8]xi1>, %arg13: vector<[8]x[8]xi1>):
    %18 = "arith.constant"() <{value = dense<0.000000e+00> : vector<[8]x[8]xf32>}> : () -> vector<[8]x[8]xf32>
    %19 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %20 = "arith.constant"() <{value = 1 : index}> : () -> index
    %21 = "arith.constant"() <{value = 0 : index}> : () -> index
    %22 = "arith.constant"() <{value = 512 : index}> : () -> index
    "vector.transfer_write"(%18, %arg11, %21, %21, %arg12) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[8]x[8]xf32>, memref<?x?xf32>, index, index, vector<[8]x[8]xi1>) -> ()
    %23 = "vector.transfer_read"(%arg11, %21, %21, %19, %arg13) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32, vector<[8]x[8]xi1>) -> vector<[8]x[8]xf32>
    %24 = "scf.for"(%21, %22, %20, %23) ({
    ^bb0(%arg14: index, %arg15: vector<[8]x[8]xf32>):
      %25 = "arith.addf"(%arg15, %arg15) <{fastmath = #arith.fastmath<none>}> : (vector<[8]x[8]xf32>, vector<[8]x[8]xf32>) -> vector<[8]x[8]xf32>
      "scf.yield"(%25) : (vector<[8]x[8]xf32>) -> ()
    }) : (index, index, index, vector<[8]x[8]xf32>) -> vector<[8]x[8]xf32>
    "vector.transfer_write"(%24, %arg11, %21, %21, %arg12) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[8]x[8]xf32>, memref<?x?xf32>, index, index, vector<[8]x[8]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<[8]x[8]xi1>) -> (), sym_name = "forward_dead_constant_splat_store_with_masking_negative_3"}> ({
  ^bb0(%arg7: memref<?x?xf32>, %arg8: vector<[8]x[8]xi1>):
    %10 = "arith.constant"() <{value = dense<0.000000e+00> : vector<[8]x[8]xf32>}> : () -> vector<[8]x[8]xf32>
    %11 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %12 = "arith.constant"() <{value = 1 : index}> : () -> index
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index
    %14 = "arith.constant"() <{value = 512 : index}> : () -> index
    "vector.transfer_write"(%10, %arg7, %13, %13, %arg8) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[8]x[8]xf32>, memref<?x?xf32>, index, index, vector<[8]x[8]xi1>) -> ()
    %15 = "vector.transfer_read"(%arg7, %13, %13, %11) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<[8]x[8]xf32>
    %16 = "scf.for"(%13, %14, %12, %15) ({
    ^bb0(%arg9: index, %arg10: vector<[8]x[8]xf32>):
      %17 = "arith.addf"(%arg10, %arg10) <{fastmath = #arith.fastmath<none>}> : (vector<[8]x[8]xf32>, vector<[8]x[8]xf32>) -> vector<[8]x[8]xf32>
      "scf.yield"(%17) : (vector<[8]x[8]xf32>) -> ()
    }) : (index, index, index, vector<[8]x[8]xf32>) -> vector<[8]x[8]xf32>
    "vector.transfer_write"(%16, %arg7, %13, %13, %arg8) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[8]x[8]xf32>, memref<?x?xf32>, index, index, vector<[8]x[8]xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xf32>, vector<[8]x[8]xf32>, index, index, index) -> (), sym_name = "forward_and_eliminate_stores_through_trivial_aliases"}> ({
  ^bb0(%arg0: memref<?x?xf32>, %arg1: vector<[8]x[8]xf32>, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 32 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "vector.transfer_write"(%arg1, %arg0, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[8]x[8]xf32>, memref<?x?xf32>, index, index) -> ()
    %4 = "memref.subview"(%arg0, %arg3, %arg3) <{operandSegmentSizes = array<i32: 1, 0, 2, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index) -> memref<?x?xf32, strided<[?, 1]>>
    %5 = "memref.cast"(%4) : (memref<?x?xf32, strided<[?, 1]>>) -> memref<?x?xf32>
    %6 = "memref.subview"(%5, %arg4, %arg4) <{operandSegmentSizes = array<i32: 1, 0, 2, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index) -> memref<?x?xf32, strided<[?, 1]>>
    %7 = "vector.transfer_read"(%4, %0, %0, %3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32, strided<[?, 1]>>, index, index, f32) -> vector<[8]x[8]xf32>
    %8 = "scf.for"(%0, %2, %1, %7) ({
    ^bb0(%arg5: index, %arg6: vector<[8]x[8]xf32>):
      %9 = "arith.addf"(%arg6, %arg6) <{fastmath = #arith.fastmath<none>}> : (vector<[8]x[8]xf32>, vector<[8]x[8]xf32>) -> vector<[8]x[8]xf32>
      "scf.yield"(%9) : (vector<[8]x[8]xf32>) -> ()
    }) : (index, index, index, vector<[8]x[8]xf32>) -> vector<[8]x[8]xf32>
    "vector.transfer_write"(%8, %6, %0, %0) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<[8]x[8]xf32>, memref<?x?xf32, strided<[?, 1]>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

