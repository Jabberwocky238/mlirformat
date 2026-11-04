#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vecdim_reduction"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.addf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) : (f32) -> f32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vecdim_reduction_minf"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 0x7F800000 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.minimumf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) : (f32) -> f32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vecdim_reduction_maxf"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 0xFF800000 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.maximumf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) : (f32) -> f32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xi32>, memref<256xi32>) -> (), sym_name = "vecdim_reduction_minsi"}> ({
  ^bb0(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>):
    %0 = "arith.constant"() <{value = 2147483647 : i32}> : () -> i32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: i32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xi32>, index, index) -> i32
        %3 = "arith.minsi"(%arg4, %2) : (i32, i32) -> i32
        "affine.yield"(%3) : (i32) -> ()
      }) : (i32) -> i32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (i32, memref<256xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xi32>, memref<256xi32>) -> (), sym_name = "vecdim_reduction_maxsi"}> ({
  ^bb0(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>):
    %0 = "arith.constant"() <{value = -2147483648 : i32}> : () -> i32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: i32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xi32>, index, index) -> i32
        %3 = "arith.maxsi"(%arg4, %2) : (i32, i32) -> i32
        "affine.yield"(%3) : (i32) -> ()
      }) : (i32) -> i32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (i32, memref<256xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xi32>, memref<256xi32>) -> (), sym_name = "vecdim_reduction_minui"}> ({
  ^bb0(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>):
    %0 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: i32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xi32>, index, index) -> i32
        %3 = "arith.minui"(%arg4, %2) : (i32, i32) -> i32
        "affine.yield"(%3) : (i32) -> ()
      }) : (i32) -> i32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (i32, memref<256xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xi32>, memref<256xi32>) -> (), sym_name = "vecdim_reduction_maxui"}> ({
  ^bb0(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: i32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xi32>, index, index) -> i32
        %3 = "arith.maxui"(%arg4, %2) : (i32, i32) -> i32
        "affine.yield"(%3) : (i32) -> ()
      }) : (i32) -> i32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (i32, memref<256xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xi32>, memref<256xi32>) -> (), sym_name = "vecdim_reduction_andi"}> ({
  ^bb0(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>):
    %0 = "arith.constant"() <{value = -1 : i32}> : () -> i32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: i32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xi32>, index, index) -> i32
        %3 = "arith.andi"(%arg4, %2) : (i32, i32) -> i32
        "affine.yield"(%3) : (i32) -> ()
      }) : (i32) -> i32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (i32, memref<256xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xi32>, memref<256xi32>) -> (), sym_name = "vecdim_reduction_ori"}> ({
  ^bb0(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: i32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xi32>, index, index) -> i32
        %3 = "arith.ori"(%arg4, %2) : (i32, i32) -> i32
        "affine.yield"(%3) : (i32) -> ()
      }) : (i32) -> i32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (i32, memref<256xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xi32>, memref<256xi32>) -> (), sym_name = "vecdim_reduction_xori"}> ({
  ^bb0(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: i32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xi32>, index, index) -> i32
        %3 = "arith.xori"(%arg4, %2) : (i32, i32) -> i32
        "affine.yield"(%3) : (i32) -> ()
      }) : (i32) -> i32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (i32, memref<256xi32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vecdim_reduction_minnumf"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 0xFF800000 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.minnumf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) : (f32) -> f32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vecdim_reduction_maxnumf"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 0xFF800000 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.maxnumf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) : (f32) -> f32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vecdim_reduction_comm"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.addf"(%2, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) : (f32) -> f32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vecdim_reduction_expsin"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "math.sin"(%2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        %4 = "math.exp"(%3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        %5 = "arith.addf"(%arg4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%5) : (f32) -> ()
      }) : (f32) -> f32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>, memref<256xf32>) -> (), sym_name = "two_vecdim_reductions"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg3: index):
      %1:2 = "affine.for"(%0, %0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 2>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index, %arg5: f32, %arg6: f32):
        %2 = "affine.load"(%arg0, %arg3, %arg4) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.addf"(%arg5, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %4 = "arith.mulf"(%arg6, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3, %4) : (f32, f32) -> ()
      }) : (f32, f32) -> (f32, f32)
      "affine.store"(%1#0, %arg1, %arg3) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.store"(%1#1, %arg2, %arg3) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xi64>, memref<256xi64>, memref<256xi64>) -> (), sym_name = "two_vecdim_reductions_int"}> ({
  ^bb0(%arg0: memref<256x512xi64>, %arg1: memref<256xi64>, %arg2: memref<256xi64>):
    %0 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg3: index):
      %2:2 = "affine.for"(%0, %1) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 2>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index, %arg5: i64, %arg6: i64):
        %3 = "affine.load"(%arg0, %arg3, %arg4) <{map = #map}> : (memref<256x512xi64>, index, index) -> i64
        %4 = "arith.addi"(%arg5, %3) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
        %5 = "arith.muli"(%arg6, %3) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
        "affine.yield"(%4, %5) : (i64, i64) -> ()
      }) : (i64, i64) -> (i64, i64)
      "affine.store"(%2#0, %arg1, %arg3) <{map = #map3}> : (i64, memref<256xi64>, index) -> ()
      "affine.store"(%2#1, %arg2, %arg3) <{map = #map3}> : (i64, memref<256xi64>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (256)>
#map3 = affine_map<() -> (512)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<1xf32>) -> (), sym_name = "vecdim_reduction_nested"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<1xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map3}> ({
    ^bb0(%arg2: index, %arg3: f32):
      %2 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index, %arg5: f32):
        %4 = "affine.load"(%arg0, %arg4, %arg2) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %5 = "arith.addf"(%arg5, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%5) : (f32) -> ()
      }) : (f32) -> f32
      %3 = "arith.addf"(%arg3, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"(%3) : (f32) -> ()
    }) : (f32) -> f32
    "affine.store"(%1, %arg1) <{map = #map1}> : (f32, memref<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>, memref<256xf32>, memref<256x512xf32>) -> (), sym_name = "vecdim_partial_sums_1_rejected"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>, %arg3: memref<256x512xf32>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg4: index):
      %1:2 = "affine.for"(%0, %0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 2>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg5: index, %arg6: f32, %arg7: f32):
        %2 = "affine.load"(%arg0, %arg4, %arg5) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.addf"(%arg6, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %4 = "arith.mulf"(%arg7, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.store"(%3, %arg3, %arg4, %arg5) <{map = #map}> : (f32, memref<256x512xf32>, index, index) -> ()
        "affine.yield"(%3, %4) : (f32, f32) -> ()
      }) : (f32, f32) -> (f32, f32)
      "affine.store"(%1#0, %arg1, %arg4) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.store"(%1#1, %arg2, %arg4) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>, memref<256xf32>, memref<256x512xf32>) -> (), sym_name = "vecdim_partial_sums_2_rejected"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>, %arg3: memref<256x512xf32>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg4: index):
      %1:2 = "affine.for"(%0, %0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 2>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg5: index, %arg6: f32, %arg7: f32):
        "affine.store"(%arg6, %arg3, %arg4, %arg5) <{map = #map}> : (f32, memref<256x512xf32>, index, index) -> ()
        %2 = "affine.load"(%arg0, %arg4, %arg5) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.addf"(%arg6, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %4 = "arith.mulf"(%arg7, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3, %4) : (f32, f32) -> ()
      }) : (f32, f32) -> (f32, f32)
      "affine.store"(%1#0, %arg1, %arg4) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.store"(%1#1, %arg2, %arg4) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (512)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vecdim_unknown_reduction_rejected"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "affine.for"(%0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg2: index, %arg3: f32):
      %2 = "arith.addf"(%arg3, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "affine.yield"(%2) : (f32) -> ()
    }) : (f32) -> f32
    "affine.store"(%1, %arg1) <{map = #map}> : (f32, memref<256xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (512)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vecdim_none_reduction_rejected"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "affine.for"(%0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg2: index, %arg3: f32):
      "affine.yield"(%arg3) : (f32) -> ()
    }) : (f32) -> f32
    "affine.store"(%1, %arg1) <{map = #map}> : (f32, memref<256xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (500)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vecdim_reduction_masked"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.addf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) : (f32) -> f32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<()[s0] -> (s0)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>, index) -> (), sym_name = "vecdim_reduction_masked_unknown_ub"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg3: index):
      %1 = "affine.for"(%arg2, %0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 1, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index, %arg5: f32):
        %2 = "affine.load"(%arg0, %arg3, %arg4) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.addf"(%arg5, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) : (index, f32) -> f32
      "affine.store"(%1, %arg1, %arg3) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (127)>
#map2 = affine_map<() -> (511)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>) -> (), sym_name = "vecdim_reduction_nonzero_lb"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg2: index):
      %1 = "affine.for"(%0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.addf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) : (f32) -> f32
      "affine.store"(%1, %arg1, %arg2) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<()[s0] -> (s0)>
#map2 = affine_map<() -> (512)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (0)>
#map5 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>, index) -> (), sym_name = "vecdim_reduction_masked_unknown_lb"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>, %arg2: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map4, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg3: index):
      %1 = "affine.for"(%arg2, %0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 1, 0, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg4: index, %arg5: f32):
        %2 = "affine.load"(%arg0, %arg3, %arg4) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.addf"(%arg5, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) : (index, f32) -> f32
      "affine.store"(%1, %arg1, %arg3) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<(d0, d1) -> (d0, d1 * 2)>
#map3 = affine_map<(d0) -> (d0)>
#map4 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<256xf32>, index, index) -> (), sym_name = "vecdim_reduction_complex_ub"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>, %arg2: index, %arg3: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map4}> ({
    ^bb0(%arg4: index):
      %1 = "affine.for"(%arg2, %arg3, %0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 2, 1>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg5: index, %arg6: f32):
        %2 = "affine.load"(%arg0, %arg4, %arg5) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "arith.addf"(%arg6, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%3) : (f32) -> ()
      }) : (index, index, f32) -> f32
      "affine.store"(%1, %arg1, %arg4) <{map = #map3}> : (f32, memref<256xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<() -> (0)>
#map2 = affine_map<() -> (500)>
#map3 = affine_map<(d0) -> (d0 * 2)>
#map4 = affine_map<(d0) -> (d0 * 2 + 1)>
#map5 = affine_map<() -> (256)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<256x512xf32>, memref<512xf32>) -> (), sym_name = "vecdim_two_reductions_masked"}> ({
  ^bb0(%arg0: memref<256x512xf32>, %arg1: memref<512xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "affine.for"() <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map5}> ({
    ^bb0(%arg2: index):
      %1:2 = "affine.for"(%0, %0) <{lowerBoundMap = #map1, operandSegmentSizes = array<i32: 0, 0, 2>, step = 1 : index, upperBoundMap = #map2}> ({
      ^bb0(%arg3: index, %arg4: f32, %arg5: f32):
        %2 = "affine.load"(%arg0, %arg2, %arg3) <{map = #map}> : (memref<256x512xf32>, index, index) -> f32
        %3 = "math.exp"(%2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
        %4 = "arith.addf"(%arg4, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %5 = "arith.addf"(%arg5, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "affine.yield"(%4, %5) : (f32, f32) -> ()
      }) : (f32, f32) -> (f32, f32)
      "affine.store"(%1#0, %arg1, %arg2) <{map = #map3}> : (f32, memref<512xf32>, index) -> ()
      "affine.store"(%1#1, %arg1, %arg2) <{map = #map4}> : (f32, memref<512xf32>, index) -> ()
      "affine.yield"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

