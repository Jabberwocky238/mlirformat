#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (10)>
#map3 = affine_map<(d0, d1) -> (d1 + 1)>
#map4 = affine_map<(d0, d1) -> (d0)>
#map5 = affine_map<(d0, d1) -> (d1)>
#map6 = affine_map<(d0, d1) -> (d0 - 1)>
#map7 = affine_map<(d0, d1) -> (d0, d1)>
#map8 = affine_map<()[s0] -> (s0)>
#map9 = affine_map<(d0) -> (d0 + 1)>
#map10 = affine_map<() -> (100)>
#map11 = affine_map<(d0) -> (d0 * 32)>
#map12 = affine_map<() -> (16)>
#map13 = affine_map<() -> (30)>
#map14 = affine_map<() -> (20)>
#map15 = affine_map<(d0) -> (d0 * 16)>
#map16 = affine_map<() -> (15)>
#map17 = affine_map<(d0) -> (d0 * 2)>
#map18 = affine_map<() -> (5)>
#map19 = affine_map<() -> (28)>
#map20 = affine_map<()[s0, s1] -> (0, s0, s1, 0)>
#map21 = affine_map<()[s0] -> (0, 0, 0, s0)>
#map22 = affine_map<()[s0, s1, s2] -> (0, s0, s1, 0, s2)>
#map23 = affine_map<()[s0] -> (0, 1, 0, s0)>
#map24 = affine_map<() -> ()>
#map25 = affine_map<() -> (4)>
#map26 = affine_map<() -> (6)>
#map27 = affine_map<() -> (9)>
#set = affine_set<(d0, d1, d2, d3) : ((d0 + 1) mod 8 >= 0, d0 * -8 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple_store_load"}> ({
    %248 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %249 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg126: index):
      "affine.store"(%248, %249, %arg126) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      %250 = "affine.load"(%249, %arg126) <{map = #map}> : (memref<10xf32>, index) -> f32
      %251 = "arith.addf"(%250, %250) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%249) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "multi_store_load"}> ({
    %239 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %240 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %241 = "arith.constant"() <{value = 9.000000e+00 : f32}> : () -> f32
    %242 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg125: index):
      "affine.store"(%239, %242, %arg125) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      %243 = "affine.load"(%242, %arg125) <{map = #map}> : (memref<10xf32>, index) -> f32
      %244 = "arith.addf"(%243, %243) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%240, %242, %arg125) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.store"(%241, %242, %arg125) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      %245 = "affine.load"(%242, %arg125) <{map = #map}> : (memref<10xf32>, index) -> f32
      %246 = "affine.load"(%242, %arg125) <{map = #map}> : (memref<10xf32>, index) -> f32
      %247 = "arith.mulf"(%245, %246) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "gpu.dealloc"(%242) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<10x10xf32>, sym_name = "store_load_affine_apply"}> ({
    %231 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %232 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg123: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg124: index):
        %233 = "affine.apply"(%arg123, %arg124) <{map = #map3}> : (index, index) -> index
        %234 = "affine.apply"(%arg123, %arg124) <{map = #map4}> : (index, index) -> index
        %235 = "affine.apply"(%233, %234) <{map = #map5}> : (index, index) -> index
        %236 = "affine.apply"(%233, %234) <{map = #map6}> : (index, index) -> index
        "affine.store"(%231, %232, %235, %236) <{map = #map7}> : (f32, memref<10x10xf32>, index, index) -> ()
        %237 = "affine.load"(%232, %arg123, %arg124) <{map = #map7}> : (memref<10x10xf32>, index, index) -> f32
        %238 = "arith.addf"(%237, %237) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%232) : (memref<10x10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "store_load_nested"}> ({
  ^bb0(%arg120: index):
    %227 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %228 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg121: index):
      "affine.store"(%227, %228, %arg121) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg120) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg122: index):
        %229 = "affine.load"(%228, %arg121) <{map = #map}> : (memref<10xf32>, index) -> f32
        %230 = "arith.addf"(%229, %229) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "multi_store_load_nested_no_fwd"}> ({
  ^bb0(%arg116: index):
    %222 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %223 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %224 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg117: index):
      "affine.store"(%222, %224, %arg117) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg116) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg119: index):
        "affine.store"(%223, %224, %arg119) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.for"(%arg116) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg118: index):
        %225 = "affine.load"(%224, %arg117) <{map = #map}> : (memref<10xf32>, index) -> f32
        %226 = "arith.addf"(%225, %225) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "store_load_store_nested_no_fwd"}> ({
  ^bb0(%arg113: index):
    %217 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %218 = "arith.constant"() <{value = 9.000000e+00 : f32}> : () -> f32
    %219 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg114: index):
      "affine.store"(%217, %219, %arg114) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg113) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg115: index):
        %220 = "affine.load"(%219, %arg114) <{map = #map}> : (memref<10xf32>, index) -> f32
        %221 = "arith.addf"(%220, %220) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%218, %219, %arg114) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "multi_store_load_nested_fwd"}> ({
  ^bb0(%arg108: index):
    %210 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %211 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %212 = "arith.constant"() <{value = 9.000000e+00 : f32}> : () -> f32
    %213 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %214 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg109: index):
      "affine.store"(%210, %214, %arg109) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg108) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg112: index):
        "affine.store"(%211, %214, %arg112) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.for"(%arg108) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg111: index):
        "affine.store"(%212, %214, %arg111) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.store"(%213, %214, %arg109) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg108) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg110: index):
        %215 = "affine.load"(%214, %arg109) <{map = #map}> : (memref<10xf32>, index) -> f32
        %216 = "arith.addf"(%215, %215) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "store_load_no_fwd"}> ({
    %206 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %207 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg105: index):
      "affine.store"(%206, %207, %arg105) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg106: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg107: index):
          %208 = "affine.load"(%207, %arg107) <{map = #map}> : (memref<10xf32>, index) -> f32
          %209 = "arith.addf"(%208, %208) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "store_load_fwd"}> ({
    %201 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %202 = "arith.constant"() <{value = 0 : index}> : () -> index
    %203 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.store"(%201, %203, %202) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg102: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg103: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg104: index):
          %204 = "affine.load"(%203, %202) <{map = #map}> : (memref<10xf32>, index) -> f32
          %205 = "arith.addf"(%204, %204) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> f32, sym_name = "store_load_store_nested_fwd"}> ({
  ^bb0(%arg99: index):
    %192 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %193 = "arith.constant"() <{value = 9.000000e+00 : f32}> : () -> f32
    %194 = "arith.constant"() <{value = 0 : index}> : () -> index
    %195 = "arith.constant"() <{value = 1 : index}> : () -> index
    %196 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg100: index):
      "affine.store"(%192, %196, %arg100) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg99) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg101: index):
        %198 = "affine.load"(%196, %arg100) <{map = #map}> : (memref<10xf32>, index) -> f32
        %199 = "arith.addf"(%198, %198) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %200 = "affine.apply"(%arg100) <{map = #map9}> : (index) -> index
        "affine.store"(%193, %196, %200) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %197 = "affine.load"(%196, %195) <{map = #map}> : (memref<10xf32>, index) -> f32
    "func.return"(%197) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>, index, index) -> f32, sym_name = "should_not_fwd"}> ({
  ^bb0(%arg96: memref<100xf32>, %arg97: index, %arg98: index):
    %190 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.store"(%190, %arg96, %arg97) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
    %191 = "affine.load"(%arg96, %arg98) <{map = #map}> : (memref<100xf32>, index) -> f32
    "func.return"(%191) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100x100xf32>, index) -> (), sym_name = "refs_not_known_to_be_equal"}> ({
  ^bb0(%arg92: memref<100x100xf32>, %arg93: index):
    %185 = "affine.apply"(%arg93) <{map = #map9}> : (index) -> index
    %186 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map10}> ({
    ^bb0(%arg94: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map10}> ({
      ^bb0(%arg95: index):
        %187 = "affine.load"(%arg92, %arg94, %arg95) <{map = #map7}> : (memref<100x100xf32>, index, index) -> f32
        "affine.store"(%186, %arg92, %arg95, %arg94) <{map = #map7}> : (f32, memref<100x100xf32>, index, index) -> ()
        %188 = "affine.load"(%arg92, %arg94, %arg95) <{map = #map7}> : (memref<100x100xf32>, index, index) -> f32
        %189 = "affine.load"(%arg92, %arg95, %arg94) <{map = #map7}> : (memref<100x100xf32>, index, index) -> f32
        "foo"(%187, %188, %189) : (f32, f32, f32) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>, memref<100xf32>) -> (), sym_name = "elim_load_after_store"}> ({
  ^bb0(%arg89: memref<100xf32>, %arg90: memref<100xf32>):
    %174 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %175 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map10}> ({
    ^bb0(%arg91: index):
      %176 = "affine.load"(%arg89, %arg91) <{map = #map}> : (memref<100xf32>, index) -> f32
      %177 = "affine.load"(%arg89, %arg91) <{map = #map}> : (memref<100xf32>, index) -> f32
      %178 = "arith.addf"(%176, %177) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%178, %175) <{map = #map1}> : (f32, memref<1xf32>) -> ()
      %179 = "affine.load"(%arg89, %arg91) <{map = #map}> : (memref<100xf32>, index) -> f32
      %180 = "affine.load"(%175) <{map = #map1}> : (memref<1xf32>) -> f32
      %181 = "arith.addf"(%179, %180) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%181, %174) <{map = #map1}> : (f32, memref<1xf32>) -> ()
      %182 = "affine.load"(%arg89, %arg91) <{map = #map}> : (memref<100xf32>, index) -> f32
      %183 = "affine.load"(%174) <{map = #map1}> : (memref<1xf32>) -> f32
      %184 = "arith.addf"(%182, %183) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%184, %arg90, %arg91) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "vector_forwarding"}> ({
  ^bb0(%arg86: memref<512xf32>, %arg87: memref<512xf32>):
    %171 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg88: index):
      %172 = "affine.vector_load"(%arg86, %arg88) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      "affine.vector_store"(%172, %171, %arg88) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      %173 = "affine.vector_load"(%171, %arg88) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      "affine.vector_store"(%173, %arg87, %arg88) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "vector_no_forwarding"}> ({
  ^bb0(%arg83: memref<512xf32>, %arg84: memref<512xf32>):
    %168 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg85: index):
      %169 = "affine.vector_load"(%arg83, %arg85) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      "affine.vector_store"(%169, %168, %arg85) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      %170 = "affine.vector_load"(%168, %arg85) <{map = #map11}> : (memref<512xf32>, index) -> vector<16xf32>
      "affine.vector_store"(%170, %arg84, %arg85) <{map = #map11}> : (vector<16xf32>, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "simple_three_loads"}> ({
  ^bb0(%arg81: memref<10xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg82: index):
      %163 = "affine.load"(%arg81, %arg82) <{map = #map}> : (memref<10xf32>, index) -> f32
      %164 = "affine.load"(%arg81, %arg82) <{map = #map}> : (memref<10xf32>, index) -> f32
      %165 = "arith.addf"(%163, %164) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %166 = "affine.load"(%arg81, %arg82) <{map = #map}> : (memref<10xf32>, index) -> f32
      %167 = "arith.addf"(%165, %166) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "nested_loads_const_index"}> ({
  ^bb0(%arg77: memref<10xf32>):
    %159 = "arith.constant"() <{value = 0 : index}> : () -> index
    %160 = "affine.load"(%arg77, %159) <{map = #map}> : (memref<10xf32>, index) -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg78: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map14}> ({
      ^bb0(%arg79: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map13}> ({
        ^bb0(%arg80: index):
          %161 = "affine.load"(%arg77, %159) <{map = #map}> : (memref<10xf32>, index) -> f32
          %162 = "arith.addf"(%160, %161) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<10xf32>) -> (), sym_name = "nested_loads"}> ({
  ^bb0(%arg73: index, %arg74: memref<10xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg75: index):
      %156 = "affine.load"(%arg74, %arg75) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.for"(%arg73) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg76: index):
        %157 = "affine.load"(%arg74, %arg75) <{map = #map}> : (memref<10xf32>, index) -> f32
        %158 = "arith.addf"(%156, %157) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "nested_loads_different_memref_accesses_no_cse"}> ({
  ^bb0(%arg70: memref<10xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg71: index):
      %153 = "affine.load"(%arg70, %arg71) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map14}> ({
      ^bb0(%arg72: index):
        %154 = "affine.load"(%arg70, %arg72) <{map = #map}> : (memref<10xf32>, index) -> f32
        %155 = "arith.addf"(%153, %154) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "load_load_store"}> ({
  ^bb0(%arg68: memref<10xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg69: index):
      %150 = "affine.load"(%arg68, %arg69) <{map = #map}> : (memref<10xf32>, index) -> f32
      %151 = "affine.load"(%arg68, %arg69) <{map = #map}> : (memref<10xf32>, index) -> f32
      %152 = "arith.addf"(%150, %151) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%152, %arg68, %arg69) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<10xf32>) -> (), sym_name = "load_load_store_2_loops_no_cse"}> ({
  ^bb0(%arg64: index, %arg65: memref<10xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg66: index):
      %147 = "affine.load"(%arg65, %arg66) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.for"(%arg64) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg67: index):
        %148 = "affine.load"(%arg65, %arg66) <{map = #map}> : (memref<10xf32>, index) -> f32
        %149 = "arith.addf"(%147, %148) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%149, %arg65, %arg66) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "load_load_store_3_loops_no_cse"}> ({
  ^bb0(%arg60: memref<10xf32>):
    %143 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg61: index):
      %144 = "affine.load"(%arg60, %arg61) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map14}> ({
      ^bb0(%arg62: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map13}> ({
        ^bb0(%arg63: index):
          %145 = "affine.load"(%arg60, %arg61) <{map = #map}> : (memref<10xf32>, index) -> f32
          %146 = "arith.addf"(%144, %145) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.store"(%143, %arg60, %arg61) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "load_load_store_3_loops"}> ({
  ^bb0(%arg56: memref<10xf32>):
    %139 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg57: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map14}> ({
      ^bb0(%arg58: index):
        %140 = "affine.load"(%arg56, %arg57) <{map = #map}> : (memref<10xf32>, index) -> f32
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map13}> ({
        ^bb0(%arg59: index):
          %141 = "affine.load"(%arg56, %arg57) <{map = #map}> : (memref<10xf32>, index) -> f32
          %142 = "arith.addf"(%140, %141) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.store"(%139, %arg56, %arg57) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "loads_in_sibling_loops_const_index_no_cse"}> ({
  ^bb0(%arg53: memref<10xf32>):
    %135 = "arith.constant"() <{value = 0 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg55: index):
      %138 = "affine.load"(%arg53, %135) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg54: index):
      %136 = "affine.load"(%arg53, %135) <{map = #map}> : (memref<10xf32>, index) -> f32
      %137 = "arith.addf"(%136, %136) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10x10xf32>) -> (), sym_name = "load_load_affine_apply"}> ({
  ^bb0(%arg50: memref<10x10xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg51: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg52: index):
        %128 = "affine.apply"(%arg51, %arg52) <{map = #map3}> : (index, index) -> index
        %129 = "affine.apply"(%arg51, %arg52) <{map = #map4}> : (index, index) -> index
        %130 = "affine.apply"(%128, %129) <{map = #map5}> : (index, index) -> index
        %131 = "affine.apply"(%128, %129) <{map = #map6}> : (index, index) -> index
        %132 = "affine.load"(%arg50, %130, %131) <{map = #map7}> : (memref<10x10xf32>, index, index) -> f32
        %133 = "affine.load"(%arg50, %arg51, %arg52) <{map = #map7}> : (memref<10x10xf32>, index, index) -> f32
        %134 = "arith.addf"(%132, %133) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "vector_loads"}> ({
  ^bb0(%arg47: memref<512xf32>, %arg48: memref<512xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg49: index):
      %125 = "affine.vector_load"(%arg47, %arg49) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      %126 = "affine.vector_load"(%arg47, %arg49) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      %127 = "arith.addf"(%125, %126) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
      "affine.vector_store"(%126, %arg48, %arg49) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "vector_loads_no_cse"}> ({
  ^bb0(%arg44: memref<512xf32>, %arg45: memref<512xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg46: index):
      %123 = "affine.vector_load"(%arg44, %arg46) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      %124 = "affine.vector_load"(%arg44, %arg46) <{map = #map11}> : (memref<512xf32>, index) -> vector<16xf32>
      "affine.vector_store"(%124, %arg45, %arg46) <{map = #map11}> : (vector<16xf32>, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "vector_load_store_load_no_cse"}> ({
  ^bb0(%arg41: memref<512xf32>, %arg42: memref<512xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg43: index):
      %120 = "affine.vector_load"(%arg41, %arg43) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      "affine.vector_store"(%120, %arg41, %arg43) <{map = #map15}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      %121 = "affine.vector_load"(%arg41, %arg43) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      %122 = "arith.addf"(%120, %121) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
      "affine.vector_store"(%121, %arg42, %arg43) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<1xf32>, sym_name = "reduction_multi_store"}> ({
    %114 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %115 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %116 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    "affine.store"(%115, %114) <{map = #map1}> : (f32, memref<1xf32>) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map10}> ({
    ^bb0(%arg40: index):
      %117 = "affine.load"(%114) <{map = #map1}> : (memref<1xf32>) -> f32
      %118 = "arith.addf"(%117, %116) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%118, %114) <{map = #map1}> : (f32, memref<1xf32>) -> ()
      %119 = "affine.load"(%114) <{map = #map1}> : (memref<1xf32>) -> f32
      "test.foo"(%119) : (f32) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%114) : (memref<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "vector_load_affine_apply_store_load"}> ({
  ^bb0(%arg37: memref<512xf32>, %arg38: memref<512xf32>):
    %109 = "arith.constant"() <{value = 1 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map16}> ({
    ^bb0(%arg39: index):
      %110 = "affine.vector_load"(%arg37, %arg39) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      %111 = "affine.apply"(%arg39) <{map = #map9}> : (index) -> index
      "affine.vector_store"(%110, %arg37, %111) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      %112 = "affine.vector_load"(%arg37, %arg39) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      %113 = "arith.addf"(%110, %112) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
      "affine.vector_store"(%112, %arg38, %arg39) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "external_no_forward_load"}> ({
  ^bb0(%arg34: memref<512xf32>, %arg35: memref<512xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg36: index):
      %107 = "affine.load"(%arg34, %arg36) <{map = #map11}> : (memref<512xf32>, index) -> f32
      "affine.store"(%107, %arg35, %arg36) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "memop"(%arg34, %arg35) : (memref<512xf32>, memref<512xf32>) -> ()
      %108 = "affine.load"(%arg34, %arg36) <{map = #map11}> : (memref<512xf32>, index) -> f32
      "affine.store"(%108, %arg35, %arg36) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "external_no_forward_store"}> ({
  ^bb0(%arg31: memref<512xf32>, %arg32: memref<512xf32>):
    %105 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg33: index):
      "affine.store"(%105, %arg31, %arg33) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "memop"(%arg31, %arg32) : (memref<512xf32>, memref<512xf32>) -> ()
      %106 = "affine.load"(%arg31, %arg33) <{map = #map11}> : (memref<512xf32>, index) -> f32
      "affine.store"(%106, %arg32, %arg33) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "no_forward_cast"}> ({
  ^bb0(%arg28: memref<512xf32>, %arg29: memref<512xf32>):
    %101 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %102 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %103 = "memref.cast"(%arg28) : (memref<512xf32>) -> memref<?xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg30: index):
      "affine.store"(%101, %arg28, %arg30) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.store"(%102, %103, %arg30) <{map = #map11}> : (f32, memref<?xf32>, index) -> ()
      %104 = "affine.load"(%arg28, %arg30) <{map = #map11}> : (memref<512xf32>, index) -> f32
      "affine.store"(%104, %arg29, %arg30) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> f32, sym_name = "overlap_no_fwd"}> ({
  ^bb0(%arg25: index):
    %93 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %94 = "arith.constant"() <{value = 9.000000e+00 : f32}> : () -> f32
    %95 = "arith.constant"() <{value = 0 : index}> : () -> index
    %96 = "arith.constant"() <{value = 1 : index}> : () -> index
    %97 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map18}> ({
    ^bb0(%arg26: index):
      "affine.store"(%93, %97, %arg26) <{map = #map17}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg25) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg27: index):
        %99 = "affine.load"(%97, %arg26) <{map = #map17}> : (memref<10xf32>, index) -> f32
        %100 = "arith.addf"(%99, %99) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%94, %97, %arg26) <{map = #map9}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %98 = "affine.load"(%97, %96) <{map = #map}> : (memref<10xf32>, index) -> f32
    "func.return"(%98) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>) -> (), sym_name = "redundant_store_elim"}> ({
  ^bb0(%arg23: memref<512xf32>):
    %91 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %92 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg24: index):
      "affine.store"(%91, %arg23, %arg24) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.store"(%92, %arg23, %arg24) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>) -> (), sym_name = "redundant_store_elim_nonintervening"}> ({
  ^bb0(%arg21: memref<512xf32>):
    %88 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %89 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg22: index):
      "affine.store"(%88, %89, %arg22) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      %90 = "affine.load"(%arg21, %arg22) <{map = #map11}> : (memref<512xf32>, index) -> f32
      "affine.store"(%90, %89, %arg22) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>) -> (), sym_name = "redundant_store_elim_fail"}> ({
  ^bb0(%arg19: memref<512xf32>):
    %86 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %87 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg20: index):
      "affine.store"(%86, %arg19, %arg20) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "test.use"(%arg19) : (memref<512xf32>) -> ()
      "affine.store"(%87, %arg19, %arg20) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf64>, memref<?xf64>, i1) -> (), sym_name = "with_inner_ops"}> ({
  ^bb0(%arg15: memref<?xf64>, %arg16: memref<?xf64>, %arg17: i1):
    %81 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %82 = "arith.constant"() <{value = 3.140000e+00 : f64}> : () -> f64
    %83 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map19}> ({
    ^bb0(%arg18: index):
      "affine.store"(%81, %arg16, %arg18) <{map = #map}> : (f64, memref<?xf64>, index) -> ()
      "affine.store"(%82, %arg16, %arg18) <{map = #map}> : (f64, memref<?xf64>, index) -> ()
      %84 = "scf.if"(%arg17) ({
        "scf.yield"(%83) : (f64) -> ()
      }, {
        %85 = "affine.load"(%arg16, %arg18) <{map = #map}> : (memref<?xf64>, index) -> f64
        "scf.yield"(%85) : (f64) -> ()
      }) : (i1) -> f64
      "affine.store"(%84, %arg15, %arg18) <{map = #map}> : (f64, memref<?xf64>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x4094x510x1xf32>, memref<4x4x1x64xf32>, memref<1x2046x254x1x64xf32>) -> (), sym_name = "affine_store_load_in_scope"}> ({
  ^bb0(%arg11: memref<1x4094x510x1xf32>, %arg12: memref<4x4x1x64xf32>, %arg13: memref<1x2046x254x1x64xf32>):
    %56 = "arith.constant"() <{value = 0 : index}> : () -> index
    %57 = "arith.constant"() <{value = 1 : index}> : () -> index
    %58 = "arith.constant"() <{value = 2 : index}> : () -> index
    %59 = "arith.constant"() <{value = 64 : index}> : () -> index
    %60 = "arith.constant"() <{value = 768 : index}> : () -> index
    "scf.for"(%56, %60, %57) ({
    ^bb0(%arg14: index):
      %61 = "arith.remsi"(%arg14, %59) : (index, index) -> index
      %62 = "arith.divsi"(%arg14, %59) : (index, index) -> index
      %63 = "arith.remsi"(%62, %58) : (index, index) -> index
      %64 = "arith.divsi"(%62, %58) : (index, index) -> index
      "test.affine_scope"() ({
        %65 = "arith.muli"(%64, %58) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %66 = "arith.addi"(%58, %65) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %67 = "arith.addi"(%66, %56) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %68 = "arith.muli"(%63, %58) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %69 = "arith.addi"(%58, %68) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %70 = "affine.load"(%arg11, %67, %69) <{map = #map20}> : (memref<1x4094x510x1xf32>, index, index) -> f32
        %71 = "affine.load"(%arg12, %61) <{map = #map21}> : (memref<4x4x1x64xf32>, index) -> f32
        %72 = "affine.load"(%arg13, %64, %63, %61) <{map = #map22}> : (memref<1x2046x254x1x64xf32>, index, index, index) -> f32
        %73 = "arith.mulf"(%70, %71) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %74 = "arith.addf"(%72, %73) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%74, %arg13, %64, %63, %61) <{map = #map22}> : (f32, memref<1x2046x254x1x64xf32>, index, index, index) -> ()
        %75 = "arith.addi"(%69, %57) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %76 = "affine.load"(%arg11, %67, %75) <{map = #map20}> : (memref<1x4094x510x1xf32>, index, index) -> f32
        %77 = "affine.load"(%arg12, %61) <{map = #map23}> : (memref<4x4x1x64xf32>, index) -> f32
        %78 = "affine.load"(%arg13, %64, %63, %61) <{map = #map22}> : (memref<1x2046x254x1x64xf32>, index, index, index) -> f32
        %79 = "arith.mulf"(%76, %77) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %80 = "arith.addf"(%78, %79) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "terminate"() : () -> ()
      }) : () -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<1xf32>, sym_name = "affine_load_store_in_different_scopes"}> ({
    %52 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %53 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %54 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    "affine.store"(%53, %52) <{map = #map1}> : (f32, memref<1xf32>) -> ()
    "test.affine_scope"() ({
      "affine.store"(%54, %52) <{map = #map1}> : (f32, memref<1xf32>) -> ()
      "test.terminate"() : () -> ()
    }) : () -> ()
    %55 = "affine.load"(%52) <{map = #map1}> : (memref<1xf32>) -> f32
    "func.return"(%52) : (memref<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<1xf32>, sym_name = "no_forwarding_across_scopes"}> ({
    %44 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %45 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %46 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %47 = "arith.constant"() <{value = 0 : index}> : () -> index
    %48 = "arith.constant"() <{value = 100 : index}> : () -> index
    %49 = "arith.constant"() <{value = 1 : index}> : () -> index
    "affine.store"(%45, %44) <{map = #map1}> : (f32, memref<1xf32>) -> ()
    "test.affine_scope"() ({
      %50 = "affine.load"(%44) <{map = #map1}> : (memref<1xf32>) -> f32
      %51 = "arith.addf"(%50, %46) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%51, %44) <{map = #map1}> : (f32, memref<1xf32>) -> ()
      "terminator"() : () -> ()
    }) : () -> ()
    "func.return"(%44) : (memref<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "parallel_store_load"}> ({
    %40 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %41 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map1, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map2}> ({
    ^bb0(%arg10: index):
      "affine.store"(%40, %41, %arg10) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      %42 = "affine.load"(%41, %arg10) <{map = #map}> : (memref<10xf32>, index) -> f32
      %43 = "arith.addf"(%42, %42) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%41) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "non_constant_parallel_store_load"}> ({
  ^bb0(%arg8: index):
    %36 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %37 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.parallel"(%arg8) <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map1, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map}> ({
    ^bb0(%arg9: index):
      "affine.store"(%36, %37, %arg9) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      %38 = "affine.load"(%37, %arg9) <{map = #map}> : (memref<10xf32>, index) -> f32
      %39 = "arith.addf"(%38, %38) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "memref.dealloc"(%37) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "parallel_surrounding_for"}> ({
    %32 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %33 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map1, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map2}> ({
    ^bb0(%arg6: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg7: index):
        "affine.store"(%32, %33, %arg6, %arg7) <{map = #map7}> : (f32, memref<10x10xf32>, index, index) -> ()
        %34 = "affine.load"(%33, %arg6, %arg7) <{map = #map7}> : (memref<10x10xf32>, index, index) -> f32
        %35 = "arith.addf"(%34, %34) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%33) : (memref<10x10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "dead_affine_region_op"}> ({
    %28 = "arith.constant"() <{value = 1 : index}> : () -> index
    %29 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<15xi1>
    %30 = "arith.constant"() <{value = true}> : () -> i1
    "affine.store"(%30, %29, %28) <{map = #map}> : (i1, memref<15xi1>, index) -> ()
    "affine.store"(%30, %29, %28) <{map = #map}> : (i1, memref<15xi1>, index) -> ()
    "affine.if"(%28, %28, %28, %28) <{condition = #set}> ({
      %31 = "affine.load"(%29, %28) <{map = #map}> : (memref<15xi1>, index) -> i1
      "affine.yield"() : () -> ()
    }, {
    }) : (index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "cross_block"}> ({
    %21 = "arith.constant"() <{value = 10 : index}> : () -> index
    %22 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x13xf32>
    %23 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<13xi1>
    %24 = "arith.constant"() <{value = true}> : () -> i1
    "affine.store"(%24, %23, %21) <{map = #map}> : (i1, memref<13xi1>, index) -> ()
    %25 = "arith.constant"() <{value = true}> : () -> i1
    "affine.store"(%25, %23, %21) <{map = #map}> : (i1, memref<13xi1>, index) -> ()
    "cf.br"(%22)[^bb1] : (memref<1x13xf32>) -> ()
  ^bb1(%26: memref<1x13xf32>):  // pred: ^bb0
    %27 = "affine.load"(%23, %21) <{map = #map}> : (memref<13xi1>, index) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "consecutive_store"}> ({
    %18 = "arith.constant"() <{value = 1.099610e+00 : f16}> : () -> f16
    %19 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f16, 1>
    "affine.for"() <{lowerBoundMap = #map25, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map26}> ({
    ^bb0(%arg4: index):
      "affine.for"(%arg4, %arg4) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 4 : index, upperBoundMap = #map}> ({
      ^bb0(%arg5: index):
        "affine.store"(%18, %19) <{map = #map24}> : (f16, memref<f16, 1>) -> ()
        "affine.store"(%18, %19) <{map = #map24}> : (f16, memref<f16, 1>) -> ()
        %20 = "affine.load"(%19) <{map = #map24}> : (memref<f16, 1>) -> f16
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>, i32) -> i32, sym_name = "scf_for_if"}> ({
  ^bb0(%arg1: memref<?xi32>, %arg2: i32):
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %7 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %8 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %9 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    %10 = "llvm.mlir.undef"() : () -> i32
    "affine.store"(%10, %9) <{map = #map1}> : (i32, memref<1xi32>) -> ()
    "affine.store"(%6, %9) <{map = #map1}> : (i32, memref<1xi32>) -> ()
    %11 = "arith.index_cast"(%arg2) : (i32) -> index
    "scf.for"(%5, %11, %4) ({
    ^bb0(%arg3: index):
      %13 = "memref.load"(%arg1, %arg3) : (memref<?xi32>, index) -> i32
      %14 = "arith.muli"(%13, %7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %15 = "arith.cmpi"(%14, %8) <{predicate = 4 : i64}> : (i32, i32) -> i1
      "scf.if"(%15) ({
        %16 = "affine.load"(%9) <{map = #map1}> : (memref<1xi32>) -> i32
        %17 = "arith.addi"(%14, %16) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "affine.store"(%17, %9) <{map = #map1}> : (i32, memref<1xi32>) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %12 = "affine.load"(%9) <{map = #map1}> : (memref<1xi32>) -> i32
    "func.return"(%12) : (i32) -> ()
  }) {llvm.linkage = #llvm.linkage<external>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "zero_d_memrefs"}> ({
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "affine.store"(%0, %1) <{map = #map24}> : (i32, memref<i32>) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map27}> ({
    ^bb0(%arg0: index):
      %2 = "affine.load"(%1) <{map = #map24}> : (memref<i32>) -> i32
      %3 = "arith.addi"(%2, %2) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

