#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
#map1 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi64>, memref<?xi64>, index) -> (), sym_name = "kernel_copy"}> ({
  ^bb0(%arg19: memref<?xi64>, %arg20: memref<?xi64>, %arg21: index):
    %72 = "arith.constant"() <{value = 0 : index}> : () -> index
    %73 = "arith.constant"() <{value = 2 : index}> : () -> index
    %74 = "vector.vscale"() : () -> index
    %75 = "arith.muli"(%73, %74) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "scf.for"(%72, %arg21, %75) ({
    ^bb0(%arg22: index):
      %76 = "vector.load"(%arg19, %arg22) : (memref<?xi64>, index) -> vector<[2]xi64>
      "vector.store"(%76, %arg20, %arg22) : (vector<[2]xi64>, memref<?xi64>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi64>, memref<?xi64>, memref<?xi64>, index) -> (), sym_name = "kernel_muladd"}> ({
  ^bb0(%arg14: memref<?xi64>, %arg15: memref<?xi64>, %arg16: memref<?xi64>, %arg17: index):
    %63 = "arith.constant"() <{value = 0 : index}> : () -> index
    %64 = "arith.constant"() <{value = 2 : index}> : () -> index
    %65 = "vector.vscale"() : () -> index
    %66 = "arith.muli"(%64, %65) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "scf.for"(%63, %arg17, %66) ({
    ^bb0(%arg18: index):
      %67 = "vector.load"(%arg14, %arg18) : (memref<?xi64>, index) -> vector<[2]xi64>
      %68 = "vector.load"(%arg15, %arg18) : (memref<?xi64>, index) -> vector<[2]xi64>
      %69 = "vector.load"(%arg16, %arg18) : (memref<?xi64>, index) -> vector<[2]xi64>
      %70 = "arith.muli"(%67, %68) <{overflowFlags = #arith.overflow<none>}> : (vector<[2]xi64>, vector<[2]xi64>) -> vector<[2]xi64>
      %71 = "arith.addi"(%70, %69) <{overflowFlags = #arith.overflow<none>}> : (vector<[2]xi64>, vector<[2]xi64>) -> vector<[2]xi64>
      "vector.store"(%71, %arg16, %arg18) : (vector<[2]xi64>, memref<?xi64>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi64>, memref<?xi64>, memref<?xi64>, index) -> (), sym_name = "kernel_absdiff"}> ({
  ^bb0(%arg9: memref<?xi64>, %arg10: memref<?xi64>, %arg11: memref<?xi64>, %arg12: index):
    %53 = "arith.constant"() <{value = 0 : index}> : () -> index
    %54 = "arith.constant"() <{value = 2 : index}> : () -> index
    %55 = "vector.vscale"() : () -> index
    %56 = "arith.muli"(%54, %55) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "scf.for"(%53, %arg12, %56) ({
    ^bb0(%arg13: index):
      %57 = "vector.load"(%arg9, %arg13) : (memref<?xi64>, index) -> vector<[2]xi64>
      %58 = "vector.load"(%arg10, %arg13) : (memref<?xi64>, index) -> vector<[2]xi64>
      %59 = "arith.cmpi"(%57, %58) <{predicate = 5 : i64}> : (vector<[2]xi64>, vector<[2]xi64>) -> vector<[2]xi1>
      %60 = "arith.cmpi"(%57, %58) <{predicate = 2 : i64}> : (vector<[2]xi64>, vector<[2]xi64>) -> vector<[2]xi1>
      %61 = "arm_sve.masked.subi"(%59, %57, %58) : (vector<[2]xi1>, vector<[2]xi64>, vector<[2]xi64>) -> vector<[2]xi64>
      %62 = "arm_sve.masked.subi"(%60, %58, %57) : (vector<[2]xi1>, vector<[2]xi64>, vector<[2]xi64>) -> vector<[2]xi64>
      "vector.maskedstore"(%arg11, %arg13, %59, %61) : (memref<?xi64>, index, vector<[2]xi1>, vector<[2]xi64>) -> ()
      "vector.maskedstore"(%arg11, %arg13, %60, %62) : (memref<?xi64>, index, vector<[2]xi1>, vector<[2]xi64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>, memref<?xf32>, index) -> (), sym_name = "kernel_addition"}> ({
  ^bb0(%arg4: memref<?xf32>, %arg5: memref<?xf32>, %arg6: memref<?xf32>, %arg7: index):
    %43 = "arith.constant"() <{value = 0 : index}> : () -> index
    %44 = "arith.constant"() <{value = 2 : index}> : () -> index
    %45 = "arith.constant"() <{value = dense<0.000000e+00> : vector<[4]xf32>}> : () -> vector<[4]xf32>
    %46 = "vector.vscale"() : () -> index
    %47 = "arith.muli"(%44, %46) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "scf.for"(%43, %arg7, %47) ({
    ^bb0(%arg8: index):
      %48 = "affine.min"(%arg7, %arg8, %47) <{map = #map}> : (index, index, index) -> index
      %49 = "vector.create_mask"(%48) : (index) -> vector<[4]xi1>
      %50 = "vector.maskedload"(%arg4, %arg8, %49, %45) : (memref<?xf32>, index, vector<[4]xi1>, vector<[4]xf32>) -> vector<[4]xf32>
      %51 = "vector.maskedload"(%arg5, %arg8, %49, %45) : (memref<?xf32>, index, vector<[4]xi1>, vector<[4]xf32>) -> vector<[4]xf32>
      %52 = "arith.addf"(%50, %51) <{fastmath = #arith.fastmath<none>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
      "vector.maskedstore"(%arg6, %arg8, %49, %52) : (memref<?xf32>, index, vector<[4]xi1>, vector<[4]xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "arith.constant"() <{value = 1 : i64}> : () -> i64
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index
    %5 = "arith.constant"() <{value = 2 : index}> : () -> index
    %6 = "arith.constant"() <{value = 4 : index}> : () -> index
    %7 = "arith.constant"() <{value = 8 : index}> : () -> index
    %8 = "arith.constant"() <{value = 32 : index}> : () -> index
    %9 = "arith.constant"() <{value = 33 : index}> : () -> index
    %10 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %11 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xi64>
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xi64>
    %13 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xi64>
    %14 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xi64>
    %15 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xi64>
    %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<33xf32>
    %17 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<33xf32>
    %18 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<36xf32>
    %19 = "arith.constant"() <{value = dense<[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]> : vector<32xi64>}> : () -> vector<32xi64>
    "vector.transfer_write"(%19, %11, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (vector<32xi64>, memref<32xi64>, index) -> ()
    %20 = "arith.constant"() <{value = dense<[33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64]> : vector<32xi64>}> : () -> vector<32xi64>
    "vector.transfer_write"(%20, %13, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (vector<32xi64>, memref<32xi64>, index) -> ()
    %21 = "arith.constant"() <{value = dense<[-9, 76, -7, 78, -5, 80, -3, 82, -1, 84, 1, 86, 3, 88, 5, 90, 7, 92, 9, 94, 11, 96, 13, 98, 15, 100, 17, 102, 19, 104, 21, 106]> : vector<32xi64>}> : () -> vector<32xi64>
    "vector.transfer_write"(%21, %15, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (vector<32xi64>, memref<32xi64>, index) -> ()
    %22 = "vector.broadcast"(%0) : (i64) -> vector<32xi64>
    "vector.transfer_write"(%22, %12, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (vector<32xi64>, memref<32xi64>, index) -> ()
    %23 = "vector.broadcast"(%1) : (i64) -> vector<32xi64>
    "vector.transfer_write"(%23, %14, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (vector<32xi64>, memref<32xi64>, index) -> ()
    %24 = "arith.constant"() <{value = dense<[1.500000e+00, 2.500000e+00, 3.500000e+00, 4.500000e+00, 5.500000e+00, 6.500000e+00, 7.500000e+00, 8.500000e+00, 9.500000e+00, 1.050000e+01, 1.150000e+01, 1.250000e+01, 1.350000e+01, 1.450000e+01, 1.550000e+01, 1.650000e+01, 1.750000e+01, 1.850000e+01, 1.950000e+01, 2.050000e+01, 2.150000e+01, 2.250000e+01, 2.350000e+01, 2.450000e+01, 2.550000e+01, 2.650000e+01, 2.750000e+01, 2.850000e+01, 2.950000e+01, 3.050000e+01, 3.150000e+01, 3.250000e+01, 3.350000e+01]> : vector<33xf32>}> : () -> vector<33xf32>
    "vector.transfer_write"(%24, %16, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (vector<33xf32>, memref<33xf32>, index) -> ()
    %25 = "arith.constant"() <{value = dense<[4.050000e+01, 3.950000e+01, 3.850000e+01, 3.750000e+01, 3.650000e+01, 3.550000e+01, 3.450000e+01, 3.350000e+01, 3.250000e+01, 3.150000e+01, 3.050000e+01, 2.950000e+01, 2.850000e+01, 2.750000e+01, 2.650000e+01, 2.550000e+01, 2.450000e+01, 2.350000e+01, 2.250000e+01, 2.150000e+01, 2.050000e+01, 1.950000e+01, 1.850000e+01, 1.750000e+01, 1.650000e+01, 1.550000e+01, 1.450000e+01, 1.350000e+01, 1.250000e+01, 1.150000e+01, 1.050000e+01, 9.500000e+00, 8.500000e+00]> : vector<33xf32>}> : () -> vector<33xf32>
    "vector.transfer_write"(%25, %17, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (vector<33xf32>, memref<33xf32>, index) -> ()
    %26 = "vector.broadcast"(%10) : (f32) -> vector<36xf32>
    "vector.transfer_write"(%26, %18, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (vector<36xf32>, memref<36xf32>, index) -> ()
    %27 = "memref.cast"(%11) : (memref<32xi64>) -> memref<?xi64>
    %28 = "memref.cast"(%12) : (memref<32xi64>) -> memref<?xi64>
    "func.call"(%27, %28, %8) <{callee = @kernel_copy}> : (memref<?xi64>, memref<?xi64>, index) -> ()
    "scf.for"(%3, %8, %6) ({
    ^bb0(%arg3: index):
      %42 = "vector.transfer_read"(%12, %arg3, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<32xi64>, index, i64) -> vector<4xi64>
      "vector.print"(%42) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %29 = "memref.cast"(%11) : (memref<32xi64>) -> memref<?xi64>
    %30 = "memref.cast"(%13) : (memref<32xi64>) -> memref<?xi64>
    %31 = "memref.cast"(%14) : (memref<32xi64>) -> memref<?xi64>
    "func.call"(%29, %30, %31, %8) <{callee = @kernel_muladd}> : (memref<?xi64>, memref<?xi64>, memref<?xi64>, index) -> ()
    "scf.for"(%3, %8, %6) ({
    ^bb0(%arg2: index):
      %41 = "vector.transfer_read"(%14, %arg2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<32xi64>, index, i64) -> vector<4xi64>
      "vector.print"(%41) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %32 = "memref.cast"(%13) : (memref<32xi64>) -> memref<?xi64>
    %33 = "memref.cast"(%15) : (memref<32xi64>) -> memref<?xi64>
    %34 = "memref.cast"(%14) : (memref<32xi64>) -> memref<?xi64>
    "func.call"(%32, %33, %34, %8) <{callee = @kernel_absdiff}> : (memref<?xi64>, memref<?xi64>, memref<?xi64>, index) -> ()
    "scf.for"(%3, %8, %6) ({
    ^bb0(%arg1: index):
      %40 = "vector.transfer_read"(%14, %arg1, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<32xi64>, index, i64) -> vector<4xi64>
      "vector.print"(%40) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %35 = "memref.cast"(%16) : (memref<33xf32>) -> memref<?xf32>
    %36 = "memref.cast"(%17) : (memref<33xf32>) -> memref<?xf32>
    %37 = "memref.cast"(%18) : (memref<36xf32>) -> memref<?xf32>
    "func.call"(%35, %36, %37, %9) <{callee = @kernel_addition}> : (memref<?xf32>, memref<?xf32>, memref<?xf32>, index) -> ()
    "scf.for"(%3, %8, %7) ({
    ^bb0(%arg0: index):
      %39 = "vector.transfer_read"(%18, %arg0, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<36xf32>, index, f32) -> vector<8xf32>
      "vector.print"(%39) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %38 = "vector.transfer_read"(%18, %8, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<36xf32>, index, f32) -> vector<4xf32>
    "vector.print"(%38) <{punctuation = #vector.punctuation<newline>}> : (vector<4xf32>) -> ()
    "memref.dealloc"(%11) : (memref<32xi64>) -> ()
    "memref.dealloc"(%12) : (memref<32xi64>) -> ()
    "memref.dealloc"(%13) : (memref<32xi64>) -> ()
    "memref.dealloc"(%14) : (memref<32xi64>) -> ()
    "memref.dealloc"(%15) : (memref<32xi64>) -> ()
    "memref.dealloc"(%16) : (memref<33xf32>) -> ()
    "memref.dealloc"(%17) : (memref<33xf32>) -> ()
    "memref.dealloc"(%18) : (memref<36xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

