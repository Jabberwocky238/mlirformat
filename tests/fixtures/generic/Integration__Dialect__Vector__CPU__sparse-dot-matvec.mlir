#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8xvector<4xf32>>, memref<8xvector<4xi32>>, memref<?xf32>, memref<?xf32>) -> (), sym_name = "spmv8x8"}> ({
  ^bb0(%arg4: memref<8xvector<4xf32>>, %arg5: memref<8xvector<4xi32>>, %arg6: memref<?xf32>, %arg7: memref<?xf32>):
    %81 = "arith.constant"() <{value = 0 : index}> : () -> index
    %82 = "arith.constant"() <{value = 1 : index}> : () -> index
    %83 = "arith.constant"() <{value = 8 : index}> : () -> index
    %84 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %85 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<4xi1>
    %86 = "vector.broadcast"(%84) : (f32) -> vector<4xf32>
    "scf.for"(%81, %83, %82) ({
    ^bb0(%arg8: index):
      %87 = "memref.load"(%arg4, %arg8) : (memref<8xvector<4xf32>>, index) -> vector<4xf32>
      %88 = "memref.load"(%arg5, %arg8) : (memref<8xvector<4xi32>>, index) -> vector<4xi32>
      %89 = "vector.gather"(%arg6, %81, %88, %85, %86) : (memref<?xf32>, index, vector<4xi32>, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
      %90 = "vector.contract"(%87, %89, %84) <{indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4xf32>, vector<4xf32>, f32) -> f32
      "memref.store"(%90, %arg7, %arg8) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
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
    %26 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8xvector<4xf32>>
    %27 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8xvector<4xi32>>
    %28 = "memref.alloc"(%8) <{alignment = 64 : i64, operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %29 = "memref.alloc"(%8) <{alignment = 64 : i64, operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %30 = "vector.broadcast"(%10) : (f32) -> vector<4xf32>
    %31 = "vector.insert"(%11, %30) <{static_position = array<i64: 1>}> : (f32, vector<4xf32>) -> vector<4xf32>
    "memref.store"(%31, %26, %0) : (vector<4xf32>, memref<8xvector<4xf32>>, index) -> ()
    %32 = "vector.insert"(%17, %30) <{static_position = array<i64: 1>}> : (f32, vector<4xf32>) -> vector<4xf32>
    %33 = "vector.insert"(%12, %32) <{static_position = array<i64: 2>}> : (f32, vector<4xf32>) -> vector<4xf32>
    "memref.store"(%33, %26, %1) : (vector<4xf32>, memref<8xvector<4xf32>>, index) -> ()
    %34 = "vector.insert"(%11, %30) <{static_position = array<i64: 1>}> : (f32, vector<4xf32>) -> vector<4xf32>
    %35 = "vector.insert"(%15, %34) <{static_position = array<i64: 2>}> : (f32, vector<4xf32>) -> vector<4xf32>
    %36 = "vector.insert"(%11, %35) <{static_position = array<i64: 3>}> : (f32, vector<4xf32>) -> vector<4xf32>
    "memref.store"(%36, %26, %2) : (vector<4xf32>, memref<8xvector<4xf32>>, index) -> ()
    %37 = "vector.insert"(%12, %30) <{static_position = array<i64: 0>}> : (f32, vector<4xf32>) -> vector<4xf32>
    "memref.store"(%37, %26, %3) : (vector<4xf32>, memref<8xvector<4xf32>>, index) -> ()
    %38 = "vector.insert"(%14, %30) <{static_position = array<i64: 0>}> : (f32, vector<4xf32>) -> vector<4xf32>
    "memref.store"(%38, %26, %4) : (vector<4xf32>, memref<8xvector<4xf32>>, index) -> ()
    %39 = "vector.insert"(%12, %30) <{static_position = array<i64: 0>}> : (f32, vector<4xf32>) -> vector<4xf32>
    %40 = "vector.insert"(%11, %39) <{static_position = array<i64: 1>}> : (f32, vector<4xf32>) -> vector<4xf32>
    %41 = "vector.insert"(%11, %40) <{static_position = array<i64: 3>}> : (f32, vector<4xf32>) -> vector<4xf32>
    "memref.store"(%41, %26, %5) : (vector<4xf32>, memref<8xvector<4xf32>>, index) -> ()
    %42 = "vector.insert"(%13, %30) <{static_position = array<i64: 0>}> : (f32, vector<4xf32>) -> vector<4xf32>
    %43 = "vector.insert"(%16, %42) <{static_position = array<i64: 1>}> : (f32, vector<4xf32>) -> vector<4xf32>
    "memref.store"(%43, %26, %6) : (vector<4xf32>, memref<8xvector<4xf32>>, index) -> ()
    %44 = "vector.insert"(%12, %30) <{static_position = array<i64: 0>}> : (f32, vector<4xf32>) -> vector<4xf32>
    %45 = "vector.insert"(%11, %44) <{static_position = array<i64: 1>}> : (f32, vector<4xf32>) -> vector<4xf32>
    "memref.store"(%45, %26, %7) : (vector<4xf32>, memref<8xvector<4xf32>>, index) -> ()
    %46 = "vector.broadcast"(%18) : (i32) -> vector<4xi32>
    %47 = "vector.insert"(%20, %46) <{static_position = array<i64: 1>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %48 = "vector.insert"(%23, %47) <{static_position = array<i64: 2>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %49 = "vector.insert"(%25, %48) <{static_position = array<i64: 3>}> : (i32, vector<4xi32>) -> vector<4xi32>
    "memref.store"(%49, %27, %0) : (vector<4xi32>, memref<8xvector<4xi32>>, index) -> ()
    %50 = "vector.insert"(%19, %46) <{static_position = array<i64: 1>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %51 = "vector.insert"(%22, %50) <{static_position = array<i64: 2>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %52 = "vector.insert"(%24, %51) <{static_position = array<i64: 3>}> : (i32, vector<4xi32>) -> vector<4xi32>
    "memref.store"(%52, %27, %1) : (vector<4xi32>, memref<8xvector<4xi32>>, index) -> ()
    %53 = "vector.insert"(%20, %46) <{static_position = array<i64: 0>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %54 = "vector.insert"(%23, %53) <{static_position = array<i64: 1>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %55 = "vector.insert"(%24, %54) <{static_position = array<i64: 2>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %56 = "vector.insert"(%25, %55) <{static_position = array<i64: 3>}> : (i32, vector<4xi32>) -> vector<4xi32>
    "memref.store"(%56, %27, %2) : (vector<4xi32>, memref<8xvector<4xi32>>, index) -> ()
    %57 = "vector.insert"(%19, %46) <{static_position = array<i64: 0>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %58 = "vector.insert"(%21, %57) <{static_position = array<i64: 1>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %59 = "vector.insert"(%23, %58) <{static_position = array<i64: 2>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %60 = "vector.insert"(%25, %59) <{static_position = array<i64: 3>}> : (i32, vector<4xi32>) -> vector<4xi32>
    "memref.store"(%60, %27, %3) : (vector<4xi32>, memref<8xvector<4xi32>>, index) -> ()
    %61 = "vector.insert"(%21, %46) <{static_position = array<i64: 1>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %62 = "vector.insert"(%22, %61) <{static_position = array<i64: 2>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %63 = "vector.insert"(%23, %62) <{static_position = array<i64: 3>}> : (i32, vector<4xi32>) -> vector<4xi32>
    "memref.store"(%63, %27, %4) : (vector<4xi32>, memref<8xvector<4xi32>>, index) -> ()
    %64 = "vector.insert"(%19, %46) <{static_position = array<i64: 0>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %65 = "vector.insert"(%22, %64) <{static_position = array<i64: 1>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %66 = "vector.insert"(%23, %65) <{static_position = array<i64: 2>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %67 = "vector.insert"(%24, %66) <{static_position = array<i64: 3>}> : (i32, vector<4xi32>) -> vector<4xi32>
    "memref.store"(%67, %27, %5) : (vector<4xi32>, memref<8xvector<4xi32>>, index) -> ()
    %68 = "vector.insert"(%20, %46) <{static_position = array<i64: 1>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %69 = "vector.insert"(%22, %68) <{static_position = array<i64: 2>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %70 = "vector.insert"(%24, %69) <{static_position = array<i64: 3>}> : (i32, vector<4xi32>) -> vector<4xi32>
    "memref.store"(%70, %27, %6) : (vector<4xi32>, memref<8xvector<4xi32>>, index) -> ()
    %71 = "vector.insert"(%19, %46) <{static_position = array<i64: 0>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %72 = "vector.insert"(%21, %71) <{static_position = array<i64: 1>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %73 = "vector.insert"(%24, %72) <{static_position = array<i64: 2>}> : (i32, vector<4xi32>) -> vector<4xi32>
    %74 = "vector.insert"(%25, %73) <{static_position = array<i64: 3>}> : (i32, vector<4xi32>) -> vector<4xi32>
    "memref.store"(%74, %27, %7) : (vector<4xi32>, memref<8xvector<4xi32>>, index) -> ()
    "scf.for"(%0, %8, %1) ({
    ^bb0(%arg3: index):
      %78 = "arith.addi"(%arg3, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %79 = "arith.index_cast"(%78) : (index) -> i32
      %80 = "arith.sitofp"(%79) : (i32) -> f32
      "memref.store"(%80, %28, %arg3) : (f32, memref<?xf32>, index) -> ()
      "memref.store"(%9, %29, %arg3) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.call"(%26, %27, %28, %29) <{callee = @spmv8x8}> : (memref<8xvector<4xf32>>, memref<8xvector<4xi32>>, memref<?xf32>, memref<?xf32>) -> ()
    "scf.for"(%0, %8, %1) ({
    ^bb0(%arg2: index):
      %77 = "memref.load"(%26, %arg2) : (memref<8xvector<4xf32>>, index) -> vector<4xf32>
      "vector.print"(%77) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%0, %8, %1) ({
    ^bb0(%arg1: index):
      %76 = "memref.load"(%27, %arg1) : (memref<8xvector<4xi32>>, index) -> vector<4xi32>
      "vector.print"(%76) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "scf.for"(%0, %8, %1) ({
    ^bb0(%arg0: index):
      %75 = "memref.load"(%29, %arg0) : (memref<?xf32>, index) -> f32
      "vector.print"(%75) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "memref.dealloc"(%26) : (memref<8xvector<4xf32>>) -> ()
    "memref.dealloc"(%27) : (memref<8xvector<4xi32>>) -> ()
    "memref.dealloc"(%28) : (memref<?xf32>) -> ()
    "memref.dealloc"(%29) : (memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

