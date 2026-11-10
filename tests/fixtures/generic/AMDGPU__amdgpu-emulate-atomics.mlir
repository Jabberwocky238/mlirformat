"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, memref<?xf32>, i32) -> f32, sym_name = "atomic_fmax"}> ({
  ^bb0(%arg0: f32, %arg1: memref<?xf32>, %arg2: i32):
    "gpu.printf"() <{format = "Begin\0A"}> : () -> ()
    %0 = "amdgpu.raw_buffer_atomic_fmax"(%arg0, %arg1, %arg2) <{boundsCheck = true, indexOffset = 4 : i32, operandSegmentSizes = array<i32: 1, 1, 1, 0>}> {foo} : (f32, memref<?xf32>, i32) -> f32
    "gpu.printf"() <{format = "End\0A"}> : () -> ()
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64, memref<?xf64>, i32) -> (), sym_name = "atomic_fmax_f64"}> ({
  ^bb0(%arg0: f64, %arg1: memref<?xf64>, %arg2: i32):
    "gpu.printf"() <{format = "Begin\0A"}> : () -> ()
    %0 = "amdgpu.raw_buffer_atomic_fmax"(%arg0, %arg1, %arg2) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 1, 1, 0>}> : (f64, memref<?xf64>, i32) -> f64
    "gpu.printf"() <{format = "End\0A"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, memref<?xf32>, i32) -> (), sym_name = "atomic_fadd"}> ({
  ^bb0(%arg6: f32, %arg7: memref<?xf32>, %arg8: i32):
    %2 = "amdgpu.raw_buffer_atomic_fadd"(%arg6, %arg7, %arg8) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 1, 1, 0>}> : (f32, memref<?xf32>, i32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, memref<?xf16>, i32) -> (), sym_name = "atomic_fadd_v2f16"}> ({
  ^bb0(%arg3: vector<2xf16>, %arg4: memref<?xf16>, %arg5: i32):
    %1 = "amdgpu.raw_buffer_atomic_fadd"(%arg3, %arg4, %arg5) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 1, 1, 0>}> : (vector<2xf16>, memref<?xf16>, i32) -> vector<2xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, memref<?xbf16>, i32) -> (), sym_name = "atomic_fadd_v2bf16"}> ({
  ^bb0(%arg0: vector<2xbf16>, %arg1: memref<?xbf16>, %arg2: i32):
    %0 = "amdgpu.raw_buffer_atomic_fadd"(%arg0, %arg1, %arg2) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 1, 1, 0>}> : (vector<2xbf16>, memref<?xbf16>, i32) -> vector<2xbf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

