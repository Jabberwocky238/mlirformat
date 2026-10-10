#map = affine_map<(d0, d1, d2, d3, d4)[s0] -> (d0, d1, d2, d4, d3)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<()[s0] -> (0, s0 - 1)>
#map4 = affine_map<()[s0] -> (100, s0 + 1)>
#map5 = affine_map<(d0, d1)[s0] -> (d0 + d1)>
#map6 = affine_map<(d0, d1)[s0] -> (s0 + 1)>
#map7 = affine_map<(d0, d1)[s0] -> (d0 + d1 + s0)>
#map8 = affine_map<(d0, d1) -> (d0 + d1)>
#map9 = affine_map<(d0)[s0] -> (d0 + s0, d0 - s0)>
#map10 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map11 = affine_map<(d0)[s0] -> (d0 + s0)>
#map12 = affine_map<()[s0, s1] -> (s0 + s1)>
#map13 = affine_map<()[s0] -> (s0 + 3)>
#set = affine_set<(d0)[s0, s1] : (d0 >= 0, -d0 + s0 >= 0, s0 - 5 == 0, -d0 + s1 + 1 >= 0)>
#set1 = affine_set<(d0)[s0] : (d0 - 2 >= 0, -d0 + 4 >= 0)>
#set2 = affine_set<(d0, d1)[s0] : (d0 >= 0, d1 >= 0)>
#set3 = affine_set<(d0, d1, d2) : (d0 >= 0, d1 >= 0, d2 - d1 == 0)>
#set4 = affine_set<(d0) : (d0 - 1 == 0)>
#set5 = affine_set<() : (0 == 0)>
module {
  func.func private @foo(i32, i64) -> f32
  func.func private @bar()
  func.func private @baz() -> (i1, index, f32)
  func.func private @missingReturn()
  func.func private @int_types(i0, i1, i2, i4, i7, i87) -> (i1, index, i19)
  func.func private @sint_types(si2, si4) -> (si7, si1023)
  func.func private @uint_types(ui2, ui4) -> (ui7, ui1023)
  func.func private @float_types(f80, f128)
  func.func private @vectors(vector<f32>, vector<1xf32>, vector<2x4xf32>)
  func.func private @tensors(tensor<*xf32>, tensor<*xvector<2x4xf32>>, tensor<1x?x4x?x?xi32>, tensor<i8>)
  func.func private @tensor_encoding(tensor<16x32xf64, "sparse">)
  func.func private @large_shape_dimension(tensor<9223372036854775807xf32>)
  func.func private @functions((memref<1x?x4x?x?xi32, #map>, memref<8xi8>) -> (), () -> ())
  func.func private @memrefs2(memref<2x4x8xi8, 1>)
  func.func private @memrefs3(memref<2x4x8xi8>)
  func.func private @memrefs_drop_triv_id_inline(memref<2xi8>)
  func.func private @memrefs_drop_triv_id_inline0(memref<2xi8>)
  func.func private @memrefs_drop_triv_id_inline1(memref<2xi8, 1>)
  func.func private @memrefs_nomap_nospace(memref<5x6x7xf32>)
  func.func private @memrefs_map_nospace(memref<5x6x7xf32, #map1>)
  func.func private @memrefs_nomap_intspace(memref<5x6x7xf32, 3>)
  func.func private @memrefs_map_intspace(memref<5x6x7xf32, #map1, 5>)
  func.func private @memrefs_nomap_strspace(memref<5x6x7xf32, "local">)
  func.func private @memrefs_map_strspace(memref<5x6x7xf32, #map1, "private">)
  func.func private @memrefs_nomap_dictspace(memref<5x6x7xf32, {memSpace = "special", subIndex = 1 : i64}>)
  func.func private @memrefs_map_dictspace(memref<5x6x7xf32, #map1, {memSpace = "special", subIndex = 3 : i64}>)
  func.func private @complex_types(complex<i1>) -> complex<f32>
  func.func private @memref_with_index_elems(memref<1x?xindex>)
  func.func private @memref_with_complex_elems(memref<1x?xcomplex<f32>>)
  func.func private @memref_with_vector_elems(memref<1x?xvector<10xf32>>)
  func.func private @memref_with_custom_elem(memref<1x?x!test.memref_element>)
  func.func private @memref_of_memref(memref<1xmemref<1xf64>>)
  func.func private @memref_of_unranked_memref(memref<1xmemref<*xf32>>)
  func.func private @unranked_memref_of_memref(memref<*xmemref<1xf32>>)
  func.func private @unranked_memref_of_unranked_memref(memref<*xmemref<*xi32>>)
  func.func private @unranked_memref_with_complex_elems(memref<*xcomplex<f32>>)
  func.func private @unranked_memref_with_index_elems(memref<*xindex>)
  func.func private @unranked_memref_with_vector_elems(memref<*xvector<10xf32>>)
  func.func @simpleCFG(%arg0: i32, %arg1: f32) -> i1 {
    %1 = "foo"() : () -> i64
    %2:3 = "bar"(%1) : (i64) -> (i1, i1, i1)
    return %2#1 : i1
  }
  func.func @simpleCFGUsingBBArgs(%arg0: i32, %arg1: i64) {
    %1:3 = "bar"(%arg1) : (i64) -> (i1, i1, i1)
    return
  }
  func.func @block_label_empty_list() {
    return
  }
  func.func @multiblock() {
    return
  ^bb1:  // no predecessors
    cf.br ^bb3
  ^bb2:  // pred: ^bb2
    cf.br ^bb2
  ^bb3:  // pred: ^bb1
    return
  }
  func.func @emptyMLF() {
    return
  }
  func.func @func_with_one_arg(%arg0: i1) -> i2 {
    %1 = "foo"(%arg0) : (i1) -> i2
    return %1 : i2
  }
  func.func @func_with_two_args(%arg0: f16, %arg1: i8) -> (i1, i32) {
    %1:2 = "foo"(%arg0, %arg1) : (f16, i8) -> (i1, i32)
    return %1#0, %1#1 : i1, i32
  }
  func.func @second_order_func() -> (() -> ()) {
    %f = constant @emptyMLF : () -> ()
    return %f : () -> ()
  }
  func.func @third_order_func() -> (() -> (() -> ())) {
    %f = constant @second_order_func : () -> (() -> ())
    return %f : () -> (() -> ())
  }
  func.func @identity_functor(%arg0: () -> ()) -> (() -> ()) {
    return %arg0 : () -> ()
  }
  func.func @func_ops_in_loop() {
    %1 = "foo"() : () -> i64
    affine.for %arg0 = 1 to 10 {
      %2 = "doo"() : () -> f32
      "bar"(%1, %2) : (i64, f32) -> ()
    }
    return
  }
  func.func @loops() {
    affine.for %arg0 = 1 to 100 step 2 {
      affine.for %arg1 = 1 to 200 {
      }
    }
    return
  }
  func.func @complex_loops() {
    affine.for %arg0 = 1 to 100 {
      affine.for %arg1 = 1 to 100 {
        "foo"(%arg0, %arg1) : (index, index) -> ()
      }
      "boo"() : () -> ()
      affine.for %arg1 = 1 to 10 {
        affine.for %arg2 = 1 to 10 {
          "goo"() : () -> ()
        }
      }
    }
    return
  }
  func.func @triang_loop(%arg0: index, %arg1: memref<?x?xi32>) {
    %c0_i32 = arith.constant 0 : i32
    affine.for %arg2 = 1 to %arg0 {
      affine.for %arg3 = #map2(%arg2) to %arg0 {
        memref.store %c0_i32, %arg1[%arg2, %arg3] : memref<?x?xi32>
      }
    }
    return
  }
  func.func @minmax_loop(%arg0: index, %arg1: index, %arg2: memref<100xf32>) {
    affine.for %arg3 = max #map3()[%arg0] to min #map4()[%arg1] {
      "foo"(%arg2, %arg3) : (memref<100xf32>, index) -> ()
    }
    return
  }
  func.func @loop_bounds(%arg0: index) {
    %1 = "foo"(%arg0) : (index) -> index
    affine.for %arg1 = %1 to %arg0 {
      affine.for %arg2 = #map2(%arg1) to 0 {
        %2 = affine.apply #map5(%arg1, %arg2)[%1]
        %3 = affine.apply #map6(%arg1, %arg2)[%1]
        affine.for %arg3 = #map7(%2, %arg1)[%arg0] to #map7(%3, %arg2)[%1] {
          "foo"(%arg1, %arg2, %arg3) : (index, index, index) -> ()
          %c30 = arith.constant 30 : index
          %4 = affine.apply #map8(%arg0, %c30)
          affine.for %arg4 = max #map9(%arg1)[%4] to min #map9(%arg3)[%c30] {
            "bar"(%arg4) : (index) -> ()
          }
        }
      }
    }
    return
  }
  func.func @ifinst(%arg0: index) {
    %c200 = arith.constant 200 : index
    affine.for %arg1 = 1 to 10 {
      affine.if #set(%arg1)[%arg0, %c200] {
        %c1_i32 = arith.constant 1 : i32
        %1 = "add"(%c1_i32, %arg1) : (i32, index) -> i32
        %2 = "mul"(%1, %1) : (i32, i32) -> i32
      } else {
        affine.if #set1(%arg1)[%arg0] {
          %c1 = arith.constant 1 : index
          %1 = affine.apply #map7(%arg1, %arg1)[%c1]
        } else {
          %c3_i32 = arith.constant 3 : i32
        }
      }
    }
    return
  }
  func.func @simple_ifinst(%arg0: index) {
    %c200 = arith.constant 200 : index
    affine.for %arg1 = 1 to 10 {
      affine.if #set(%arg1)[%arg0, %c200] {
        %c1_i32 = arith.constant 1 : i32
        %1 = "add"(%c1_i32, %arg1) : (i32, index) -> i32
        %2 = "mul"(%1, %1) : (i32, i32) -> i32
      }
    }
    return
  }
  func.func @attributes() {
    "foo"() : () -> ()
    "foo"() {a = 1 : i64, b = -423 : i64, c = [true, false], d = 1.600000e+01 : f64} : () -> ()
    "foo"() {map1 = #map2} : () -> ()
    "foo"() {map2 = #map10} : () -> ()
    "foo"() {map12 = [#map2, #map10]} : () -> ()
    "foo"() {set1 = #set2} : () -> ()
    "foo"() {set2 = #set3} : () -> ()
    "foo"() {set12 = [#set2, #set4]} : () -> ()
    "foo"() {dictionary = {bool = true, fn = @ifinst}} : () -> ()
    "foo"() {dictionary = {bar = false, bool = true, fn = @ifinst}} : () -> ()
    "foo"() {d = 1.000000e-09 : f64, func = [], i123 = 7 : i64, if = "foo"} : () -> ()
    "foo"() {fn = @attributes, if = @ifinst} : () -> ()
    "foo"() {int = 0 : i42} : () -> ()
    return
  }
  func.func @ssa_values() -> (i16, i8) {
    %1:2 = "foo"() : () -> (i1, i17)
    cf.br ^bb2
  ^bb1:  // pred: ^bb2
    %2:2 = "baz"(%3#1, %3#0, %1#1) : (f32, i11, i17) -> (i16, i8)
    return %2#0, %2#1 : i16, i8
  ^bb2:  // pred: ^bb0
    %3:2 = "bar"(%1#0, %1#1) : (i1, i17) -> (i11, f32)
    cf.br ^bb1
  }
  func.func @bbargs() -> (i16, i8) {
    %1:2 = "foo"() : () -> (i1, i17)
    cf.br ^bb1(%1#1, %1#0 : i17, i1)
  ^bb1(%2: i17, %3: i1):  // pred: ^bb0
    %4:2 = "baz"(%2, %3, %1#1) : (i17, i1, i17) -> (i16, i8)
    return %4#0, %4#1 : i16, i8
  }
  func.func @verbose_terminators() -> (i1, i17) {
    %1:2 = "foo"() : () -> (i1, i17)
    cf.br ^bb1(%1#0, %1#1 : i1, i17)
  ^bb1(%2: i1, %3: i17):  // pred: ^bb0
    cf.cond_br %2, ^bb2(%3 : i17), ^bb3(%2, %3 : i1, i17)
  ^bb2(%4: i17):  // pred: ^bb1
    %true = arith.constant true
    return %true, %4 : i1, i17
  ^bb3(%5: i1, %6: i17):  // pred: ^bb1
    return %5, %6 : i1, i17
  }
  func.func @condbr_simple() -> i32 {
    %1 = "foo"() : () -> i1
    %2 = "bar"() : () -> i32
    %3 = "bar"() : () -> i64
    cf.cond_br %1, ^bb1(%2 : i32), ^bb2(%3 : i64)
  ^bb1(%4: i32):  // pred: ^bb0
    cf.br ^bb2(%3 : i64)
  ^bb2(%5: i64):  // 2 preds: ^bb0, ^bb1
    %6 = "foo"() : () -> i32
    return %6 : i32
  }
  func.func @condbr_moarargs() -> i32 {
    %1 = "foo"() : () -> i1
    %2 = "bar"() : () -> i32
    %3 = "bar"() : () -> i64
    cf.cond_br %1, ^bb1(%2, %3 : i32, i64), ^bb2(%3, %2, %2 : i64, i32, i32)
  ^bb1(%4: i32, %5: i64):  // pred: ^bb0
    return %4 : i32
  ^bb2(%6: i64, %7: i32, %8: i32):  // pred: ^bb0
    %9 = "foo"() : () -> i32
    return %9 : i32
  }
  func.func @constants() -> (i32, i23, i23, i1, i1) {
    %c42_i32 = arith.constant 42 : i32
    %c17_i23 = arith.constant 17 : i23
    %c17_i23_0 = arith.constant 17 : i23
    %true = arith.constant true
    %false = arith.constant false
    %c3890_i32 = arith.constant 3890 : i32
    return %c42_i32, %c17_i23, %c17_i23_0, %true, %false : i32, i23, i23, i1, i1
  }
  func.func @typeattr() {
    "foo"() {bar = tensor<*xf32>} : () -> ()
    return
  }
  func.func @stringquote() {
    "foo"() {bar = "a\22quoted\22string"} : () -> ()
    "foo"() {bar = "typed_string" : !foo.string} : () -> ()
    return
  }
  func.func @unitAttrs() {
    "foo"() {unitAttr} : () -> ()
    "foo"() {unitAttr} : () -> ()
    "foo"() {nested = {unitAttr}} : () -> ()
    return
  }
  func.func @floatAttrs() {
    "foo"() {a = 4.000000e+00 : f64, b = 2.000000e+00 : f64, c = 7.100000e+00 : f64, d = -0.000000e+00 : f64} : () -> ()
    return
  }
  func.func private @externalfuncattr() attributes {dialect.a = "a\22quoted\22string", dialect.b = 4.000000e+00 : f64, dialect.c = tensor<*xf32>}
  func.func private @funcattrempty()
  func.func private @funcattr() attributes {dialect.a = "a\22quoted\22string", dialect.b = 4.000000e+00 : f64, dialect.c = tensor<*xf32>} {
    return
  }
  func.func @funcattrwithblock() {
    return
  }
  func.func @funcsimplemap(%arg0: index, %arg1: index) {
    affine.for %arg2 = 0 to 10 {
      affine.for %arg3 = 0 to %arg1 {
        affine.for %arg4 = 0 to #map2(%arg2) {
          affine.for %arg5 = 0 to #map11(%arg2)[%arg1] {
            affine.for %arg6 = 0 to #map12()[%arg1, %arg0] {
              affine.for %arg7 = 0 to #map13()[%arg0] {
                %c42_i32 = arith.constant 42 : i32
              }
            }
          }
        }
      }
    }
    return
  }
  func.func @splattensorattr() {
    "splatBoolTensor"() {bar = dense<false> : tensor<i1>} : () -> ()
    "splatUIntTensor"() {bar = dense<222> : tensor<2x1x4xui8>} : () -> ()
    "splatIntTensor"() {bar = dense<5> : tensor<2x1x4xi32>} : () -> ()
    "splatFloatTensor"() {bar = dense<-5.000000e+00> : tensor<2x1x4xf32>} : () -> ()
    "splatIntVector"() {bar = dense<5> : vector<2x1x4xi64>} : () -> ()
    "splatFloatVector"() {bar = dense<-5.000000e+00> : vector<2x1x4xf16>} : () -> ()
    "splatIntScalar"() {bar = dense<5> : tensor<i9>} : () -> ()
    "splatFloatScalar"() {bar = dense<-5.000000e+00> : tensor<f16>} : () -> ()
    return
  }
  func.func @densetensorattr() {
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
    return
  }
  func.func @densevectorattr() {
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
    return
  }
  func.func @sparsetensorattr() {
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
    return
  }
  func.func @sparsevectorattr() {
    "fooi8"() {bar = sparse<0, -2> : vector<1x1x1xi8>} : () -> ()
    "fooi16"() {bar = sparse<[[1, 1, 0], [0, 1, 0], [0, 0, 1]], [2, -1, 5]> : vector<2x2x2xi16>} : () -> ()
    "fooi32"() {bar = sparse<> : vector<1x1xi32>} : () -> ()
    "fooi64"() {bar = sparse<0, -1> : vector<1xi64>} : () -> ()
    "foof16"() {bar = sparse<0, -2.000000e+00> : vector<1x1x1xf16>} : () -> ()
    "foobf16"() {bar = sparse<[[1, 1, 0], [0, 1, 0], [0, 0, 1]], [2.000000e+00, -1.000000e+00, 5.000000e+00]> : vector<2x2x2xbf16>} : () -> ()
    "foof64"() {bar = sparse<0, -1.000000e+00> : vector<1xf64>} : () -> ()
    return
  }
  func.func @unknown_dialect_type() -> !bar<> {
    %1 = "foo"() : () -> !bar<>
    %2 = "foo"() : () -> !bar.baz
    return %1 : !bar<>
  }
  func.func @type_alias() -> i32 {
    %1 = "foo"() : () -> i32
    return %1 : i32
  }
  func.func @no_integer_set_constraints() {
    affine.if #set5() {
    }
    return
  }
  func.func @verbose_if(%arg0: index) {
    %c200 = arith.constant 200 : index
    affine.if #set(%c200)[%arg0, %c200] {
      %1 = "add"(%c200, %arg0) : (index, index) -> index
    } else {
      %1 = "add"(%c200, %c200) : (index, index) -> index
    }
    return
  }
  func.func @terminator_with_regions() {
    "region"()[^bb1] ({
    }) : () -> ()
  ^bb1:  // pred: ^bb0
    return
  }
  func.func @unregistered_term(%arg0: i1) -> i1 {
    "unregistered_br"(%arg0)[^bb1] : (i1) -> ()
  ^bb1(%1: i1):  // pred: ^bb0
    return %1 : i1
  }
  func.func @dialect_attrs() attributes {dialect.attr = 10 : i64} {
    return
  }
  func.func private @_valid.function$name()
  func.func private @external_func_arg_attrs(i32, i1 {dialect.attr = 10 : i64}, i32)
  func.func @func_arg_attrs(%arg0: i1 {dialect.attr = 10 : i64}) {
    return
  }
  func.func @func_result_attrs(%arg0: f32) -> (f32 {dialect.attr = 1 : i64}) {
    return %arg0 : f32
  }
  func.func private @empty_tuple(tuple<>)
  func.func private @tuple_single_element(tuple<i32>)
  func.func private @tuple_multi_element(tuple<i32, i16, f32>)
  func.func private @tuple_nested(tuple<tuple<tuple<i32>>>)
  func.func @pretty_form_multi_result() -> (i16, i16) {
    %1:2 = "foo_div"() : () -> (i16, i16)
    return %1#0, %1#1 : i16, i16
  }
  func.func @pretty_form_multi_result_groups() -> (i16, i16, i16, i16, i16) {
    %1:5 = "foo_test"() : () -> (i16, i16, i16, i16, i16)
    return %1#0, %1#1, %1#2, %1#3, %1#4 : i16, i16, i16, i16, i16
  }
  func.func @pretty_dialect_attribute() {
    "foo.unknown_op"() {foo = #foo.simple_attr} : () -> ()
    "foo.unknown_op"() {foo = #foo.complexattr<abcd>} : () -> ()
    "foo.unknown_op"() {foo = #foo.complexattr<abcd<f32>>} : () -> ()
    "foo.unknown_op"() {foo = #foo.complexattr<abcd<[f]$$[32]>>} : () -> ()
    "foo.unknown_op"() {foo = #foo.dialect<!x@#!@#>} : () -> ()
    return
  }
  func.func @pretty_dialect_type() {
    %1 = "foo.unknown_op"() : () -> !foo.simpletype
    %2 = "foo.unknown_op"() : () -> !foo.complextype<abcd>
    %3 = "foo.unknown_op"() : () -> !foo.complextype<abcd<f32>>
    %4 = "foo.unknown_op"() : () -> !foo.complextype<abcd<[f]$$[32]>>
    %5 = "foo.unknown_op"() : () -> !foo.dialect<!x@#!@#>
    return
  }
  func.func @none_type() {
    %1 = "foo.unknown_op"() : () -> none
    return
  }
  func.func @scoped_names() {
    "foo.region_op"() ({
      %1 = "foo.unknown_op"() : () -> none
      "foo.terminator"() : () -> ()
    }, {
      %1 = "foo.unknown_op"() : () -> none
      "foo.terminator"() : () -> ()
    }) : () -> ()
    return
  }
  func.func @dialect_attribute_with_type() {
    "foo.unknown_op"() {foo = #foo.attr : i32} : () -> ()
  }
  func.func @f16_special_values() {
    %cst = arith.constant 0x7C01 : f16
    %cst_0 = arith.constant 0x7FFF : f16
    %cst_1 = arith.constant 0xFFFF : f16
    %cst_2 = arith.constant 0x7C00 : f16
    %cst_3 = arith.constant 0xFC00 : f16
    return
  }
  func.func @f32_special_values() {
    %cst = arith.constant 0x7F800001 : f32
    %cst_0 = arith.constant 0x7FBFFFFF : f32
    %cst_1 = arith.constant 0x7FC00000 : f32
    %cst_2 = arith.constant 0xFFFFFFFF : f32
    %cst_3 = arith.constant 0x7F800000 : f32
    %cst_4 = arith.constant 0xFF800000 : f32
    return
  }
  func.func @f64_special_values() {
    %cst = arith.constant 0x7FF0000000000001 : f64
    %cst_0 = arith.constant 0x7FF8000000000000 : f64
    %cst_1 = arith.constant 0x7FF0000001000000 : f64
    %cst_2 = arith.constant 0xFFF0000001000000 : f64
    %cst_3 = arith.constant 0x7FF0000000000000 : f64
    %cst_4 = arith.constant 0xFFF0000000000000 : f64
    %cst_5 = arith.constant 0xC1CDC00000000000 : f64
    return
  }
  func.func @bfloat16_special_values() {
    %cst = arith.constant 0x7F81 : bf16
    %cst_0 = arith.constant 0xFF81 : bf16
    %cst_1 = arith.constant 0x7FC0 : bf16
    %cst_2 = arith.constant 0xFFC0 : bf16
    %cst_3 = arith.constant 0x7F80 : bf16
    %cst_4 = arith.constant 0xFF80 : bf16
    return
  }
  func.func @f80_special_values() {
    %cst = arith.constant 0x7FFFE000000000000001 : f80
    %cst_0 = arith.constant 0x7FFFB000000000000011 : f80
    %cst_1 = arith.constant 0x7FFFC000000000100000 : f80
    %cst_2 = arith.constant 0x7FFFE000000001000000 : f80
    %cst_3 = arith.constant 0x7FFF8000000000000000 : f80
    %cst_4 = arith.constant 0xFFFF8000000000000000 : f80
    return
  }
  func.func @f32_potential_precision_loss() {
    %cst = arith.constant -1.23697901 : f32
    return
  }
  func.func @special_float_values_in_tensors() {
    "foo"() {bar = dense<0xFFFFFFFF> : tensor<4x4xf32>} : () -> ()
    "foo"() {bar = dense<[[0xFFFFFFFF, 0x7F800000], [0x7FBFFFFF, 0x7F800001]]> : tensor<2x2xf32>} : () -> ()
    "foo"() {bar = dense<[0xFFFFFFFF, 0.000000e+00]> : tensor<2xf32>} : () -> ()
    "foo"() {bar = sparse<[[1, 1, 0], [0, 1, 1]], [0xFFFFFFFF, 0x7F800001]> : tensor<2x2x2xf32>} : () -> ()
  }
  func.func @op_with_region_args() {
    test.polyfor %arg0, %arg1, %arg2 {
      "foo"() : () -> ()
    }
    return
  }
  func.func @custom_name_api() {
    test.parse_custom_operation_name_api(builtin.module)
    return
  }
  func.func @op_with_passthrough_region_args() {
    %c10 = arith.constant 10 : index
    test.isolated_region %c10 {
      "foo.consumer"(%c10) : (index) -> ()
    }
    %1:2 = "foo.op"() : () -> (index, index)
    test.isolated_region %1#1 {
      "foo.consumer"(%1#1) : (index) -> ()
    }
    return
  }
  func.func private @ptr_to_function() -> !unreg.ptr<() -> ()>
  func.func private @escaped_string_char(i1 {foo.value = "\0A"})
  func.func @parse_integer_literal_test() {
    %1:5 = test.parse_integer_literal : 5
    return
  }
  func.func @parse_wrapped_keyword_test() {
    test.parse_wrapped_keyword foo.keyword
    return
  }
  func.func @parse_base64_test() {
    test.parse_b64 "aGVsbG8gd29ybGQ="
    return
  }
  func.func @parse_slash_test() {
    "test.slash_attr"() <{attr = #test.slash_attr<1 / 2>}> : () -> ()
    return
  }
  func.func @"\22_string_symbol_reference\22"() {
    "foo.symbol_reference"() {ref = @"\22_string_symbol_reference\22"} : () -> ()
    return
  }
  func.func private @parse_opaque_attr_escape() {
    "foo.constant"() {value = #foo<"\"escaped\\\n\"">} : () -> ()
  }
  func.func private @string_attr_name() attributes {"0 . 0", nested = {"0 . 0"}}
  func.func private @nested_reference() attributes {test.ref = @some_symbol::@some_nested_symbol}
  func.func @custom_asm_names() -> (i32, i32, i32, i32, i32, i32) {
    %first, %middle_results:2, %1 = "test.asm_interface_op"() : () -> (i32, i32, i32, i32)
    %first_0, %2 = "test.asm_interface_op"() : () -> (i32, i32)
    return %first, %middle_results#0, %middle_results#1, %1, %first_0, %2 : i32, i32, i32, i32, i32, i32
  }
  func.func @pretty_names() {
    %x = test.string_attr_pretty_name
    %y = test.string_attr_pretty_name
    %y_0 = test.string_attr_pretty_name attributes {names = ["y"]}
    %space_name = test.string_attr_pretty_name attributes {names = ["space name"]}
    "unknown.use"(%x, %y, %y_0, %space_name) : (i32, i32, i32, i32) -> ()
    %a, %b, %c = test.string_attr_pretty_name
    %q, %q_1, %q_2, %r = test.string_attr_pretty_name attributes {names = ["q", "q", "q", "r"]}
    return
  }
  func.func @default_dialect(%arg0: i1) {
    test.default_dialect {
      %1:5 = parse_integer_literal : 5
      %2:6 = parse_integer_literal : 6
      "test.op_with_attr"() {test.attr = "test.value"} : () -> ()
      test.op.with_dot_in_name
      "test.dialect_custom_printer.with.dot"() : () -> ()
      "test.terminator"() : () -> ()
    }
    return
  }
  func.func @unreachable_dominance_violation_ok() -> i1 {
    %false = arith.constant false
    return %false : i1
  ^bb1:  // no predecessors
    %1:3 = "bar"(%2) : (i64) -> (i1, i1, i1)
    cf.br ^bb3
  ^bb2:  // pred: ^bb2
    cf.br ^bb2
  ^bb3:  // pred: ^bb1
    %2 = "foo"() : () -> i64
    return %1#1 : i1
  }
  func.func @graph_region_in_hierarchy_ok() -> i64 {
    cf.br ^bb2
  ^bb1:  // pred: ^bb2
    test.graph_region {
      %2:3 = "bar"(%1) : (i64) -> (i1, i1, i1)
    }
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    %1 = "foo"() : () -> i64
    cf.br ^bb1
  ^bb3:  // pred: ^bb1
    return %1 : i64
  }
  func.func @graph_region_kind() {
    test.graph_region {
      %1:3 = "bar"(%2) : (i64) -> (i1, i1, i1)
      %2 = "baz"(%1#0) : (i1) -> i64
    }
    return
  }
  func.func @graph_region_inside_ssacfg_region() {
    "test.ssacfg_region"() ({
      %1 = "baz"() : () -> i64
      test.graph_region {
        %3:3 = "bar"(%1) : (i64) -> (i1, i1, i1)
      }
      %2 = "baz"() : () -> i64
    }) : () -> ()
    return
  }
  func.func @graph_region_in_graph_region_ok() {
    test.graph_region {
      test.graph_region {
        %2:3 = "bar"(%1) : (i64) -> (i1, i1, i1)
      }
      %1 = "foo"() : () -> i64
      "test.terminator"() : () -> ()
    }
    return
  }
  test.graph_region {
    %1 = "op1"(%3) : (i32) -> i32
    %2 = "test.ssacfg_region"(%1, %2, %3, %4) ({
      %5 = "op2"(%1, %2, %3, %4) : (i32, i32, i32, i32) -> i32
    }) : (i32, i32, i32, i32) -> i32
    %3 = "op2"(%1, %4) : (i32, i32) -> i32
    %4 = "op3"(%1) : (i32) -> i32
  }
  "unregistered_func_might_have_graph_region"() ({
    %1 = "foo"(%1, %2) : (i64, i64) -> i64
    %2 = "bar"(%1) : (i64) -> i64
    "unregistered_terminator"() : () -> ()
  }) {function_type = () -> i1, sym_name = "unregistered_op_dominance_violation_ok"} : () -> ()
  test.dialect_custom_printer custom_format
  test.dialect_custom_format_fallback custom_format_fallback
  %0 = test.format_optional_result_d_op : f80
}

