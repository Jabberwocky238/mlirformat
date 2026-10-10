#map = affine_map<(d0, d1, d2, d3, d4)[s0] -> (d0, d1, d2, d4, d3)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map2 = affine_map<() -> (1)>
#map3 = affine_map<() -> (10)>
#map4 = affine_map<() -> (200)>
#map5 = affine_map<() -> (100)>
#map6 = affine_map<(d0) -> (d0)>
#map7 = affine_map<()[s0] -> (s0)>
#map8 = affine_map<()[s0] -> (0, s0 - 1)>
#map9 = affine_map<()[s0] -> (100, s0 + 1)>
#map10 = affine_map<(d0, d1)[s0] -> (d0 + d1)>
#map11 = affine_map<(d0, d1)[s0] -> (s0 + 1)>
#map12 = affine_map<(d0, d1) -> (d0 + d1)>
#map13 = affine_map<(d0)[s0] -> (d0 + s0, d0 - s0)>
#map14 = affine_map<(d0, d1)[s0] -> (d0 + d1 + s0)>
#map15 = affine_map<() -> (0)>
#map16 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map17 = affine_map<()[s0] -> (s0 + 3)>
#map18 = affine_map<()[s0, s1] -> (s0 + s1)>
#map19 = affine_map<(d0)[s0] -> (d0 + s0)>
#set = affine_set<(d0)[s0] : (d0 - 2 >= 0, -d0 + 4 >= 0)>
#set1 = affine_set<(d0)[s0, s1] : (d0 >= 0, -d0 + s0 >= 0, s0 - 5 == 0, -d0 + s1 + 1 >= 0)>
#set2 = affine_set<(d0, d1)[s0] : (d0 >= 0, d1 >= 0)>
#set3 = affine_set<(d0, d1, d2) : (d0 >= 0, d1 >= 0, d2 - d1 == 0)>
#set4 = affine_set<(d0) : (d0 - 1 == 0)>
#set5 = affine_set<() : (0 == 0)>
"builtin.module"() ({
  "func.func"() <{function_type = (i32, i64) -> f32, sym_name = "foo", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "bar", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (i1, index, f32), sym_name = "baz", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "missingReturn", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (i0, i1, i2, i4, i7, i87) -> (i1, index, i19), sym_name = "int_types", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (si2, si4) -> (si7, si1023), sym_name = "sint_types", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (ui2, ui4) -> (ui7, ui1023), sym_name = "uint_types", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (f80, f128) -> (), sym_name = "float_types", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (vector<f32>, vector<1xf32>, vector<2x4xf32>) -> (), sym_name = "vectors", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<*xf32>, tensor<*xvector<2x4xf32>>, tensor<1x?x4x?x?xi32>, tensor<i8>) -> (), sym_name = "tensors", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<16x32xf64, "sparse">) -> (), sym_name = "tensor_encoding", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tensor<9223372036854775807xf32>) -> (), sym_name = "large_shape_dimension", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = ((memref<1x?x4x?x?xi32, #map>, memref<8xi8>) -> (), () -> ()) -> (), sym_name = "functions", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x4x8xi8, 1>) -> (), sym_name = "memrefs2", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x4x8xi8>) -> (), sym_name = "memrefs3", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<2xi8>) -> (), sym_name = "memrefs_drop_triv_id_inline", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<2xi8>) -> (), sym_name = "memrefs_drop_triv_id_inline0", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<2xi8, 1>) -> (), sym_name = "memrefs_drop_triv_id_inline1", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<5x6x7xf32>) -> (), sym_name = "memrefs_nomap_nospace", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<5x6x7xf32, #map1>) -> (), sym_name = "memrefs_map_nospace", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<5x6x7xf32, 3>) -> (), sym_name = "memrefs_nomap_intspace", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<5x6x7xf32, #map1, 5>) -> (), sym_name = "memrefs_map_intspace", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<5x6x7xf32, "local">) -> (), sym_name = "memrefs_nomap_strspace", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<5x6x7xf32, #map1, "private">) -> (), sym_name = "memrefs_map_strspace", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<5x6x7xf32, {memSpace = "special", subIndex = 1 : i64}>) -> (), sym_name = "memrefs_nomap_dictspace", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<5x6x7xf32, #map1, {memSpace = "special", subIndex = 3 : i64}>) -> (), sym_name = "memrefs_map_dictspace", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (complex<i1>) -> complex<f32>, sym_name = "complex_types", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x?xindex>) -> (), sym_name = "memref_with_index_elems", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x?xcomplex<f32>>) -> (), sym_name = "memref_with_complex_elems", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x?xvector<10xf32>>) -> (), sym_name = "memref_with_vector_elems", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x?x!test.memref_element>) -> (), sym_name = "memref_with_custom_elem", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<1xmemref<1xf64>>) -> (), sym_name = "memref_of_memref", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<1xmemref<*xf32>>) -> (), sym_name = "memref_of_unranked_memref", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xmemref<1xf32>>) -> (), sym_name = "unranked_memref_of_memref", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xmemref<*xi32>>) -> (), sym_name = "unranked_memref_of_unranked_memref", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xcomplex<f32>>) -> (), sym_name = "unranked_memref_with_complex_elems", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xindex>) -> (), sym_name = "unranked_memref_with_index_elems", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xvector<10xf32>>) -> (), sym_name = "unranked_memref_with_vector_elems", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (i32, f32) -> i1, sym_name = "simpleCFG"}> ({
  ^bb0(%arg48: i32, %arg49: f32):
    %141 = "foo"() : () -> i64
    %142:3 = "bar"(%141) : (i64) -> (i1, i1, i1)
    "func.return"(%142#1) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i64) -> (), sym_name = "simpleCFGUsingBBArgs"}> ({
  ^bb0(%arg46: i32, %arg47: i64):
    %140:3 = "bar"(%arg47) : (i64) -> (i1, i1, i1)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "block_label_empty_list"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "multiblock"}> ({
    "func.return"() : () -> ()
  ^bb1:  // no predecessors
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb2
    "cf.br"()[^bb2] : () -> ()
  ^bb3:  // pred: ^bb1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emptyMLF"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> i2, sym_name = "func_with_one_arg"}> ({
  ^bb0(%arg45: i1):
    %139 = "foo"(%arg45) : (i1) -> i2
    "func.return"(%139) : (i2) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f16, i8) -> (i1, i32), sym_name = "func_with_two_args"}> ({
  ^bb0(%arg43: f16, %arg44: i8):
    %138:2 = "foo"(%arg43, %arg44) : (f16, i8) -> (i1, i32)
    "func.return"(%138#0, %138#1) : (i1, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (() -> ()), sym_name = "second_order_func"}> ({
    %137 = "func.constant"() <{value = @emptyMLF}> : () -> (() -> ())
    "func.return"(%137) : (() -> ()) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (() -> (() -> ())), sym_name = "third_order_func"}> ({
    %136 = "func.constant"() <{value = @second_order_func}> : () -> (() -> (() -> ()))
    "func.return"(%136) : (() -> (() -> ())) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (() -> ()) -> (() -> ()), sym_name = "identity_functor"}> ({
  ^bb0(%arg42: () -> ()):
    "func.return"(%arg42) : (() -> ()) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "func_ops_in_loop"}> ({
    %134 = "foo"() : () -> i64
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg41: index):
      %135 = "doo"() : () -> f32
      "bar"(%134, %135) : (i64, f32) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "loops"}> ({
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg39: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
      ^bb0(%arg40: index):
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "complex_loops"}> ({
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg35: index):
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
      ^bb0(%arg38: index):
        "foo"(%arg35, %arg38) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "boo"() : () -> ()
      "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
      ^bb0(%arg36: index):
        "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
        ^bb0(%arg37: index):
          "goo"() : () -> ()
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<?x?xi32>) -> (), sym_name = "triang_loop"}> ({
  ^bb0(%arg31: index, %arg32: memref<?x?xi32>):
    %133 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "affine.for"(%arg31) <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map7}> ({
    ^bb0(%arg33: index):
      "affine.for"(%arg33, %arg31) <{lowerBoundMap = #map6, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map7}> ({
      ^bb0(%arg34: index):
        "memref.store"(%133, %arg32, %arg33, %arg34) : (i32, memref<?x?xi32>, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, memref<100xf32>) -> (), sym_name = "minmax_loop"}> ({
  ^bb0(%arg27: index, %arg28: index, %arg29: memref<100xf32>):
    "affine.for"(%arg27, %arg28) <{lowerBoundMap = #map8, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map9}> ({
    ^bb0(%arg30: index):
      "foo"(%arg29, %arg30) : (memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "loop_bounds"}> ({
  ^bb0(%arg22: index):
    %128 = "foo"(%arg22) : (index) -> index
    "affine.for"(%128, %arg22) <{lowerBoundMap = #map7, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = #map7}> ({
    ^bb0(%arg23: index):
      "affine.for"(%arg23) <{lowerBoundMap = #map6, operandSegmentSizes = array<i32: 1, 0, 0>, step = 1 : index, upperBoundMap = #map15}> ({
      ^bb0(%arg24: index):
        %129 = "affine.apply"(%arg23, %arg24, %128) <{map = #map10}> : (index, index, index) -> index
        %130 = "affine.apply"(%arg23, %arg24, %128) <{map = #map11}> : (index, index, index) -> index
        "affine.for"(%129, %arg23, %arg22, %130, %arg24, %128) <{lowerBoundMap = #map14, operandSegmentSizes = array<i32: 3, 3, 0>, step = 1 : index, upperBoundMap = #map14}> ({
        ^bb0(%arg25: index):
          "foo"(%arg23, %arg24, %arg25) : (index, index, index) -> ()
          %131 = "arith.constant"() <{value = 30 : index}> : () -> index
          %132 = "affine.apply"(%arg22, %131) <{map = #map12}> : (index, index) -> index
          "affine.for"(%arg23, %132, %arg25, %131) <{lowerBoundMap = #map13, operandSegmentSizes = array<i32: 2, 2, 0>, step = 1 : index, upperBoundMap = #map13}> ({
          ^bb0(%arg26: index):
            "bar"(%arg26) : (index) -> ()
            "affine.yield"() : () -> ()
          }) : (index, index, index, index) -> ()
          "affine.yield"() : () -> ()
        }) : (index, index, index, index, index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "ifinst"}> ({
  ^bb0(%arg20: index):
    %121 = "arith.constant"() <{value = 200 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg21: index):
      "affine.if"(%arg21, %arg20, %121) <{condition = #set1}> ({
        %125 = "arith.constant"() <{value = 1 : i32}> : () -> i32
        %126 = "add"(%125, %arg21) : (i32, index) -> i32
        %127 = "mul"(%126, %126) : (i32, i32) -> i32
        "affine.yield"() : () -> ()
      }, {
        "affine.if"(%arg21, %arg20) <{condition = #set}> ({
          %123 = "arith.constant"() <{value = 1 : index}> : () -> index
          %124 = "affine.apply"(%arg21, %arg21, %123) <{map = #map14}> : (index, index, index) -> index
          "affine.yield"() : () -> ()
        }, {
          %122 = "arith.constant"() <{value = 3 : i32}> : () -> i32
          "affine.yield"() : () -> ()
        }) : (index, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "simple_ifinst"}> ({
  ^bb0(%arg18: index):
    %117 = "arith.constant"() <{value = 200 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map2, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg19: index):
      "affine.if"(%arg19, %arg18, %117) <{condition = #set1}> ({
        %118 = "arith.constant"() <{value = 1 : i32}> : () -> i32
        %119 = "add"(%118, %arg19) : (i32, index) -> i32
        %120 = "mul"(%119, %119) : (i32, i32) -> i32
        "affine.yield"() : () -> ()
      }, {
      }) : (index, index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "attributes"}> ({
    "foo"() : () -> ()
    "foo"() {a = 1 : i64, b = -423 : i64, c = [true, false], d = 1.600000e+01 : f64} : () -> ()
    "foo"() {map1 = #map6} : () -> ()
    "foo"() {map2 = #map16} : () -> ()
    "foo"() {map12 = [#map6, #map16]} : () -> ()
    "foo"() {set1 = #set2} : () -> ()
    "foo"() {set2 = #set3} : () -> ()
    "foo"() {set12 = [#set2, #set4]} : () -> ()
    "foo"() {dictionary = {bool = true, fn = @ifinst}} : () -> ()
    "foo"() {dictionary = {bar = false, bool = true, fn = @ifinst}} : () -> ()
    "foo"() {d = 1.000000e-09 : f64, func = [], i123 = 7 : i64, if = "foo"} : () -> ()
    "foo"() {fn = @attributes, if = @ifinst} : () -> ()
    "foo"() {int = 0 : i42} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i16, i8), sym_name = "ssa_values"}> ({
    %114:2 = "foo"() : () -> (i1, i17)
    "cf.br"()[^bb2] : () -> ()
  ^bb1:  // pred: ^bb2
    %115:2 = "baz"(%116#1, %116#0, %114#1) : (f32, i11, i17) -> (i16, i8)
    "func.return"(%115#0, %115#1) : (i16, i8) -> ()
  ^bb2:  // pred: ^bb0
    %116:2 = "bar"(%114#0, %114#1) : (i1, i17) -> (i11, f32)
    "cf.br"()[^bb1] : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i16, i8), sym_name = "bbargs"}> ({
    %110:2 = "foo"() : () -> (i1, i17)
    "cf.br"(%110#1, %110#0)[^bb1] : (i17, i1) -> ()
  ^bb1(%111: i17, %112: i1):  // pred: ^bb0
    %113:2 = "baz"(%111, %112, %110#1) : (i17, i1, i17) -> (i16, i8)
    "func.return"(%113#0, %113#1) : (i16, i8) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i1, i17), sym_name = "verbose_terminators"}> ({
    %103:2 = "foo"() : () -> (i1, i17)
    "cf.br"(%103#0, %103#1)[^bb1] : (i1, i17) -> ()
  ^bb1(%104: i1, %105: i17):  // pred: ^bb0
    "cf.cond_br"(%104, %105, %104, %105)[^bb2, ^bb3] <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (i1, i17, i1, i17) -> ()
  ^bb2(%106: i17):  // pred: ^bb1
    %107 = "arith.constant"() <{value = true}> : () -> i1
    "func.return"(%107, %106) : (i1, i17) -> ()
  ^bb3(%108: i1, %109: i17):  // pred: ^bb1
    "func.return"(%108, %109) : (i1, i17) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "condbr_simple"}> ({
    %97 = "foo"() : () -> i1
    %98 = "bar"() : () -> i32
    %99 = "bar"() : () -> i64
    "cf.cond_br"(%97, %98, %99)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 1, 1>}> : (i1, i32, i64) -> ()
  ^bb1(%100: i32):  // pred: ^bb0
    "cf.br"(%99)[^bb2] : (i64) -> ()
  ^bb2(%101: i64):  // 2 preds: ^bb0, ^bb1
    %102 = "foo"() : () -> i32
    "func.return"(%102) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "condbr_moarargs"}> ({
    %88 = "foo"() : () -> i1
    %89 = "bar"() : () -> i32
    %90 = "bar"() : () -> i64
    "cf.cond_br"(%88, %89, %90, %90, %89, %89)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 2, 3>}> : (i1, i32, i64, i64, i32, i32) -> ()
  ^bb1(%91: i32, %92: i64):  // pred: ^bb0
    "func.return"(%91) : (i32) -> ()
  ^bb2(%93: i64, %94: i32, %95: i32):  // pred: ^bb0
    %96 = "foo"() : () -> i32
    "func.return"(%96) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i32, i23, i23, i1, i1), sym_name = "constants"}> ({
    %82 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %83 = "arith.constant"() <{value = 17 : i23}> : () -> i23
    %84 = "arith.constant"() <{value = 17 : i23}> : () -> i23
    %85 = "arith.constant"() <{value = true}> : () -> i1
    %86 = "arith.constant"() <{value = false}> : () -> i1
    %87 = "arith.constant"() <{value = 3890 : i32}> : () -> i32
    "func.return"(%82, %83, %84, %85, %86) : (i32, i23, i23, i1, i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "typeattr"}> ({
    "foo"() {bar = tensor<*xf32>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "stringquote"}> ({
    "foo"() {bar = "a\22quoted\22string"} : () -> ()
    "foo"() {bar = "typed_string" : !foo.string} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "unitAttrs"}> ({
    "foo"() {unitAttr} : () -> ()
    "foo"() {unitAttr} : () -> ()
    "foo"() {nested = {unitAttr}} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "floatAttrs"}> ({
    "foo"() {a = 4.000000e+00 : f64, b = 2.000000e+00 : f64, c = 7.100000e+00 : f64, d = -0.000000e+00 : f64} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "externalfuncattr", sym_visibility = "private"}> ({
  }) {dialect.a = "a\22quoted\22string", dialect.b = 4.000000e+00 : f64, dialect.c = tensor<*xf32>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "funcattrempty", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "funcattr", sym_visibility = "private"}> ({
    "func.return"() : () -> ()
  }) {dialect.a = "a\22quoted\22string", dialect.b = 4.000000e+00 : f64, dialect.c = tensor<*xf32>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "funcattrwithblock"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "funcsimplemap"}> ({
  ^bb0(%arg10: index, %arg11: index):
    "affine.for"() <{lowerBoundMap = #map15, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg12: index):
      "affine.for"(%arg11) <{lowerBoundMap = #map15, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map7}> ({
      ^bb0(%arg13: index):
        "affine.for"(%arg12) <{lowerBoundMap = #map15, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map6}> ({
        ^bb0(%arg14: index):
          "affine.for"(%arg12, %arg11) <{lowerBoundMap = #map15, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map19}> ({
          ^bb0(%arg15: index):
            "affine.for"(%arg11, %arg10) <{lowerBoundMap = #map15, operandSegmentSizes = array<i32: 0, 2, 0>, step = 1 : index, upperBoundMap = #map18}> ({
            ^bb0(%arg16: index):
              "affine.for"(%arg10) <{lowerBoundMap = #map15, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map17}> ({
              ^bb0(%arg17: index):
                %81 = "arith.constant"() <{value = 42 : i32}> : () -> i32
                "affine.yield"() : () -> ()
              }) : (index) -> ()
              "affine.yield"() : () -> ()
            }) : (index, index) -> ()
            "affine.yield"() : () -> ()
          }) : (index, index) -> ()
          "affine.yield"() : () -> ()
        }) : (index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "splattensorattr"}> ({
    "splatBoolTensor"() {bar = dense<false> : tensor<i1>} : () -> ()
    "splatUIntTensor"() {bar = dense<222> : tensor<2x1x4xui8>} : () -> ()
    "splatIntTensor"() {bar = dense<5> : tensor<2x1x4xi32>} : () -> ()
    "splatFloatTensor"() {bar = dense<-5.000000e+00> : tensor<2x1x4xf32>} : () -> ()
    "splatIntVector"() {bar = dense<5> : vector<2x1x4xi64>} : () -> ()
    "splatFloatVector"() {bar = dense<-5.000000e+00> : vector<2x1x4xf16>} : () -> ()
    "splatIntScalar"() {bar = dense<5> : tensor<i9>} : () -> ()
    "splatFloatScalar"() {bar = dense<-5.000000e+00> : tensor<f16>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "densetensorattr"}> ({
    "fooi3"() {bar = dense<[[[1, -2, 1, 2]], [[0, 2, -1, 2]]]> : tensor<2x1x4xi3>} : () -> ()
    "fooi6"() {bar = dense<[[[5, -6, 1, 2]], [[7, 8, 3, 4]]]> : tensor<2x1x4xi6>} : () -> ()
    "fooi8"() {bar = dense<5> : tensor<1x1x1xi8>} : () -> ()
    "fooi13"() {bar = dense<[[[1, -2, 1, 2]], [[0, 2, -1, 2]]]> : tensor<2x1x4xi13>} : () -> ()
    "fooi16"() {bar = dense<-5> : tensor<1x1x1xi16>} : () -> ()
    "fooi23"() {bar = dense<[[[1, -2, 1, 2]], [[0, 2, -1, 2]]]> : tensor<2x1x4xi23>} : () -> ()
    "fooi32"() {bar = dense<5> : tensor<1x1x1xi32>} : () -> ()
    "fooi33"() {bar = dense<[[[1, -2, 1, 2]], [[0, 2, -1, 2]]]> : tensor<2x1x4xi33>} : () -> ()
    "fooi43"() {bar = dense<[[[1, -2, 1, 2]], [[0, 2, -1, 2]]]> : tensor<2x1x4xi43>} : () -> ()
    "fooi53"() {bar = dense<[[[1, -2, 1, 2]], [[0, 2, -1, 2]]]> : tensor<2x1x4xi53>} : () -> ()
    "fooi64"() {bar = dense<[[[1, -2, 1, 2]], [[0, 3, -1, 2]]]> : tensor<2x1x4xi64>} : () -> ()
    "fooi64"() {bar = dense<-5> : tensor<1x1x1xi64>} : () -> ()
    "fooi67"() {bar = dense<[[[-5, 4, 6, 2]]]> : vector<1x1x4xi67>} : () -> ()
    "foo2"() {bar = dense<> : tensor<0xi32>} : () -> ()
    "foo2"() {bar = dense<> : tensor<1x0xi32>} : () -> ()
    "foo2"() {bar = dense<> : tensor<0x512x512xi32>} : () -> ()
    "foo3"() {bar = dense<[[[5, -6, 1, 2]], [[7, 8, 3, 4]]]> : tensor<2x1x4xi32>} : () -> ()
    "float1"() {bar = dense<5.000000e+00> : tensor<1x1x1xf32>} : () -> ()
    "float2"() {bar = dense<> : tensor<0xf32>} : () -> ()
    "float2"() {bar = dense<> : tensor<1x0xf32>} : () -> ()
    "bfloat16"() {bar = dense<[[[-5.000000e+00, 6.000000e+00, 1.000000e+00, 2.000000e+00]], [[7.000000e+00, -8.000000e+00, 3.000000e+00, 4.000000e+00]]]> : tensor<2x1x4xbf16>} : () -> ()
    "float16"() {bar = dense<[[[-5.000000e+00, 6.000000e+00, 1.000000e+00, 2.000000e+00]], [[7.000000e+00, -8.000000e+00, 3.000000e+00, 4.000000e+00]]]> : tensor<2x1x4xf16>} : () -> ()
    "float32"() {bar = dense<[[[-5.000000e+00, 6.000000e+00, 1.000000e+00, 2.000000e+00]], [[7.000000e+00, -8.000000e+00, 3.000000e+00, 4.000000e+00]]]> : tensor<2x1x4xf32>} : () -> ()
    "float64"() {bar = dense<[[[-5.000000e+00, 6.000000e+00, 1.000000e+00, 2.000000e+00]], [[7.000000e+00, -8.000000e+00, 3.000000e+00, 4.000000e+00]]]> : tensor<2x1x4xf64>} : () -> ()
    "intscalar"() {bar = dense<1> : tensor<i32>} : () -> ()
    "floatscalar"() {bar = dense<5.000000e+00> : tensor<f32>} : () -> ()
    "index"() {bar = dense<1> : tensor<index>} : () -> ()
    "index"() {bar = dense<[1, 2]> : tensor<2xindex>} : () -> ()
    "complex_attr"() {bar = dense<(1,1)> : tensor<complex<i64>>} : () -> ()
    "complex_attr"() {bar = dense<[(1,1), (2,2)]> : tensor<2xcomplex<i64>>} : () -> ()
    "complex_attr"() {bar = dense<(1.000000e+00,0.000000e+00)> : tensor<complex<f32>>} : () -> ()
    "complex_attr"() {bar = dense<[(1.000000e+00,0.000000e+00), (2.000000e+00,2.000000e+00)]> : tensor<2xcomplex<f32>>} : () -> ()
    "complex_attr"() {bar = dense<> : tensor<0xcomplex<i64>>} : () -> ()
    "complex_attr"() {bar = dense<> : tensor<2x0xcomplex<i64>>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "densevectorattr"}> ({
    "fooi8"() {bar = dense<5> : vector<1x1x1xi8>} : () -> ()
    "fooi16"() {bar = dense<-5> : vector<1x1x1xi16>} : () -> ()
    "foo32"() {bar = dense<5> : vector<1x1x1xi32>} : () -> ()
    "fooi64"() {bar = dense<-5> : vector<1x1x1xi64>} : () -> ()
    "foo3"() {bar = dense<[[[5, -6, 1, 2]], [[7, 8, 3, 4]]]> : vector<2x1x4xi32>} : () -> ()
    "float1"() {bar = dense<5.000000e+00> : vector<1x1x1xf32>} : () -> ()
    "bfloat16"() {bar = dense<[[[-5.000000e+00, 6.000000e+00, 1.000000e+00, 2.000000e+00]], [[7.000000e+00, -8.000000e+00, 3.000000e+00, 4.000000e+00]]]> : vector<2x1x4xbf16>} : () -> ()
    "float16"() {bar = dense<[[[-5.000000e+00, 6.000000e+00, 1.000000e+00, 2.000000e+00]], [[7.000000e+00, -8.000000e+00, 3.000000e+00, 4.000000e+00]]]> : vector<2x1x4xf16>} : () -> ()
    "float32"() {bar = dense<[[[-5.000000e+00, 6.000000e+00, 1.000000e+00, 2.000000e+00]], [[7.000000e+00, -8.000000e+00, 3.000000e+00, 4.000000e+00]]]> : vector<2x1x4xf32>} : () -> ()
    "float64"() {bar = dense<[[[-5.000000e+00, 6.000000e+00, 1.000000e+00, 2.000000e+00]], [[7.000000e+00, -8.000000e+00, 3.000000e+00, 4.000000e+00]]]> : vector<2x1x4xf64>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "sparsetensorattr"}> ({
    "fooi8"() {bar = sparse<0, -2> : tensor<1x1x1xi8>} : () -> ()
    "fooi16"() {bar = sparse<[[1, 1, 0], [0, 1, 0], [0, 0, 1]], [2, -1, 5]> : tensor<2x2x2xi16>} : () -> ()
    "fooi32"() {bar = sparse<> : tensor<1x1xi32>} : () -> ()
    "fooi64"() {bar = sparse<0, -1> : tensor<1xi64>} : () -> ()
    "foo2"() {bar = sparse<> : tensor<0xi32>} : () -> ()
    "foo3"() {bar = sparse<> : tensor<i32>} : () -> ()
    "foof16"() {bar = sparse<0, -2.000000e+00> : tensor<1x1x1xf16>} : () -> ()
    "foobf16"() {bar = sparse<[[1, 1, 0], [0, 1, 0], [0, 0, 1]], [2.000000e+00, -1.000000e+00, 5.000000e+00]> : tensor<2x2x2xbf16>} : () -> ()
    "foof32"() {bar = sparse<> : tensor<1x0x1xf32>} : () -> ()
    "foof64"() {bar = sparse<0, -1.000000e+00> : tensor<1xf64>} : () -> ()
    "foof320"() {bar = sparse<> : tensor<0xf32>} : () -> ()
    "foof321"() {bar = sparse<> : tensor<f32>} : () -> ()
    "foostr"() {bar = sparse<0, "foo"> : tensor<1x1x1x!unknown<>>} : () -> ()
    "foostr"() {bar = sparse<[[1, 1, 0], [0, 1, 0], [0, 0, 1]], ["a", "b", "c"]> : tensor<2x2x2x!unknown<>>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "sparsevectorattr"}> ({
    "fooi8"() {bar = sparse<0, -2> : vector<1x1x1xi8>} : () -> ()
    "fooi16"() {bar = sparse<[[1, 1, 0], [0, 1, 0], [0, 0, 1]], [2, -1, 5]> : vector<2x2x2xi16>} : () -> ()
    "fooi32"() {bar = sparse<> : vector<1x1xi32>} : () -> ()
    "fooi64"() {bar = sparse<0, -1> : vector<1xi64>} : () -> ()
    "foof16"() {bar = sparse<0, -2.000000e+00> : vector<1x1x1xf16>} : () -> ()
    "foobf16"() {bar = sparse<[[1, 1, 0], [0, 1, 0], [0, 0, 1]], [2.000000e+00, -1.000000e+00, 5.000000e+00]> : vector<2x2x2xbf16>} : () -> ()
    "foof64"() {bar = sparse<0, -1.000000e+00> : vector<1xf64>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> !bar<>, sym_name = "unknown_dialect_type"}> ({
    %79 = "foo"() : () -> !bar<>
    %80 = "foo"() : () -> !bar.baz
    "func.return"(%79) : (!bar<>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "type_alias"}> ({
    %78 = "foo"() : () -> i32
    "func.return"(%78) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "no_integer_set_constraints"}> ({
    "affine.if"() <{condition = #set5}> ({
      "affine.yield"() : () -> ()
    }, {
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "verbose_if"}> ({
  ^bb0(%arg9: index):
    %75 = "arith.constant"() <{value = 200 : index}> : () -> index
    "affine.if"(%75, %arg9, %75) <{condition = #set1}> ({
      %77 = "add"(%75, %arg9) : (index, index) -> index
      "affine.yield"() : () -> ()
    }, {
      %76 = "add"(%75, %75) : (index, index) -> index
      "affine.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "terminator_with_regions"}> ({
    "region"()[^bb1] ({
    }) : () -> ()
  ^bb1:  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> i1, sym_name = "unregistered_term"}> ({
  ^bb0(%arg8: i1):
    "unregistered_br"(%arg8)[^bb1] : (i1) -> ()
  ^bb1(%74: i1):  // pred: ^bb0
    "func.return"(%74) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "dialect_attrs"}> ({
    "func.return"() : () -> ()
  }) {dialect.attr = 10 : i64} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "_valid.function$name", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{arg_attrs = [{}, {dialect.attr = 10 : i64}, {}], function_type = (i32, i1, i32) -> (), sym_name = "external_func_arg_attrs", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{arg_attrs = [{dialect.attr = 10 : i64}], function_type = (i1) -> (), sym_name = "func_arg_attrs"}> ({
  ^bb0(%arg7: i1):
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, res_attrs = [{dialect.attr = 1 : i64}], sym_name = "func_result_attrs"}> ({
  ^bb0(%arg6: f32):
    "func.return"(%arg6) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tuple<>) -> (), sym_name = "empty_tuple", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tuple<i32>) -> (), sym_name = "tuple_single_element", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tuple<i32, i16, f32>) -> (), sym_name = "tuple_multi_element", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (tuple<tuple<tuple<i32>>>) -> (), sym_name = "tuple_nested", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (i16, i16), sym_name = "pretty_form_multi_result"}> ({
    %73:2 = "foo_div"() : () -> (i16, i16)
    "func.return"(%73#0, %73#1) : (i16, i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (i16, i16, i16, i16, i16), sym_name = "pretty_form_multi_result_groups"}> ({
    %72:5 = "foo_test"() : () -> (i16, i16, i16, i16, i16)
    "func.return"(%72#0, %72#1, %72#2, %72#3, %72#4) : (i16, i16, i16, i16, i16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "pretty_dialect_attribute"}> ({
    "foo.unknown_op"() {foo = #foo.simple_attr} : () -> ()
    "foo.unknown_op"() {foo = #foo.complexattr<abcd>} : () -> ()
    "foo.unknown_op"() {foo = #foo.complexattr<abcd<f32>>} : () -> ()
    "foo.unknown_op"() {foo = #foo.complexattr<abcd<[f]$$[32]>>} : () -> ()
    "foo.unknown_op"() {foo = #foo.dialect<!x@#!@#>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "pretty_dialect_type"}> ({
    %67 = "foo.unknown_op"() : () -> !foo.simpletype
    %68 = "foo.unknown_op"() : () -> !foo.complextype<abcd>
    %69 = "foo.unknown_op"() : () -> !foo.complextype<abcd<f32>>
    %70 = "foo.unknown_op"() : () -> !foo.complextype<abcd<[f]$$[32]>>
    %71 = "foo.unknown_op"() : () -> !foo.dialect<!x@#!@#>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "none_type"}> ({
    %66 = "foo.unknown_op"() : () -> none
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "scoped_names"}> ({
    "foo.region_op"() ({
      %65 = "foo.unknown_op"() : () -> none
      "foo.terminator"() : () -> ()
    }, {
      %64 = "foo.unknown_op"() : () -> none
      "foo.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "dialect_attribute_with_type"}> ({
    "foo.unknown_op"() {foo = #foo.attr : i32} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "f16_special_values"}> ({
    %59 = "arith.constant"() <{value = 0x7C01 : f16}> : () -> f16
    %60 = "arith.constant"() <{value = 0x7FFF : f16}> : () -> f16
    %61 = "arith.constant"() <{value = 0xFFFF : f16}> : () -> f16
    %62 = "arith.constant"() <{value = 0x7C00 : f16}> : () -> f16
    %63 = "arith.constant"() <{value = 0xFC00 : f16}> : () -> f16
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "f32_special_values"}> ({
    %53 = "arith.constant"() <{value = 0x7F800001 : f32}> : () -> f32
    %54 = "arith.constant"() <{value = 0x7FBFFFFF : f32}> : () -> f32
    %55 = "arith.constant"() <{value = 0x7FC00000 : f32}> : () -> f32
    %56 = "arith.constant"() <{value = 0xFFFFFFFF : f32}> : () -> f32
    %57 = "arith.constant"() <{value = 0x7F800000 : f32}> : () -> f32
    %58 = "arith.constant"() <{value = 0xFF800000 : f32}> : () -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "f64_special_values"}> ({
    %46 = "arith.constant"() <{value = 0x7FF0000000000001 : f64}> : () -> f64
    %47 = "arith.constant"() <{value = 0x7FF8000000000000 : f64}> : () -> f64
    %48 = "arith.constant"() <{value = 0x7FF0000001000000 : f64}> : () -> f64
    %49 = "arith.constant"() <{value = 0xFFF0000001000000 : f64}> : () -> f64
    %50 = "arith.constant"() <{value = 0x7FF0000000000000 : f64}> : () -> f64
    %51 = "arith.constant"() <{value = 0xFFF0000000000000 : f64}> : () -> f64
    %52 = "arith.constant"() <{value = 0xC1CDC00000000000 : f64}> : () -> f64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "bfloat16_special_values"}> ({
    %40 = "arith.constant"() <{value = 0x7F81 : bf16}> : () -> bf16
    %41 = "arith.constant"() <{value = 0xFF81 : bf16}> : () -> bf16
    %42 = "arith.constant"() <{value = 0x7FC0 : bf16}> : () -> bf16
    %43 = "arith.constant"() <{value = 0xFFC0 : bf16}> : () -> bf16
    %44 = "arith.constant"() <{value = 0x7F80 : bf16}> : () -> bf16
    %45 = "arith.constant"() <{value = 0xFF80 : bf16}> : () -> bf16
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "f80_special_values"}> ({
    %34 = "arith.constant"() <{value = 0x7FFFE000000000000001 : f80}> : () -> f80
    %35 = "arith.constant"() <{value = 0x7FFFB000000000000011 : f80}> : () -> f80
    %36 = "arith.constant"() <{value = 0x7FFFC000000000100000 : f80}> : () -> f80
    %37 = "arith.constant"() <{value = 0x7FFFE000000001000000 : f80}> : () -> f80
    %38 = "arith.constant"() <{value = 0x7FFF8000000000000000 : f80}> : () -> f80
    %39 = "arith.constant"() <{value = 0xFFFF8000000000000000 : f80}> : () -> f80
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "f32_potential_precision_loss"}> ({
    %33 = "arith.constant"() <{value = -1.23697901 : f32}> : () -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "special_float_values_in_tensors"}> ({
    "foo"() {bar = dense<0xFFFFFFFF> : tensor<4x4xf32>} : () -> ()
    "foo"() {bar = dense<[[0xFFFFFFFF, 0x7F800000], [0x7FBFFFFF, 0x7F800001]]> : tensor<2x2xf32>} : () -> ()
    "foo"() {bar = dense<[0xFFFFFFFF, 0.000000e+00]> : tensor<2xf32>} : () -> ()
    "foo"() {bar = sparse<[[1, 1, 0], [0, 1, 1]], [0xFFFFFFFF, 0x7F800001]> : tensor<2x2x2xf32>} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "op_with_region_args"}> ({
    "test.polyfor"() ({
    ^bb0(%arg3: index, %arg4: index, %arg5: index):
      "foo"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "custom_name_api"}> ({
    "test.parse_custom_operation_name_api"() <{name = "builtin.module"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "op_with_passthrough_region_args"}> ({
    %31 = "arith.constant"() <{value = 10 : index}> : () -> index
    "test.isolated_region"(%31) ({
    ^bb0(%arg2: index):
      "foo.consumer"(%arg2) : (index) -> ()
    }) : (index) -> ()
    %32:2 = "foo.op"() : () -> (index, index)
    "test.isolated_region"(%32#1) ({
    ^bb0(%arg1: index):
      "foo.consumer"(%arg1) : (index) -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> !unreg.ptr<() -> ()>, sym_name = "ptr_to_function", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{arg_attrs = [{foo.value = "\0A"}], function_type = (i1) -> (), sym_name = "escaped_string_char", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "parse_integer_literal_test"}> ({
    %30:5 = "test.parse_integer_literal"() : () -> (index, index, index, index, index)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "parse_wrapped_keyword_test"}> ({
    "test.parse_wrapped_keyword"() <{keyword = "foo.keyword"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "parse_base64_test"}> ({
    "test.parse_b64"() <{b64 = "hello world"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "parse_slash_test"}> ({
    "test.slash_attr"() <{attr = #test.slash_attr<1 / 2>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "\22_string_symbol_reference\22"}> ({
    "foo.symbol_reference"() {ref = @"\22_string_symbol_reference\22"} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "parse_opaque_attr_escape", sym_visibility = "private"}> ({
    "foo.constant"() {value = #foo<"\"escaped\\\n\"">} : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "string_attr_name", sym_visibility = "private"}> ({
  }) {"0 . 0", nested = {"0 . 0"}} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "nested_reference", sym_visibility = "private"}> ({
  }) {test.ref = @some_symbol::@some_nested_symbol} : () -> ()
  "func.func"() <{function_type = () -> (i32, i32, i32, i32, i32, i32), sym_name = "custom_asm_names"}> ({
    %28:4 = "test.asm_interface_op"() : () -> (i32, i32, i32, i32)
    %29:2 = "test.asm_interface_op"() : () -> (i32, i32)
    "func.return"(%28#0, %28#1, %28#2, %28#3, %29#0, %29#1) : (i32, i32, i32, i32, i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "pretty_names"}> ({
    %22 = "test.string_attr_pretty_name"() <{names = ["x"]}> : () -> i32
    %23 = "test.string_attr_pretty_name"() <{names = ["y"]}> : () -> i32
    %24 = "test.string_attr_pretty_name"() <{names = ["y"]}> : () -> i32
    %25 = "test.string_attr_pretty_name"() <{names = ["space name"]}> : () -> i32
    "unknown.use"(%22, %23, %24, %25) : (i32, i32, i32, i32) -> ()
    %26:3 = "test.string_attr_pretty_name"() <{names = ["a", "b", "c"]}> : () -> (i32, i32, i32)
    %27:4 = "test.string_attr_pretty_name"() <{names = ["q", "q", "q", "r"]}> : () -> (i32, i32, i32, i32)
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "default_dialect"}> ({
  ^bb0(%arg0: i1):
    "test.default_dialect"() ({
      %20:5 = "test.parse_integer_literal"() : () -> (index, index, index, index, index)
      %21:6 = "test.parse_integer_literal"() : () -> (index, index, index, index, index, index)
      "test.op_with_attr"() {test.attr = "test.value"} : () -> ()
      "test.op.with_dot_in_name"() : () -> ()
      "test.dialect_custom_printer.with.dot"() : () -> ()
      "test.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i1, sym_name = "unreachable_dominance_violation_ok"}> ({
    %17 = "arith.constant"() <{value = false}> : () -> i1
    "func.return"(%17) : (i1) -> ()
  ^bb1:  // no predecessors
    %18:3 = "bar"(%19) : (i64) -> (i1, i1, i1)
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb2
    "cf.br"()[^bb2] : () -> ()
  ^bb3:  // pred: ^bb1
    %19 = "foo"() : () -> i64
    "func.return"(%18#1) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i64, sym_name = "graph_region_in_hierarchy_ok"}> ({
    "cf.br"()[^bb2] : () -> ()
  ^bb1:  // pred: ^bb2
    "test.graph_region"() ({
      %16:3 = "bar"(%15) : (i64) -> (i1, i1, i1)
    }) : () -> ()
    "cf.br"()[^bb3] : () -> ()
  ^bb2:  // pred: ^bb0
    %15 = "foo"() : () -> i64
    "cf.br"()[^bb1] : () -> ()
  ^bb3:  // pred: ^bb1
    "func.return"(%15) : (i64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "graph_region_kind"}> ({
    "test.graph_region"() ({
      %13:3 = "bar"(%14) : (i64) -> (i1, i1, i1)
      %14 = "baz"(%13#0) : (i1) -> i64
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "graph_region_inside_ssacfg_region"}> ({
    "test.ssacfg_region"() ({
      %10 = "baz"() : () -> i64
      "test.graph_region"() ({
        %12:3 = "bar"(%10) : (i64) -> (i1, i1, i1)
      }) : () -> ()
      %11 = "baz"() : () -> i64
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "graph_region_in_graph_region_ok"}> ({
    "test.graph_region"() ({
      "test.graph_region"() ({
        %9:3 = "bar"(%8) : (i64) -> (i1, i1, i1)
      }) : () -> ()
      %8 = "foo"() : () -> i64
      "test.terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "test.graph_region"() ({
    %3 = "op1"(%5) : (i32) -> i32
    %4 = "test.ssacfg_region"(%3, %4, %5, %6) ({
      %7 = "op2"(%3, %4, %5, %6) : (i32, i32, i32, i32) -> i32
    }) : (i32, i32, i32, i32) -> i32
    %5 = "op2"(%3, %6) : (i32, i32) -> i32
    %6 = "op3"(%3) : (i32) -> i32
  }) : () -> ()
  "unregistered_func_might_have_graph_region"() ({
    %1 = "foo"(%1, %2) : (i64, i64) -> i64
    %2 = "bar"(%1) : (i64) -> i64
    "unregistered_terminator"() : () -> ()
  }) {function_type = () -> i1, sym_name = "unregistered_op_dominance_violation_ok"} : () -> ()
  "test.dialect_custom_printer"() : () -> ()
  "test.dialect_custom_format_fallback"() : () -> ()
  %0 = "test.format_optional_result_d_op"() : () -> f80
}) : () -> ()

