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
#map28 = affine_map<(d0) -> (d0, d0)>
#set = affine_set<(d0, d1, d2, d3) : ((d0 + 1) mod 8 >= 0, d0 * -8 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "simple_store_load"}> ({
    %254 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %255 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg128: index):
      "affine.store"(%254, %255, %arg128) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      %256 = "affine.load"(%255, %arg128) <{map = #map}> : (memref<10xf32>, index) -> f32
      %257 = "arith.addf"(%256, %256) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%255) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "multi_store_load"}> ({
    %245 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %246 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %247 = "arith.constant"() <{value = 9.000000e+00 : f32}> : () -> f32
    %248 = "gpu.alloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg127: index):
      "affine.store"(%245, %248, %arg127) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      %249 = "affine.load"(%248, %arg127) <{map = #map}> : (memref<10xf32>, index) -> f32
      %250 = "arith.addf"(%249, %249) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%246, %248, %arg127) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.store"(%247, %248, %arg127) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      %251 = "affine.load"(%248, %arg127) <{map = #map}> : (memref<10xf32>, index) -> f32
      %252 = "affine.load"(%248, %arg127) <{map = #map}> : (memref<10xf32>, index) -> f32
      %253 = "arith.mulf"(%251, %252) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "gpu.dealloc"(%248) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<10x10xf32>, sym_name = "store_load_affine_apply"}> ({
    %237 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %238 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg125: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg126: index):
        %239 = "affine.apply"(%arg125, %arg126) <{map = #map3}> : (index, index) -> index
        %240 = "affine.apply"(%arg125, %arg126) <{map = #map4}> : (index, index) -> index
        %241 = "affine.apply"(%239, %240) <{map = #map5}> : (index, index) -> index
        %242 = "affine.apply"(%239, %240) <{map = #map6}> : (index, index) -> index
        "affine.store"(%237, %238, %241, %242) <{map = #map7}> : (f32, memref<10x10xf32>, index, index) -> ()
        %243 = "affine.load"(%238, %arg125, %arg126) <{map = #map7}> : (memref<10x10xf32>, index, index) -> f32
        %244 = "arith.addf"(%243, %243) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%238) : (memref<10x10xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "store_load_nested"}> ({
  ^bb0(%arg122: index):
    %233 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %234 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg123: index):
      "affine.store"(%233, %234, %arg123) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg122) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg124: index):
        %235 = "affine.load"(%234, %arg123) <{map = #map}> : (memref<10xf32>, index) -> f32
        %236 = "arith.addf"(%235, %235) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "multi_store_load_nested_no_fwd"}> ({
  ^bb0(%arg118: index):
    %228 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %229 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %230 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg119: index):
      "affine.store"(%228, %230, %arg119) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg118) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg121: index):
        "affine.store"(%229, %230, %arg121) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.for"(%arg118) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg120: index):
        %231 = "affine.load"(%230, %arg119) <{map = #map}> : (memref<10xf32>, index) -> f32
        %232 = "arith.addf"(%231, %231) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "store_load_store_nested_no_fwd"}> ({
  ^bb0(%arg115: index):
    %223 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %224 = "arith.constant"() <{value = 9.000000e+00 : f32}> : () -> f32
    %225 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg116: index):
      "affine.store"(%223, %225, %arg116) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg115) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg117: index):
        %226 = "affine.load"(%225, %arg116) <{map = #map}> : (memref<10xf32>, index) -> f32
        %227 = "arith.addf"(%226, %226) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%224, %225, %arg116) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "multi_store_load_nested_fwd"}> ({
  ^bb0(%arg110: index):
    %216 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %217 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %218 = "arith.constant"() <{value = 9.000000e+00 : f32}> : () -> f32
    %219 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %220 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg111: index):
      "affine.store"(%216, %220, %arg111) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg110) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg114: index):
        "affine.store"(%217, %220, %arg114) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.for"(%arg110) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg113: index):
        "affine.store"(%218, %220, %arg113) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.store"(%219, %220, %arg111) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg110) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg112: index):
        %221 = "affine.load"(%220, %arg111) <{map = #map}> : (memref<10xf32>, index) -> f32
        %222 = "arith.addf"(%221, %221) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "store_load_no_fwd"}> ({
    %212 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %213 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg107: index):
      "affine.store"(%212, %213, %arg107) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg108: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg109: index):
          %214 = "affine.load"(%213, %arg109) <{map = #map}> : (memref<10xf32>, index) -> f32
          %215 = "arith.addf"(%214, %214) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "store_load_fwd"}> ({
    %207 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %208 = "arith.constant"() <{value = 0 : index}> : () -> index
    %209 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.store"(%207, %209, %208) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg104: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg105: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
        ^bb0(%arg106: index):
          %210 = "affine.load"(%209, %208) <{map = #map}> : (memref<10xf32>, index) -> f32
          %211 = "arith.addf"(%210, %210) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> f32, sym_name = "store_load_store_nested_fwd"}> ({
  ^bb0(%arg101: index):
    %198 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %199 = "arith.constant"() <{value = 9.000000e+00 : f32}> : () -> f32
    %200 = "arith.constant"() <{value = 0 : index}> : () -> index
    %201 = "arith.constant"() <{value = 1 : index}> : () -> index
    %202 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg102: index):
      "affine.store"(%198, %202, %arg102) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg101) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg103: index):
        %204 = "affine.load"(%202, %arg102) <{map = #map}> : (memref<10xf32>, index) -> f32
        %205 = "arith.addf"(%204, %204) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %206 = "affine.apply"(%arg102) <{map = #map9}> : (index) -> index
        "affine.store"(%199, %202, %206) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %203 = "affine.load"(%202, %201) <{map = #map}> : (memref<10xf32>, index) -> f32
    "func.return"(%203) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>, index, index) -> f32, sym_name = "should_not_fwd"}> ({
  ^bb0(%arg98: memref<100xf32>, %arg99: index, %arg100: index):
    %196 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.store"(%196, %arg98, %arg99) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
    %197 = "affine.load"(%arg98, %arg100) <{map = #map}> : (memref<100xf32>, index) -> f32
    "func.return"(%197) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100x100xf32>, index) -> (), sym_name = "refs_not_known_to_be_equal"}> ({
  ^bb0(%arg94: memref<100x100xf32>, %arg95: index):
    %191 = "affine.apply"(%arg95) <{map = #map9}> : (index) -> index
    %192 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map10}> ({
    ^bb0(%arg96: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map10}> ({
      ^bb0(%arg97: index):
        %193 = "affine.load"(%arg94, %arg96, %arg97) <{map = #map7}> : (memref<100x100xf32>, index, index) -> f32
        "affine.store"(%192, %arg94, %arg97, %arg96) <{map = #map7}> : (f32, memref<100x100xf32>, index, index) -> ()
        %194 = "affine.load"(%arg94, %arg96, %arg97) <{map = #map7}> : (memref<100x100xf32>, index, index) -> f32
        %195 = "affine.load"(%arg94, %arg97, %arg96) <{map = #map7}> : (memref<100x100xf32>, index, index) -> f32
        "foo"(%193, %194, %195) : (f32, f32, f32) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<100xf32>, memref<100xf32>) -> (), sym_name = "elim_load_after_store"}> ({
  ^bb0(%arg91: memref<100xf32>, %arg92: memref<100xf32>):
    %180 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %181 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map10}> ({
    ^bb0(%arg93: index):
      %182 = "affine.load"(%arg91, %arg93) <{map = #map}> : (memref<100xf32>, index) -> f32
      %183 = "affine.load"(%arg91, %arg93) <{map = #map}> : (memref<100xf32>, index) -> f32
      %184 = "arith.addf"(%182, %183) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%184, %181) <{map = #map1}> : (f32, memref<1xf32>) -> ()
      %185 = "affine.load"(%arg91, %arg93) <{map = #map}> : (memref<100xf32>, index) -> f32
      %186 = "affine.load"(%181) <{map = #map1}> : (memref<1xf32>) -> f32
      %187 = "arith.addf"(%185, %186) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%187, %180) <{map = #map1}> : (f32, memref<1xf32>) -> ()
      %188 = "affine.load"(%arg91, %arg93) <{map = #map}> : (memref<100xf32>, index) -> f32
      %189 = "affine.load"(%180) <{map = #map1}> : (memref<1xf32>) -> f32
      %190 = "arith.addf"(%188, %189) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%190, %arg92, %arg93) <{map = #map}> : (f32, memref<100xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "vector_forwarding"}> ({
  ^bb0(%arg88: memref<512xf32>, %arg89: memref<512xf32>):
    %177 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg90: index):
      %178 = "affine.vector_load"(%arg88, %arg90) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      "affine.vector_store"(%178, %177, %arg90) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      %179 = "affine.vector_load"(%177, %arg90) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      "affine.vector_store"(%179, %arg89, %arg90) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "vector_no_forwarding"}> ({
  ^bb0(%arg85: memref<512xf32>, %arg86: memref<512xf32>):
    %174 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg87: index):
      %175 = "affine.vector_load"(%arg85, %arg87) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      "affine.vector_store"(%175, %174, %arg87) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      %176 = "affine.vector_load"(%174, %arg87) <{map = #map11}> : (memref<512xf32>, index) -> vector<16xf32>
      "affine.vector_store"(%176, %arg86, %arg87) <{map = #map11}> : (vector<16xf32>, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "simple_three_loads"}> ({
  ^bb0(%arg83: memref<10xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg84: index):
      %169 = "affine.load"(%arg83, %arg84) <{map = #map}> : (memref<10xf32>, index) -> f32
      %170 = "affine.load"(%arg83, %arg84) <{map = #map}> : (memref<10xf32>, index) -> f32
      %171 = "arith.addf"(%169, %170) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %172 = "affine.load"(%arg83, %arg84) <{map = #map}> : (memref<10xf32>, index) -> f32
      %173 = "arith.addf"(%171, %172) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "nested_loads_const_index"}> ({
  ^bb0(%arg79: memref<10xf32>):
    %165 = "arith.constant"() <{value = 0 : index}> : () -> index
    %166 = "affine.load"(%arg79, %165) <{map = #map}> : (memref<10xf32>, index) -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg80: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map14}> ({
      ^bb0(%arg81: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map13}> ({
        ^bb0(%arg82: index):
          %167 = "affine.load"(%arg79, %165) <{map = #map}> : (memref<10xf32>, index) -> f32
          %168 = "arith.addf"(%166, %167) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<10xf32>) -> (), sym_name = "nested_loads"}> ({
  ^bb0(%arg75: index, %arg76: memref<10xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg77: index):
      %162 = "affine.load"(%arg76, %arg77) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.for"(%arg75) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg78: index):
        %163 = "affine.load"(%arg76, %arg77) <{map = #map}> : (memref<10xf32>, index) -> f32
        %164 = "arith.addf"(%162, %163) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "nested_loads_different_memref_accesses_no_cse"}> ({
  ^bb0(%arg72: memref<10xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg73: index):
      %159 = "affine.load"(%arg72, %arg73) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map14}> ({
      ^bb0(%arg74: index):
        %160 = "affine.load"(%arg72, %arg74) <{map = #map}> : (memref<10xf32>, index) -> f32
        %161 = "arith.addf"(%159, %160) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "load_load_store"}> ({
  ^bb0(%arg70: memref<10xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg71: index):
      %156 = "affine.load"(%arg70, %arg71) <{map = #map}> : (memref<10xf32>, index) -> f32
      %157 = "affine.load"(%arg70, %arg71) <{map = #map}> : (memref<10xf32>, index) -> f32
      %158 = "arith.addf"(%156, %157) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%158, %arg70, %arg71) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<10xf32>) -> (), sym_name = "load_load_store_2_loops_no_cse"}> ({
  ^bb0(%arg66: index, %arg67: memref<10xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg68: index):
      %153 = "affine.load"(%arg67, %arg68) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.for"(%arg66) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg69: index):
        %154 = "affine.load"(%arg67, %arg68) <{map = #map}> : (memref<10xf32>, index) -> f32
        %155 = "arith.addf"(%153, %154) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%155, %arg67, %arg68) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "load_load_store_3_loops_no_cse"}> ({
  ^bb0(%arg62: memref<10xf32>):
    %149 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg63: index):
      %150 = "affine.load"(%arg62, %arg63) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map14}> ({
      ^bb0(%arg64: index):
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map13}> ({
        ^bb0(%arg65: index):
          %151 = "affine.load"(%arg62, %arg63) <{map = #map}> : (memref<10xf32>, index) -> f32
          %152 = "arith.addf"(%150, %151) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.store"(%149, %arg62, %arg63) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "load_load_store_3_loops"}> ({
  ^bb0(%arg58: memref<10xf32>):
    %145 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg59: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map14}> ({
      ^bb0(%arg60: index):
        %146 = "affine.load"(%arg58, %arg59) <{map = #map}> : (memref<10xf32>, index) -> f32
        "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map13}> ({
        ^bb0(%arg61: index):
          %147 = "affine.load"(%arg58, %arg59) <{map = #map}> : (memref<10xf32>, index) -> f32
          %148 = "arith.addf"(%146, %147) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
          "affine.yield"() : () -> ()
        }) : () -> ()
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.store"(%145, %arg58, %arg59) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10xf32>) -> (), sym_name = "loads_in_sibling_loops_const_index_no_cse"}> ({
  ^bb0(%arg55: memref<10xf32>):
    %141 = "arith.constant"() <{value = 0 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg57: index):
      %144 = "affine.load"(%arg55, %141) <{map = #map}> : (memref<10xf32>, index) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg56: index):
      %142 = "affine.load"(%arg55, %141) <{map = #map}> : (memref<10xf32>, index) -> f32
      %143 = "arith.addf"(%142, %142) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10x10xf32>) -> (), sym_name = "load_load_affine_apply"}> ({
  ^bb0(%arg52: memref<10x10xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
    ^bb0(%arg53: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg54: index):
        %134 = "affine.apply"(%arg53, %arg54) <{map = #map3}> : (index, index) -> index
        %135 = "affine.apply"(%arg53, %arg54) <{map = #map4}> : (index, index) -> index
        %136 = "affine.apply"(%134, %135) <{map = #map5}> : (index, index) -> index
        %137 = "affine.apply"(%134, %135) <{map = #map6}> : (index, index) -> index
        %138 = "affine.load"(%arg52, %136, %137) <{map = #map7}> : (memref<10x10xf32>, index, index) -> f32
        %139 = "affine.load"(%arg52, %arg53, %arg54) <{map = #map7}> : (memref<10x10xf32>, index, index) -> f32
        %140 = "arith.addf"(%138, %139) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "vector_loads"}> ({
  ^bb0(%arg49: memref<512xf32>, %arg50: memref<512xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg51: index):
      %131 = "affine.vector_load"(%arg49, %arg51) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      %132 = "affine.vector_load"(%arg49, %arg51) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      %133 = "arith.addf"(%131, %132) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
      "affine.vector_store"(%132, %arg50, %arg51) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "vector_loads_no_cse"}> ({
  ^bb0(%arg46: memref<512xf32>, %arg47: memref<512xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg48: index):
      %129 = "affine.vector_load"(%arg46, %arg48) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      %130 = "affine.vector_load"(%arg46, %arg48) <{map = #map11}> : (memref<512xf32>, index) -> vector<16xf32>
      "affine.vector_store"(%130, %arg47, %arg48) <{map = #map11}> : (vector<16xf32>, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "vector_load_store_load_no_cse"}> ({
  ^bb0(%arg43: memref<512xf32>, %arg44: memref<512xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg45: index):
      %126 = "affine.vector_load"(%arg43, %arg45) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      "affine.vector_store"(%126, %arg43, %arg45) <{map = #map15}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      %127 = "affine.vector_load"(%arg43, %arg45) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      %128 = "arith.addf"(%126, %127) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
      "affine.vector_store"(%127, %arg44, %arg45) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<1xf32>, sym_name = "reduction_multi_store"}> ({
    %120 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %121 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %122 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    "affine.store"(%121, %120) <{map = #map1}> : (f32, memref<1xf32>) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 2 : index, upperBoundMap = #map10}> ({
    ^bb0(%arg42: index):
      %123 = "affine.load"(%120) <{map = #map1}> : (memref<1xf32>) -> f32
      %124 = "arith.addf"(%123, %122) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%124, %120) <{map = #map1}> : (f32, memref<1xf32>) -> ()
      %125 = "affine.load"(%120) <{map = #map1}> : (memref<1xf32>) -> f32
      "test.foo"(%125) : (f32) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"(%120) : (memref<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "vector_load_affine_apply_store_load"}> ({
  ^bb0(%arg39: memref<512xf32>, %arg40: memref<512xf32>):
    %115 = "arith.constant"() <{value = 1 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map16}> ({
    ^bb0(%arg41: index):
      %116 = "affine.vector_load"(%arg39, %arg41) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      %117 = "affine.apply"(%arg41) <{map = #map9}> : (index) -> index
      "affine.vector_store"(%116, %arg39, %117) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      %118 = "affine.vector_load"(%arg39, %arg41) <{map = #map11}> : (memref<512xf32>, index) -> vector<32xf32>
      %119 = "arith.addf"(%116, %118) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
      "affine.vector_store"(%118, %arg40, %arg41) <{map = #map11}> : (vector<32xf32>, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "external_no_forward_load"}> ({
  ^bb0(%arg36: memref<512xf32>, %arg37: memref<512xf32>):
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg38: index):
      %113 = "affine.load"(%arg36, %arg38) <{map = #map11}> : (memref<512xf32>, index) -> f32
      "affine.store"(%113, %arg37, %arg38) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "memop"(%arg36, %arg37) : (memref<512xf32>, memref<512xf32>) -> ()
      %114 = "affine.load"(%arg36, %arg38) <{map = #map11}> : (memref<512xf32>, index) -> f32
      "affine.store"(%114, %arg37, %arg38) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "external_no_forward_store"}> ({
  ^bb0(%arg33: memref<512xf32>, %arg34: memref<512xf32>):
    %111 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg35: index):
      "affine.store"(%111, %arg33, %arg35) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "memop"(%arg33, %arg34) : (memref<512xf32>, memref<512xf32>) -> ()
      %112 = "affine.load"(%arg33, %arg35) <{map = #map11}> : (memref<512xf32>, index) -> f32
      "affine.store"(%112, %arg34, %arg35) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>, memref<512xf32>) -> (), sym_name = "no_forward_cast"}> ({
  ^bb0(%arg30: memref<512xf32>, %arg31: memref<512xf32>):
    %107 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %108 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %109 = "memref.cast"(%arg30) : (memref<512xf32>) -> memref<?xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg32: index):
      "affine.store"(%107, %arg30, %arg32) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.store"(%108, %109, %arg32) <{map = #map11}> : (f32, memref<?xf32>, index) -> ()
      %110 = "affine.load"(%arg30, %arg32) <{map = #map11}> : (memref<512xf32>, index) -> f32
      "affine.store"(%110, %arg31, %arg32) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> f32, sym_name = "overlap_no_fwd"}> ({
  ^bb0(%arg27: index):
    %99 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %100 = "arith.constant"() <{value = 9.000000e+00 : f32}> : () -> f32
    %101 = "arith.constant"() <{value = 0 : index}> : () -> index
    %102 = "arith.constant"() <{value = 1 : index}> : () -> index
    %103 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map18}> ({
    ^bb0(%arg28: index):
      "affine.store"(%99, %103, %arg28) <{map = #map17}> : (f32, memref<10xf32>, index) -> ()
      "affine.for"(%arg27) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = #map8}> ({
      ^bb0(%arg29: index):
        %105 = "affine.load"(%103, %arg28) <{map = #map17}> : (memref<10xf32>, index) -> f32
        %106 = "arith.addf"(%105, %105) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%100, %103, %arg28) <{map = #map9}> : (f32, memref<10xf32>, index) -> ()
        "affine.yield"() : () -> ()
      }) : (index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    %104 = "affine.load"(%103, %102) <{map = #map}> : (memref<10xf32>, index) -> f32
    "func.return"(%104) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>) -> (), sym_name = "redundant_store_elim"}> ({
  ^bb0(%arg25: memref<512xf32>):
    %97 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %98 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg26: index):
      "affine.store"(%97, %arg25, %arg26) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.store"(%98, %arg25, %arg26) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>) -> (), sym_name = "redundant_store_elim_nonintervening"}> ({
  ^bb0(%arg23: memref<512xf32>):
    %94 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %95 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512xf32>
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg24: index):
      "affine.store"(%94, %95, %arg24) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      %96 = "affine.load"(%arg23, %arg24) <{map = #map11}> : (memref<512xf32>, index) -> f32
      "affine.store"(%96, %95, %arg24) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<512xf32>) -> (), sym_name = "redundant_store_elim_fail"}> ({
  ^bb0(%arg21: memref<512xf32>):
    %92 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %93 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map12}> ({
    ^bb0(%arg22: index):
      "affine.store"(%92, %arg21, %arg22) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "test.use"(%arg21) : (memref<512xf32>) -> ()
      "affine.store"(%93, %arg21, %arg22) <{map = #map11}> : (f32, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf64>, memref<?xf64>, i1) -> (), sym_name = "with_inner_ops"}> ({
  ^bb0(%arg17: memref<?xf64>, %arg18: memref<?xf64>, %arg19: i1):
    %87 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %88 = "arith.constant"() <{value = 3.140000e+00 : f64}> : () -> f64
    %89 = "arith.constant"() <{value = 1.000000e+00 : f64}> : () -> f64
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map19}> ({
    ^bb0(%arg20: index):
      "affine.store"(%87, %arg18, %arg20) <{map = #map}> : (f64, memref<?xf64>, index) -> ()
      "affine.store"(%88, %arg18, %arg20) <{map = #map}> : (f64, memref<?xf64>, index) -> ()
      %90 = "scf.if"(%arg19) ({
        "scf.yield"(%89) : (f64) -> ()
      }, {
        %91 = "affine.load"(%arg18, %arg20) <{map = #map}> : (memref<?xf64>, index) -> f64
        "scf.yield"(%91) : (f64) -> ()
      }) : (i1) -> f64
      "affine.store"(%90, %arg17, %arg20) <{map = #map}> : (f64, memref<?xf64>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x4094x510x1xf32>, memref<4x4x1x64xf32>, memref<1x2046x254x1x64xf32>) -> (), sym_name = "affine_store_load_in_scope"}> ({
  ^bb0(%arg13: memref<1x4094x510x1xf32>, %arg14: memref<4x4x1x64xf32>, %arg15: memref<1x2046x254x1x64xf32>):
    %62 = "arith.constant"() <{value = 0 : index}> : () -> index
    %63 = "arith.constant"() <{value = 1 : index}> : () -> index
    %64 = "arith.constant"() <{value = 2 : index}> : () -> index
    %65 = "arith.constant"() <{value = 64 : index}> : () -> index
    %66 = "arith.constant"() <{value = 768 : index}> : () -> index
    "scf.for"(%62, %66, %63) ({
    ^bb0(%arg16: index):
      %67 = "arith.remsi"(%arg16, %65) : (index, index) -> index
      %68 = "arith.divsi"(%arg16, %65) : (index, index) -> index
      %69 = "arith.remsi"(%68, %64) : (index, index) -> index
      %70 = "arith.divsi"(%68, %64) : (index, index) -> index
      "test.affine_scope"() ({
        %71 = "arith.muli"(%70, %64) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %72 = "arith.addi"(%64, %71) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %73 = "arith.addi"(%72, %62) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %74 = "arith.muli"(%69, %64) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %75 = "arith.addi"(%64, %74) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %76 = "affine.load"(%arg13, %73, %75) <{map = #map20}> : (memref<1x4094x510x1xf32>, index, index) -> f32
        %77 = "affine.load"(%arg14, %67) <{map = #map21}> : (memref<4x4x1x64xf32>, index) -> f32
        %78 = "affine.load"(%arg15, %70, %69, %67) <{map = #map22}> : (memref<1x2046x254x1x64xf32>, index, index, index) -> f32
        %79 = "arith.mulf"(%76, %77) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %80 = "arith.addf"(%78, %79) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%80, %arg15, %70, %69, %67) <{map = #map22}> : (f32, memref<1x2046x254x1x64xf32>, index, index, index) -> ()
        %81 = "arith.addi"(%75, %63) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %82 = "affine.load"(%arg13, %73, %81) <{map = #map20}> : (memref<1x4094x510x1xf32>, index, index) -> f32
        %83 = "affine.load"(%arg14, %67) <{map = #map23}> : (memref<4x4x1x64xf32>, index) -> f32
        %84 = "affine.load"(%arg15, %70, %69, %67) <{map = #map22}> : (memref<1x2046x254x1x64xf32>, index, index, index) -> f32
        %85 = "arith.mulf"(%82, %83) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %86 = "arith.addf"(%84, %85) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "terminate"() : () -> ()
      }) : () -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<1xf32>, sym_name = "affine_load_store_in_different_scopes"}> ({
    %58 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %59 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %60 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    "affine.store"(%59, %58) <{map = #map1}> : (f32, memref<1xf32>) -> ()
    "test.affine_scope"() ({
      "affine.store"(%60, %58) <{map = #map1}> : (f32, memref<1xf32>) -> ()
      "test.terminate"() : () -> ()
    }) : () -> ()
    %61 = "affine.load"(%58) <{map = #map1}> : (memref<1xf32>) -> f32
    "func.return"(%58) : (memref<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> memref<1xf32>, sym_name = "no_forwarding_across_scopes"}> ({
    %50 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %51 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %52 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %53 = "arith.constant"() <{value = 0 : index}> : () -> index
    %54 = "arith.constant"() <{value = 100 : index}> : () -> index
    %55 = "arith.constant"() <{value = 1 : index}> : () -> index
    "affine.store"(%51, %50) <{map = #map1}> : (f32, memref<1xf32>) -> ()
    "test.affine_scope"() ({
      %56 = "affine.load"(%50) <{map = #map1}> : (memref<1xf32>) -> f32
      %57 = "arith.addf"(%56, %52) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.store"(%57, %50) <{map = #map1}> : (f32, memref<1xf32>) -> ()
      "terminator"() : () -> ()
    }) : () -> ()
    "func.return"(%50) : (memref<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "parallel_store_load"}> ({
    %46 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %47 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map1, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map2}> ({
    ^bb0(%arg12: index):
      "affine.store"(%46, %47, %arg12) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      %48 = "affine.load"(%47, %arg12) <{map = #map}> : (memref<10xf32>, index) -> f32
      %49 = "arith.addf"(%48, %48) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%47) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> (), sym_name = "non_constant_parallel_store_load"}> ({
  ^bb0(%arg10: index):
    %42 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %43 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10xf32>
    "affine.parallel"(%arg10) <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map1, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map}> ({
    ^bb0(%arg11: index):
      "affine.store"(%42, %43, %arg11) <{map = #map}> : (f32, memref<10xf32>, index) -> ()
      %44 = "affine.load"(%43, %arg11) <{map = #map}> : (memref<10xf32>, index) -> f32
      %45 = "arith.addf"(%44, %44) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"() : () -> ()
    }) : (index) -> ()
    "memref.dealloc"(%43) : (memref<10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "parallel_surrounding_for"}> ({
    %38 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %39 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x10xf32>
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map1, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map2}> ({
    ^bb0(%arg8: index):
      "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg9: index):
        "affine.store"(%38, %39, %arg8, %arg9) <{map = #map7}> : (f32, memref<10x10xf32>, index, index) -> ()
        %40 = "affine.load"(%39, %arg8, %arg9) <{map = #map7}> : (memref<10x10xf32>, index, index) -> f32
        %41 = "arith.addf"(%40, %40) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"() : () -> ()
      }) : () -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "memref.dealloc"(%39) : (memref<10x10xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "dead_affine_region_op"}> ({
    %34 = "arith.constant"() <{value = 1 : index}> : () -> index
    %35 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<15xi1>
    %36 = "arith.constant"() <{value = true}> : () -> i1
    "affine.store"(%36, %35, %34) <{map = #map}> : (i1, memref<15xi1>, index) -> ()
    "affine.store"(%36, %35, %34) <{map = #map}> : (i1, memref<15xi1>, index) -> ()
    "affine.if"(%34, %34, %34, %34) <{condition = #set}> ({
      %37 = "affine.load"(%35, %34) <{map = #map}> : (memref<15xi1>, index) -> i1
      "affine.yield"() : () -> ()
    }, {
    }) : (index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "cross_block"}> ({
    %27 = "arith.constant"() <{value = 10 : index}> : () -> index
    %28 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x13xf32>
    %29 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<13xi1>
    %30 = "arith.constant"() <{value = true}> : () -> i1
    "affine.store"(%30, %29, %27) <{map = #map}> : (i1, memref<13xi1>, index) -> ()
    %31 = "arith.constant"() <{value = true}> : () -> i1
    "affine.store"(%31, %29, %27) <{map = #map}> : (i1, memref<13xi1>, index) -> ()
    "cf.br"(%28)[^bb1] : (memref<1x13xf32>) -> ()
  ^bb1(%32: memref<1x13xf32>):  // pred: ^bb0
    %33 = "affine.load"(%29, %27) <{map = #map}> : (memref<13xi1>, index) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "consecutive_store"}> ({
    %24 = "arith.constant"() <{value = 1.099610e+00 : f16}> : () -> f16
    %25 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f16, 1>
    "affine.for"() <{lowerBoundMap = #map25, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map26}> ({
    ^bb0(%arg6: index):
      "affine.for"(%arg6, %arg6) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 1, 1, 0>, step = 4 : index, upperBoundMap = #map}> ({
      ^bb0(%arg7: index):
        "affine.store"(%24, %25) <{map = #map24}> : (f16, memref<f16, 1>) -> ()
        "affine.store"(%24, %25) <{map = #map24}> : (f16, memref<f16, 1>) -> ()
        %26 = "affine.load"(%25) <{map = #map24}> : (memref<f16, 1>) -> f16
        "affine.yield"() : () -> ()
      }) : (index, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32>, i32) -> i32, sym_name = "scf_for_if"}> ({
  ^bb0(%arg3: memref<?xi32>, %arg4: i32):
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index
    %12 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %13 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %14 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %15 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xi32>
    %16 = "llvm.mlir.undef"() : () -> i32
    "affine.store"(%16, %15) <{map = #map1}> : (i32, memref<1xi32>) -> ()
    "affine.store"(%12, %15) <{map = #map1}> : (i32, memref<1xi32>) -> ()
    %17 = "arith.index_cast"(%arg4) : (i32) -> index
    "scf.for"(%11, %17, %10) ({
    ^bb0(%arg5: index):
      %19 = "memref.load"(%arg3, %arg5) : (memref<?xi32>, index) -> i32
      %20 = "arith.muli"(%19, %13) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %21 = "arith.cmpi"(%20, %14) <{predicate = 4 : i64}> : (i32, i32) -> i1
      "scf.if"(%21) ({
        %22 = "affine.load"(%15) <{map = #map1}> : (memref<1xi32>) -> i32
        %23 = "arith.addi"(%20, %22) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        "affine.store"(%23, %15) <{map = #map1}> : (i32, memref<1xi32>) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %18 = "affine.load"(%15) <{map = #map1}> : (memref<1xi32>) -> i32
    "func.return"(%18) : (i32) -> ()
  }) {llvm.linkage = #llvm.linkage<external>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "zero_d_memrefs"}> ({
    %6 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %7 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i32>
    "affine.store"(%6, %7) <{map = #map24}> : (i32, memref<i32>) -> ()
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map27}> ({
    ^bb0(%arg2: index):
      %8 = "affine.load"(%7) <{map = #map24}> : (memref<i32>) -> i32
      %9 = "arith.addi"(%8, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<20x1xi64>) -> (), sym_name = "vector_store_dead_elim_different_types"}> ({
  ^bb0(%arg1: memref<20x1xi64>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = dense<1> : vector<5xi64>}> : () -> vector<5xi64>
    %5 = "arith.constant"() <{value = dense<2> : vector<1xi64>}> : () -> vector<1xi64>
    "affine.vector_store"(%4, %arg1, %3) <{map = #map28}> : (vector<5xi64>, memref<20x1xi64>, index) -> ()
    "affine.vector_store"(%5, %arg1, %3) <{map = #map28}> : (vector<1xi64>, memref<20x1xi64>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<20x1xi64>) -> (), sym_name = "vector_store_dead_elim_same_type"}> ({
  ^bb0(%arg0: memref<20x1xi64>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = dense<1> : vector<5xi64>}> : () -> vector<5xi64>
    %2 = "arith.constant"() <{value = dense<2> : vector<5xi64>}> : () -> vector<5xi64>
    "affine.vector_store"(%1, %arg0, %0) <{map = #map28}> : (vector<5xi64>, memref<20x1xi64>, index) -> ()
    "affine.vector_store"(%2, %arg0, %0) <{map = #map28}> : (vector<5xi64>, memref<20x1xi64>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

