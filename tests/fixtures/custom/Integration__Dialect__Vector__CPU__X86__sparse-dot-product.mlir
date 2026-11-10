#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @vector_dot(%arg0: vector<8xi64>, %arg1: vector<8xf64>, %arg2: vector<8xi64>, %arg3: vector<8xf64>) -> f64 {
    %k1, %k2 = x86.avx512.vp2intersect %arg0, %arg2 : vector<8xi64>
    %0 = x86.avx512.mask.compress %k1, %arg1 : vector<8xf64>
    %1 = x86.avx512.mask.compress %k2, %arg3 : vector<8xf64>
    %cst = arith.constant 0.000000e+00 : f64
    %2 = vector.contract {indexing_maps = [#map, #map, #map1], iterator_types = ["reduction"], kind = #vector.kind<add>} %0, %1, %cst : vector<8xf64>, vector<8xf64> into f64
    return %2 : f64
  }
  func.func @init_input(%arg0: memref<?xi64>, %arg1: memref<?xf64>, %arg2: memref<?xi64>, %arg3: memref<?xf64>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<0.000000e+00> : vector<128xf64>
    %cst_0 = arith.constant dense<9223372036854775807> : vector<128xi64>
    vector.transfer_write %cst_0, %arg0[%c0] : vector<128xi64>, memref<?xi64>
    vector.transfer_write %cst, %arg1[%c0] : vector<128xf64>, memref<?xf64>
    vector.transfer_write %cst_0, %arg2[%c0] : vector<128xi64>, memref<?xi64>
    vector.transfer_write %cst, %arg3[%c0] : vector<128xf64>, memref<?xf64>
    return
  }
  func.func @fill_input_1(%arg0: memref<?xi64>, %arg1: memref<?xf64>, %arg2: memref<?xi64>, %arg3: memref<?xf64>) -> (index, index) {
    call @init_input(%arg0, %arg1, %arg2, %arg3) : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>) -> ()
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<[0, 1, 10, 12, 13, 17, 18, 21, 51, 52, 57, 61, 62, 82, 98, 99]> : vector<16xi64>
    %cst_0 = arith.constant dense<[1.000000e+00, 5.000000e+00, 8.000000e+00, 3.000000e+00, 2.000000e+00, 1.000000e+00, 0.000000e+00, 9.000000e+00, 6.000000e+00, 7.000000e+00, 7.000000e+00, 3.000000e+00, 5.000000e+00, 2.000000e+00, 9.000000e+00, 1.000000e+00]> : vector<16xf64>
    %cst_1 = arith.constant dense<[1, 2, 5, 10, 11, 12, 47, 48, 67, 68, 69, 70, 71, 72, 77, 78, 79, 82, 83, 84, 85, 90, 91, 98]> : vector<24xi64>
    %cst_2 = arith.constant dense<[1.000000e+00, 5.000000e+00, 8.000000e+00, 3.000000e+00, 2.000000e+00, 1.000000e+00, 2.000000e+00, 9.000000e+00, 6.000000e+00, 7.000000e+00, 7.000000e+00, 3.000000e+00, 5.000000e+00, 2.000000e+00, 9.000000e+00, 1.000000e+00, 2.000000e+00, 9.000000e+00, 8.000000e+00, 7.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00]> : vector<24xf64>
    vector.transfer_write %cst, %arg0[%c0] : vector<16xi64>, memref<?xi64>
    vector.transfer_write %cst_0, %arg1[%c0] : vector<16xf64>, memref<?xf64>
    vector.transfer_write %cst_1, %arg2[%c0] : vector<24xi64>, memref<?xi64>
    vector.transfer_write %cst_2, %arg3[%c0] : vector<24xf64>, memref<?xf64>
    %c16 = arith.constant 16 : index
    %c24 = arith.constant 24 : index
    return %c16, %c24 : index, index
  }
  func.func @fill_input_2(%arg0: memref<?xi64>, %arg1: memref<?xf64>, %arg2: memref<?xi64>, %arg3: memref<?xf64>) -> (index, index) {
    call @init_input(%arg0, %arg1, %arg2, %arg3) : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>) -> ()
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<[0, 1, 3, 5, 6, 7, 8, 9, 51, 52, 57, 61, 62, 63, 65, 66]> : vector<16xi64>
    %cst_0 = arith.constant dense<[1.000000e+00, 5.000000e+00, 8.000000e+00, 3.000000e+00, 2.000000e+00, 1.000000e+00, 2.000000e+00, 9.000000e+00, 6.000000e+00, 7.000000e+00, 7.000000e+00, 3.000000e+00, 5.000000e+00, 2.000000e+00, 9.000000e+00, 1.000000e+00]> : vector<16xf64>
    %cst_1 = arith.constant dense<[6, 7, 11, 12, 15, 17, 19, 21, 30, 31, 33, 34, 37, 39, 40, 41, 42, 44, 45, 46, 47, 48, 49, 50, 62, 63, 64, 65, 66, 67, 68, 69, 70, 77, 78, 79, 81, 82, 89, 99]> : vector<40xi64>
    %cst_2 = arith.constant dense<[1.000000e+00, 5.000000e+00, 8.000000e+00, 3.000000e+00, 2.000000e+00, 1.000000e+00, 2.000000e+00, 9.000000e+00, 6.000000e+00, 7.000000e+00, 7.000000e+00, 3.000000e+00, 5.000000e+00, 2.000000e+00, 9.000000e+00, 1.000000e+00, 2.000000e+00, 9.000000e+00, 8.000000e+00, 7.000000e+00, 2.000000e+00, 1.000000e+00, 2.000000e+00, 4.000000e+00, 4.000000e+00, 5.000000e+00, 8.000000e+00, 8.000000e+00, 2.000000e+00, 3.000000e+00, 5.000000e+00, 1.000000e+00, 8.000000e+00, 6.000000e+00, 6.000000e+00, 4.000000e+00, 3.000000e+00, 8.000000e+00, 9.000000e+00, 2.000000e+00]> : vector<40xf64>
    vector.transfer_write %cst, %arg0[%c0] : vector<16xi64>, memref<?xi64>
    vector.transfer_write %cst_0, %arg1[%c0] : vector<16xf64>, memref<?xf64>
    vector.transfer_write %cst_1, %arg2[%c0] : vector<40xi64>, memref<?xi64>
    vector.transfer_write %cst_2, %arg3[%c0] : vector<40xf64>, memref<?xf64>
    %c16 = arith.constant 16 : index
    %c40 = arith.constant 40 : index
    return %c16, %c40 : index, index
  }
  func.func @memref_dot_simple(%arg0: memref<?xi64>, %arg1: memref<?xf64>, %arg2: memref<?xi64>, %arg3: memref<?xf64>, %arg4: index, %arg5: index) -> f64 {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 0.000000e+00 : f64
    %c9223372036854775807_i64 = arith.constant 9223372036854775807 : i64
    %0 = scf.for %arg6 = %c0 to %arg4 step %c8 iter_args(%arg7 = %cst) -> (f64) {
      %1 = vector.transfer_read %arg0[%arg6], %c9223372036854775807_i64 : memref<?xi64>, vector<8xi64>
      %2 = vector.transfer_read %arg1[%arg6], %cst : memref<?xf64>, vector<8xf64>
      %3 = scf.for %arg8 = %c0 to %arg5 step %c8 iter_args(%arg9 = %arg7) -> (f64) {
        %4 = vector.transfer_read %arg2[%arg8], %c9223372036854775807_i64 : memref<?xi64>, vector<8xi64>
        %5 = vector.transfer_read %arg3[%arg8], %cst : memref<?xf64>, vector<8xf64>
        %6 = func.call @vector_dot(%1, %2, %4, %5) : (vector<8xi64>, vector<8xf64>, vector<8xi64>, vector<8xf64>) -> f64
        %7 = arith.addf %arg9, %6 : f64
        scf.yield %7 : f64
      }
      scf.yield %3 : f64
    }
    return %0 : f64
  }
  func.func @memref_dot_optimized(%arg0: memref<?xi64>, %arg1: memref<?xf64>, %arg2: memref<?xi64>, %arg3: memref<?xf64>, %arg4: index, %arg5: index) -> f64 {
    %c0 = arith.constant 0 : index
    %c7 = arith.constant 7 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 0.000000e+00 : f64
    %c9223372036854775807_i64 = arith.constant 9223372036854775807 : i64
    %0:2 = scf.for %arg6 = %c0 to %arg4 step %c8 iter_args(%arg7 = %cst, %arg8 = %c0) -> (f64, index) {
      %1 = vector.transfer_read %arg0[%arg6], %c9223372036854775807_i64 : memref<?xi64>, vector<8xi64>
      %2 = vector.extract %1[%c0] : i64 from vector<8xi64>
      %3:2 = scf.for %arg9 = %arg8 to %arg5 step %c8 iter_args(%arg10 = %arg7, %arg11 = %arg8) -> (f64, index) {
        %4 = vector.transfer_read %arg2[%arg9], %c9223372036854775807_i64 : memref<?xi64>, vector<8xi64>
        %5 = vector.extract %4[%c7] : i64 from vector<8xi64>
        %6 = arith.cmpi slt, %5, %2 : i64
        %7:2 = scf.if %6 -> (f64, index) {
          %8 = arith.addi %arg11, %c8 : index
          scf.yield %arg10, %8 : f64, index
        } else {
          %8 = vector.transfer_read %arg1[%arg6], %cst : memref<?xf64>, vector<8xf64>
          %9 = vector.transfer_read %arg3[%arg9], %cst : memref<?xf64>, vector<8xf64>
          %10 = func.call @vector_dot(%1, %8, %4, %9) : (vector<8xi64>, vector<8xf64>, vector<8xi64>, vector<8xf64>) -> f64
          %11 = arith.addf %arg10, %10 : f64
          scf.yield %11, %arg11 : f64, index
        }
        scf.yield %7#0, %7#1 : f64, index
      }
      scf.yield %3#0, %3#1 : f64, index
    }
    return %0#0 : f64
  }
  func.func @memref_dot_while(%arg0: memref<?xi64>, %arg1: memref<?xf64>, %arg2: memref<?xi64>, %arg3: memref<?xf64>, %arg4: index, %arg5: index) -> f64 {
    %c0 = arith.constant 0 : index
    %c7 = arith.constant 7 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 0.000000e+00 : f64
    %c9223372036854775807_i64 = arith.constant 9223372036854775807 : i64
    %0:3 = scf.while (%arg6 = %cst, %arg7 = %c0, %arg8 = %c0) : (f64, index, index) -> (f64, index, index) {
      %1 = arith.cmpi slt, %arg7, %arg4 : index
      %2 = arith.cmpi slt, %arg8, %arg5 : index
      %3 = arith.andi %1, %2 : i1
      scf.condition(%3) %arg6, %arg7, %arg8 : f64, index, index
    } do {
    ^bb0(%arg6: f64, %arg7: index, %arg8: index):
      %1 = vector.transfer_read %arg0[%arg7], %c9223372036854775807_i64 : memref<?xi64>, vector<8xi64>
      %2 = vector.transfer_read %arg2[%arg8], %c9223372036854775807_i64 : memref<?xi64>, vector<8xi64>
      %3 = vector.extract %1[%c0] : i64 from vector<8xi64>
      %4 = vector.extract %1[%c7] : i64 from vector<8xi64>
      %5 = vector.extract %2[%c0] : i64 from vector<8xi64>
      %6 = vector.extract %2[%c7] : i64 from vector<8xi64>
      %7 = arith.cmpi slt, %6, %3 : i64
      %8:3 = scf.if %7 -> (f64, index, index) {
        %9 = arith.addi %arg8, %c8 : index
        scf.yield %arg6, %arg7, %9 : f64, index, index
      } else {
        %9 = arith.cmpi slt, %4, %5 : i64
        %10:3 = scf.if %9 -> (f64, index, index) {
          %11 = arith.addi %arg7, %c8 : index
          scf.yield %arg6, %11, %arg8 : f64, index, index
        } else {
          %11 = vector.transfer_read %arg1[%arg7], %cst : memref<?xf64>, vector<8xf64>
          %12 = vector.transfer_read %arg3[%arg8], %cst : memref<?xf64>, vector<8xf64>
          %13 = func.call @vector_dot(%1, %11, %2, %12) : (vector<8xi64>, vector<8xf64>, vector<8xi64>, vector<8xf64>) -> f64
          %14 = arith.addf %arg6, %13 : f64
          %15 = arith.cmpi slt, %4, %6 : i64
          %16:2 = scf.if %15 -> (index, index) {
            %17 = arith.addi %arg7, %c8 : index
            scf.yield %17, %arg8 : index, index
          } else {
            %17 = arith.cmpi slt, %6, %4 : i64
            %18:2 = scf.if %17 -> (index, index) {
              %19 = arith.addi %arg8, %c8 : index
              scf.yield %arg7, %19 : index, index
            } else {
              %19 = arith.addi %arg7, %c8 : index
              %20 = arith.addi %arg8, %c8 : index
              scf.yield %19, %20 : index, index
            }
            scf.yield %18#0, %18#1 : index, index
          }
          scf.yield %14, %16#0, %16#1 : f64, index, index
        }
        scf.yield %10#0, %10#1, %10#2 : f64, index, index
      }
      scf.yield %8#0, %8#1, %8#2 : f64, index, index
    }
    return %0#0 : f64
  }
  func.func @memref_dot_while_branchless(%arg0: memref<?xi64>, %arg1: memref<?xf64>, %arg2: memref<?xi64>, %arg3: memref<?xf64>, %arg4: index, %arg5: index) -> f64 {
    %c0 = arith.constant 0 : index
    %c7 = arith.constant 7 : index
    %c8 = arith.constant 8 : index
    %cst = arith.constant 0.000000e+00 : f64
    %c9223372036854775807_i64 = arith.constant 9223372036854775807 : i64
    %0:3 = scf.while (%arg6 = %cst, %arg7 = %c0, %arg8 = %c0) : (f64, index, index) -> (f64, index, index) {
      %1 = arith.cmpi slt, %arg7, %arg4 : index
      %2 = arith.cmpi slt, %arg8, %arg5 : index
      %3 = arith.andi %1, %2 : i1
      scf.condition(%3) %arg6, %arg7, %arg8 : f64, index, index
    } do {
    ^bb0(%arg6: f64, %arg7: index, %arg8: index):
      %1 = vector.transfer_read %arg0[%arg7], %c9223372036854775807_i64 : memref<?xi64>, vector<8xi64>
      %2 = vector.transfer_read %arg1[%arg7], %cst : memref<?xf64>, vector<8xf64>
      %3 = vector.transfer_read %arg2[%arg8], %c9223372036854775807_i64 : memref<?xi64>, vector<8xi64>
      %4 = vector.transfer_read %arg3[%arg8], %cst : memref<?xf64>, vector<8xf64>
      %5 = func.call @vector_dot(%1, %2, %3, %4) : (vector<8xi64>, vector<8xf64>, vector<8xi64>, vector<8xf64>) -> f64
      %6 = arith.addf %arg6, %5 : f64
      %7 = vector.extract %1[%c7] : i64 from vector<8xi64>
      %8 = vector.extract %3[%c7] : i64 from vector<8xi64>
      %9 = arith.cmpi sle, %7, %8 : i64
      %10 = arith.extui %9 : i1 to i64
      %11 = arith.index_cast %10 : i64 to index
      %12 = arith.muli %11, %c8 : index
      %13 = arith.addi %arg7, %12 : index
      %14 = arith.cmpi sle, %8, %7 : i64
      %15 = arith.extui %14 : i1 to i64
      %16 = arith.index_cast %15 : i64 to index
      %17 = arith.muli %16, %c8 : index
      %18 = arith.addi %arg8, %17 : index
      scf.yield %6, %13, %18 : f64, index, index
    }
    return %0#0 : f64
  }
  func.func @entry() -> i32 {
    %alloc = memref.alloc() : memref<128xi64>
    %alloc_0 = memref.alloc() : memref<128xf64>
    %alloc_1 = memref.alloc() : memref<128xi64>
    %alloc_2 = memref.alloc() : memref<128xf64>
    %cast = memref.cast %alloc : memref<128xi64> to memref<?xi64>
    %cast_3 = memref.cast %alloc_0 : memref<128xf64> to memref<?xf64>
    %cast_4 = memref.cast %alloc_1 : memref<128xi64> to memref<?xi64>
    %cast_5 = memref.cast %alloc_2 : memref<128xf64> to memref<?xf64>
    %0:2 = call @fill_input_1(%cast, %cast_3, %cast_4, %cast_5) : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>) -> (index, index)
    %1 = call @memref_dot_simple(%cast, %cast_3, %cast_4, %cast_5, %0#0, %0#1) : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    vector.print %1 : f64
    %2 = call @memref_dot_optimized(%cast, %cast_3, %cast_4, %cast_5, %0#0, %0#1) : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    vector.print %2 : f64
    %3 = call @memref_dot_while(%cast, %cast_3, %cast_4, %cast_5, %0#0, %0#1) : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    vector.print %3 : f64
    %4 = call @memref_dot_while_branchless(%cast, %cast_3, %cast_4, %cast_5, %0#0, %0#1) : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    vector.print %4 : f64
    %5:2 = call @fill_input_2(%cast, %cast_3, %cast_4, %cast_5) : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>) -> (index, index)
    %6 = call @memref_dot_simple(%cast, %cast_3, %cast_4, %cast_5, %5#0, %5#1) : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    vector.print %6 : f64
    %7 = call @memref_dot_optimized(%cast, %cast_3, %cast_4, %cast_5, %5#0, %5#1) : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    vector.print %7 : f64
    %8 = call @memref_dot_while(%cast, %cast_3, %cast_4, %cast_5, %5#0, %5#1) : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    vector.print %8 : f64
    %9 = call @memref_dot_while_branchless(%cast, %cast_3, %cast_4, %cast_5, %5#0, %5#1) : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    vector.print %9 : f64
    memref.dealloc %alloc : memref<128xi64>
    memref.dealloc %alloc_0 : memref<128xf64>
    memref.dealloc %alloc_1 : memref<128xi64>
    memref.dealloc %alloc_2 : memref<128xf64>
    %c0_i32 = arith.constant 0 : i32
    return %c0_i32 : i32
  }
}

