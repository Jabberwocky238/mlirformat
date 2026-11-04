"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xvector<8xf32>>, memref<4xvector<8xi32>>, memref<?xf32>, memref<1xvector<8xf32>>) -> (), sym_name = "spmv8x8"}> ({
  ^bb0(%arg3: memref<4xvector<8xf32>>, %arg4: memref<4xvector<8xi32>>, %arg5: memref<?xf32>, %arg6: memref<1xvector<8xf32>>):
    %82 = "arith.constant"() <{value = 0 : index}> : () -> index
    %83 = "arith.constant"() <{value = 1 : index}> : () -> index
    %84 = "arith.constant"() <{value = 4 : index}> : () -> index
    %85 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %86 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 8>}> : () -> vector<8xi1>
    %87 = "vector.broadcast"(%85) : (f32) -> vector<8xf32>
    %88 = "memref.load"(%arg6, %82) : (memref<1xvector<8xf32>>, index) -> vector<8xf32>
    %89 = "scf.for"(%82, %84, %83, %88) ({
    ^bb0(%arg7: index, %arg8: vector<8xf32>):
      %90 = "memref.load"(%arg3, %arg7) : (memref<4xvector<8xf32>>, index) -> vector<8xf32>
      %91 = "memref.load"(%arg4, %arg7) : (memref<4xvector<8xi32>>, index) -> vector<8xi32>
      %92 = "vector.gather"(%arg5, %82, %91, %86, %87) : (memref<?xf32>, index, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
      %93 = "vector.fma"(%90, %92, %arg8) : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
      "scf.yield"(%93) : (vector<8xf32>) -> ()
    }) : (index, index, index, vector<8xf32>) -> vector<8xf32>
    "memref.store"(%89, %arg6, %82) : (vector<8xf32>, memref<1xvector<8xf32>>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "arith.constant"() <{value = 5 : index}> : () -> index
    %6 = "arith.constant"() <{value = 6 : index}> : () -> index
    %7 = "arith.constant"() <{value = 7 : index}> : () -> index
    %8 = "arith.constant"() <{value = 8 : index}> : () -> index
    %9 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %10 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %11 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %12 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %13 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %14 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %15 = "arith.constant"() <{value = 6.000000e+00 : f32}> : () -> f32
    %16 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %17 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %18 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %19 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %20 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %21 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %22 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %23 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %24 = "arith.constant"() <{value = 6 : i32}> : () -> i32
    %25 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %26 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xvector<8xf32>>
    %27 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xvector<8xi32>>
    %28 = "memref.alloc"(%8) <{alignment = 64 : i64, operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %29 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xvector<8xf32>>
    %30 = "vector.broadcast"(%10) : (f32) -> vector<8xf32>
    %31 = "vector.insert"(%12, %30) <{static_position = array<i64: 3>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %32 = "vector.insert"(%14, %31) <{static_position = array<i64: 4>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %33 = "vector.insert"(%12, %32) <{static_position = array<i64: 5>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %34 = "vector.insert"(%13, %33) <{static_position = array<i64: 6>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %35 = "vector.insert"(%12, %34) <{static_position = array<i64: 7>}> : (f32, vector<8xf32>) -> vector<8xf32>
    "memref.store"(%35, %26, %0) : (vector<8xf32>, memref<4xvector<8xf32>>, index) -> ()
    %36 = "vector.insert"(%11, %30) <{static_position = array<i64: 0>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %37 = "vector.insert"(%17, %36) <{static_position = array<i64: 1>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %38 = "vector.insert"(%11, %37) <{static_position = array<i64: 2>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %39 = "vector.insert"(%11, %38) <{static_position = array<i64: 5>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %40 = "vector.insert"(%16, %39) <{static_position = array<i64: 6>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %41 = "vector.insert"(%11, %40) <{static_position = array<i64: 7>}> : (f32, vector<8xf32>) -> vector<8xf32>
    "memref.store"(%41, %26, %1) : (vector<8xf32>, memref<4xvector<8xf32>>, index) -> ()
    %42 = "vector.insert"(%12, %30) <{static_position = array<i64: 1>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %43 = "vector.insert"(%15, %42) <{static_position = array<i64: 2>}> : (f32, vector<8xf32>) -> vector<8xf32>
    "memref.store"(%43, %26, %2) : (vector<8xf32>, memref<4xvector<8xf32>>, index) -> ()
    %44 = "vector.insert"(%11, %30) <{static_position = array<i64: 2>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %45 = "vector.insert"(%11, %44) <{static_position = array<i64: 5>}> : (f32, vector<8xf32>) -> vector<8xf32>
    "memref.store"(%45, %26, %3) : (vector<8xf32>, memref<4xvector<8xf32>>, index) -> ()
    %46 = "vector.broadcast"(%18) : (i32) -> vector<8xi32>
    %47 = "vector.insert"(%20, %46) <{static_position = array<i64: 2>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %48 = "vector.insert"(%19, %47) <{static_position = array<i64: 3>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %49 = "vector.insert"(%19, %48) <{static_position = array<i64: 5>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %50 = "vector.insert"(%19, %49) <{static_position = array<i64: 7>}> : (i32, vector<8xi32>) -> vector<8xi32>
    "memref.store"(%50, %27, %0) : (vector<8xi32>, memref<4xvector<8xi32>>, index) -> ()
    %51 = "vector.insert"(%20, %46) <{static_position = array<i64: 0>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %52 = "vector.insert"(%19, %51) <{static_position = array<i64: 1>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %53 = "vector.insert"(%23, %52) <{static_position = array<i64: 2>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %54 = "vector.insert"(%21, %53) <{static_position = array<i64: 3>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %55 = "vector.insert"(%21, %54) <{static_position = array<i64: 4>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %56 = "vector.insert"(%22, %55) <{static_position = array<i64: 5>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %57 = "vector.insert"(%20, %56) <{static_position = array<i64: 6>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %58 = "vector.insert"(%21, %57) <{static_position = array<i64: 7>}> : (i32, vector<8xi32>) -> vector<8xi32>
    "memref.store"(%58, %27, %1) : (vector<8xi32>, memref<4xvector<8xi32>>, index) -> ()
    %59 = "vector.insert"(%23, %46) <{static_position = array<i64: 0>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %60 = "vector.insert"(%22, %59) <{static_position = array<i64: 1>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %61 = "vector.insert"(%24, %60) <{static_position = array<i64: 2>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %62 = "vector.insert"(%23, %61) <{static_position = array<i64: 3>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %63 = "vector.insert"(%22, %62) <{static_position = array<i64: 4>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %64 = "vector.insert"(%23, %63) <{static_position = array<i64: 5>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %65 = "vector.insert"(%22, %64) <{static_position = array<i64: 6>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %66 = "vector.insert"(%24, %65) <{static_position = array<i64: 7>}> : (i32, vector<8xi32>) -> vector<8xi32>
    "memref.store"(%66, %27, %2) : (vector<8xi32>, memref<4xvector<8xi32>>, index) -> ()
    %67 = "vector.insert"(%25, %46) <{static_position = array<i64: 0>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %68 = "vector.insert"(%24, %67) <{static_position = array<i64: 1>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %69 = "vector.insert"(%25, %68) <{static_position = array<i64: 2>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %70 = "vector.insert"(%25, %69) <{static_position = array<i64: 3>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %71 = "vector.insert"(%23, %70) <{static_position = array<i64: 4>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %72 = "vector.insert"(%24, %71) <{static_position = array<i64: 5>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %73 = "vector.insert"(%24, %72) <{static_position = array<i64: 6>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %74 = "vector.insert"(%25, %73) <{static_position = array<i64: 7>}> : (i32, vector<8xi32>) -> vector<8xi32>
    "memref.store"(%74, %27, %3) : (vector<8xi32>, memref<4xvector<8xi32>>, index) -> ()
    %75 = "vector.broadcast"(%9) : (f32) -> vector<8xf32>
    "memref.store"(%75, %29, %0) : (vector<8xf32>, memref<1xvector<8xf32>>, index) -> ()
    "scf.for"(%0, %8, %1) ({
    ^bb0(%arg2: index):
      %79 = "arith.addi"(%arg2, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %80 = "arith.index_cast"(%79) : (index) -> i32
      %81 = "arith.sitofp"(%80) : (i32) -> f32
      "memref.store"(%81, %28, %arg2) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.call"(%26, %27, %28, %29) <{callee = @spmv8x8}> : (memref<4xvector<8xf32>>, memref<4xvector<8xi32>>, memref<?xf32>, memref<1xvector<8xf32>>) -> ()
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg1: index):
      %78 = "memref.load"(%26, %arg1) : (memref<4xvector<8xf32>>, index) -> vector<8xf32>
      "vector.print"(%78) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%0, %4, %1) ({
    ^bb0(%arg0: index):
      %77 = "memref.load"(%27, %arg0) : (memref<4xvector<8xi32>>, index) -> vector<8xi32>
      "vector.print"(%77) <{punctuation = #vector.punctuation<newline>}> : (vector<8xi32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %76 = "memref.load"(%29, %0) : (memref<1xvector<8xf32>>, index) -> vector<8xf32>
    "vector.print"(%76) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "memref.dealloc"(%26) : (memref<4xvector<8xf32>>) -> ()
    "memref.dealloc"(%27) : (memref<4xvector<8xi32>>) -> ()
    "memref.dealloc"(%28) : (memref<?xf32>) -> ()
    "memref.dealloc"(%29) : (memref<1xvector<8xf32>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

