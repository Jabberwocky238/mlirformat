#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xi64>, vector<8xf64>, vector<8xi64>, vector<8xf64>) -> f64, sym_name = "vector_dot"}> ({
  ^bb0(%arg58: vector<8xi64>, %arg59: vector<8xf64>, %arg60: vector<8xi64>, %arg61: vector<8xf64>):
    %126:2 = "x86.avx512.vp2intersect"(%arg58, %arg60) : (vector<8xi64>, vector<8xi64>) -> (vector<8xi1>, vector<8xi1>)
    %127 = "x86.avx512.mask.compress"(%126#0, %arg59) : (vector<8xi1>, vector<8xf64>) -> vector<8xf64>
    %128 = "x86.avx512.mask.compress"(%126#1, %arg61) : (vector<8xi1>, vector<8xf64>) -> vector<8xf64>
    %129 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %130 = "vector.contract"(%127, %128, %129) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map, #map, #map1], iterator_types = [#vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<8xf64>, vector<8xf64>, f64) -> f64
    "func.return"(%130) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>) -> (), sym_name = "init_input"}> ({
  ^bb0(%arg54: memref<?xi64>, %arg55: memref<?xf64>, %arg56: memref<?xi64>, %arg57: memref<?xf64>):
    %123 = "arith.constant"() <{value = 0 : index}> : () -> index
    %124 = "arith.constant"() <{value = dense<0.000000e+00> : vector<128xf64>}> : () -> vector<128xf64>
    %125 = "arith.constant"() <{value = dense<9223372036854775807> : vector<128xi64>}> : () -> vector<128xi64>
    "vector.transfer_write"(%125, %arg54, %123) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<128xi64>, memref<?xi64>, index) -> ()
    "vector.transfer_write"(%124, %arg55, %123) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<128xf64>, memref<?xf64>, index) -> ()
    "vector.transfer_write"(%125, %arg56, %123) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<128xi64>, memref<?xi64>, index) -> ()
    "vector.transfer_write"(%124, %arg57, %123) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<128xf64>, memref<?xf64>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>) -> (index, index), sym_name = "fill_input_1"}> ({
  ^bb0(%arg50: memref<?xi64>, %arg51: memref<?xf64>, %arg52: memref<?xi64>, %arg53: memref<?xf64>):
    "func.call"(%arg50, %arg51, %arg52, %arg53) <{callee = @init_input}> : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>) -> ()
    %116 = "arith.constant"() <{value = 0 : index}> : () -> index
    %117 = "arith.constant"() <{value = dense<[0, 1, 10, 12, 13, 17, 18, 21, 51, 52, 57, 61, 62, 82, 98, 99]> : vector<16xi64>}> : () -> vector<16xi64>
    %118 = "arith.constant"() <{value = dense<[1.000000e+00, 5.000000e+00, 8.000000e+00, 3.000000e+00, 2.000000e+00, 1.000000e+00, 0.000000e+00, 9.000000e+00, 6.000000e+00, 7.000000e+00, 7.000000e+00, 3.000000e+00, 5.000000e+00, 2.000000e+00, 9.000000e+00, 1.000000e+00]> : vector<16xf64>}> : () -> vector<16xf64>
    %119 = "arith.constant"() <{value = dense<[1, 2, 5, 10, 11, 12, 47, 48, 67, 68, 69, 70, 71, 72, 77, 78, 79, 82, 83, 84, 85, 90, 91, 98]> : vector<24xi64>}> : () -> vector<24xi64>
    %120 = "arith.constant"() <{value = dense<[1.000000e+00, 5.000000e+00, 8.000000e+00, 3.000000e+00, 2.000000e+00, 1.000000e+00, 2.000000e+00, 9.000000e+00, 6.000000e+00, 7.000000e+00, 7.000000e+00, 3.000000e+00, 5.000000e+00, 2.000000e+00, 9.000000e+00, 1.000000e+00, 2.000000e+00, 9.000000e+00, 8.000000e+00, 7.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 4.000000e+00]> : vector<24xf64>}> : () -> vector<24xf64>
    "vector.transfer_write"(%117, %arg50, %116) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xi64>, memref<?xi64>, index) -> ()
    "vector.transfer_write"(%118, %arg51, %116) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf64>, memref<?xf64>, index) -> ()
    "vector.transfer_write"(%119, %arg52, %116) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<24xi64>, memref<?xi64>, index) -> ()
    "vector.transfer_write"(%120, %arg53, %116) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<24xf64>, memref<?xf64>, index) -> ()
    %121 = "arith.constant"() <{value = 16 : index}> : () -> index
    %122 = "arith.constant"() <{value = 24 : index}> : () -> index
    "func.return"(%121, %122) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>) -> (index, index), sym_name = "fill_input_2"}> ({
  ^bb0(%arg46: memref<?xi64>, %arg47: memref<?xf64>, %arg48: memref<?xi64>, %arg49: memref<?xf64>):
    "func.call"(%arg46, %arg47, %arg48, %arg49) <{callee = @init_input}> : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>) -> ()
    %109 = "arith.constant"() <{value = 0 : index}> : () -> index
    %110 = "arith.constant"() <{value = dense<[0, 1, 3, 5, 6, 7, 8, 9, 51, 52, 57, 61, 62, 63, 65, 66]> : vector<16xi64>}> : () -> vector<16xi64>
    %111 = "arith.constant"() <{value = dense<[1.000000e+00, 5.000000e+00, 8.000000e+00, 3.000000e+00, 2.000000e+00, 1.000000e+00, 2.000000e+00, 9.000000e+00, 6.000000e+00, 7.000000e+00, 7.000000e+00, 3.000000e+00, 5.000000e+00, 2.000000e+00, 9.000000e+00, 1.000000e+00]> : vector<16xf64>}> : () -> vector<16xf64>
    %112 = "arith.constant"() <{value = dense<[6, 7, 11, 12, 15, 17, 19, 21, 30, 31, 33, 34, 37, 39, 40, 41, 42, 44, 45, 46, 47, 48, 49, 50, 62, 63, 64, 65, 66, 67, 68, 69, 70, 77, 78, 79, 81, 82, 89, 99]> : vector<40xi64>}> : () -> vector<40xi64>
    %113 = "arith.constant"() <{value = dense<[1.000000e+00, 5.000000e+00, 8.000000e+00, 3.000000e+00, 2.000000e+00, 1.000000e+00, 2.000000e+00, 9.000000e+00, 6.000000e+00, 7.000000e+00, 7.000000e+00, 3.000000e+00, 5.000000e+00, 2.000000e+00, 9.000000e+00, 1.000000e+00, 2.000000e+00, 9.000000e+00, 8.000000e+00, 7.000000e+00, 2.000000e+00, 1.000000e+00, 2.000000e+00, 4.000000e+00, 4.000000e+00, 5.000000e+00, 8.000000e+00, 8.000000e+00, 2.000000e+00, 3.000000e+00, 5.000000e+00, 1.000000e+00, 8.000000e+00, 6.000000e+00, 6.000000e+00, 4.000000e+00, 3.000000e+00, 8.000000e+00, 9.000000e+00, 2.000000e+00]> : vector<40xf64>}> : () -> vector<40xf64>
    "vector.transfer_write"(%110, %arg46, %109) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xi64>, memref<?xi64>, index) -> ()
    "vector.transfer_write"(%111, %arg47, %109) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf64>, memref<?xf64>, index) -> ()
    "vector.transfer_write"(%112, %arg48, %109) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<40xi64>, memref<?xi64>, index) -> ()
    "vector.transfer_write"(%113, %arg49, %109) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<40xf64>, memref<?xf64>, index) -> ()
    %114 = "arith.constant"() <{value = 16 : index}> : () -> index
    %115 = "arith.constant"() <{value = 40 : index}> : () -> index
    "func.return"(%114, %115) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64, sym_name = "memref_dot_simple"}> ({
  ^bb0(%arg36: memref<?xi64>, %arg37: memref<?xf64>, %arg38: memref<?xi64>, %arg39: memref<?xf64>, %arg40: index, %arg41: index):
    %97 = "arith.constant"() <{value = 0 : index}> : () -> index
    %98 = "arith.constant"() <{value = 8 : index}> : () -> index
    %99 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %100 = "arith.constant"() <{value = 9223372036854775807 : i64}> : () -> i64
    %101 = "scf.for"(%97, %arg40, %98, %99) ({
    ^bb0(%arg42: index, %arg43: f64):
      %102 = "vector.transfer_read"(%arg36, %arg42, %100) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xi64>, index, i64) -> vector<8xi64>
      %103 = "vector.transfer_read"(%arg37, %arg42, %99) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf64>, index, f64) -> vector<8xf64>
      %104 = "scf.for"(%97, %arg41, %98, %arg43) ({
      ^bb0(%arg44: index, %arg45: f64):
        %105 = "vector.transfer_read"(%arg38, %arg44, %100) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xi64>, index, i64) -> vector<8xi64>
        %106 = "vector.transfer_read"(%arg39, %arg44, %99) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf64>, index, f64) -> vector<8xf64>
        %107 = "func.call"(%102, %103, %105, %106) <{callee = @vector_dot}> : (vector<8xi64>, vector<8xf64>, vector<8xi64>, vector<8xf64>) -> f64
        %108 = "arith.addf"(%arg45, %107) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "scf.yield"(%108) : (f64) -> ()
      }) : (index, index, index, f64) -> f64
      "scf.yield"(%104) : (f64) -> ()
    }) : (index, index, index, f64) -> f64
    "func.return"(%101) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64, sym_name = "memref_dot_optimized"}> ({
  ^bb0(%arg24: memref<?xi64>, %arg25: memref<?xf64>, %arg26: memref<?xi64>, %arg27: memref<?xf64>, %arg28: index, %arg29: index):
    %79 = "arith.constant"() <{value = 0 : index}> : () -> index
    %80 = "arith.constant"() <{value = 7 : index}> : () -> index
    %81 = "arith.constant"() <{value = 8 : index}> : () -> index
    %82 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %83 = "arith.constant"() <{value = 9223372036854775807 : i64}> : () -> i64
    %84:2 = "scf.for"(%79, %arg28, %81, %82, %79) ({
    ^bb0(%arg30: index, %arg31: f64, %arg32: index):
      %85 = "vector.transfer_read"(%arg24, %arg30, %83) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xi64>, index, i64) -> vector<8xi64>
      %86 = "vector.extract"(%85, %79) <{static_position = array<i64: -9223372036854775808>}> : (vector<8xi64>, index) -> i64
      %87:2 = "scf.for"(%arg32, %arg29, %81, %arg31, %arg32) ({
      ^bb0(%arg33: index, %arg34: f64, %arg35: index):
        %88 = "vector.transfer_read"(%arg26, %arg33, %83) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xi64>, index, i64) -> vector<8xi64>
        %89 = "vector.extract"(%88, %80) <{static_position = array<i64: -9223372036854775808>}> : (vector<8xi64>, index) -> i64
        %90 = "arith.cmpi"(%89, %86) <{predicate = 2 : i64}> : (i64, i64) -> i1
        %91:2 = "scf.if"(%90) ({
          %96 = "arith.addi"(%arg35, %81) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          "scf.yield"(%arg34, %96) : (f64, index) -> ()
        }, {
          %92 = "vector.transfer_read"(%arg25, %arg30, %82) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf64>, index, f64) -> vector<8xf64>
          %93 = "vector.transfer_read"(%arg27, %arg33, %82) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf64>, index, f64) -> vector<8xf64>
          %94 = "func.call"(%85, %92, %88, %93) <{callee = @vector_dot}> : (vector<8xi64>, vector<8xf64>, vector<8xi64>, vector<8xf64>) -> f64
          %95 = "arith.addf"(%arg34, %94) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
          "scf.yield"(%95, %arg35) : (f64, index) -> ()
        }) : (i1) -> (f64, index)
        "scf.yield"(%91#0, %91#1) : (f64, index) -> ()
      }) : (index, index, index, f64, index) -> (f64, index)
      "scf.yield"(%87#0, %87#1) : (f64, index) -> ()
    }) : (index, index, index, f64, index) -> (f64, index)
    "func.return"(%84#0) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64, sym_name = "memref_dot_while"}> ({
  ^bb0(%arg12: memref<?xi64>, %arg13: memref<?xf64>, %arg14: memref<?xi64>, %arg15: memref<?xf64>, %arg16: index, %arg17: index):
    %46 = "arith.constant"() <{value = 0 : index}> : () -> index
    %47 = "arith.constant"() <{value = 7 : index}> : () -> index
    %48 = "arith.constant"() <{value = 8 : index}> : () -> index
    %49 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %50 = "arith.constant"() <{value = 9223372036854775807 : i64}> : () -> i64
    %51:3 = "scf.while"(%49, %46, %46) ({
    ^bb0(%arg21: f64, %arg22: index, %arg23: index):
      %76 = "arith.cmpi"(%arg22, %arg16) <{predicate = 2 : i64}> : (index, index) -> i1
      %77 = "arith.cmpi"(%arg23, %arg17) <{predicate = 2 : i64}> : (index, index) -> i1
      %78 = "arith.andi"(%76, %77) : (i1, i1) -> i1
      "scf.condition"(%78, %arg21, %arg22, %arg23) : (i1, f64, index, index) -> ()
    }, {
    ^bb0(%arg18: f64, %arg19: index, %arg20: index):
      %52 = "vector.transfer_read"(%arg12, %arg19, %50) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xi64>, index, i64) -> vector<8xi64>
      %53 = "vector.transfer_read"(%arg14, %arg20, %50) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xi64>, index, i64) -> vector<8xi64>
      %54 = "vector.extract"(%52, %46) <{static_position = array<i64: -9223372036854775808>}> : (vector<8xi64>, index) -> i64
      %55 = "vector.extract"(%52, %47) <{static_position = array<i64: -9223372036854775808>}> : (vector<8xi64>, index) -> i64
      %56 = "vector.extract"(%53, %46) <{static_position = array<i64: -9223372036854775808>}> : (vector<8xi64>, index) -> i64
      %57 = "vector.extract"(%53, %47) <{static_position = array<i64: -9223372036854775808>}> : (vector<8xi64>, index) -> i64
      %58 = "arith.cmpi"(%57, %54) <{predicate = 2 : i64}> : (i64, i64) -> i1
      %59:3 = "scf.if"(%58) ({
        %75 = "arith.addi"(%arg20, %48) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "scf.yield"(%arg18, %arg19, %75) : (f64, index, index) -> ()
      }, {
        %60 = "arith.cmpi"(%55, %56) <{predicate = 2 : i64}> : (i64, i64) -> i1
        %61:3 = "scf.if"(%60) ({
          %74 = "arith.addi"(%arg19, %48) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
          "scf.yield"(%arg18, %74, %arg20) : (f64, index, index) -> ()
        }, {
          %62 = "vector.transfer_read"(%arg13, %arg19, %49) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf64>, index, f64) -> vector<8xf64>
          %63 = "vector.transfer_read"(%arg15, %arg20, %49) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf64>, index, f64) -> vector<8xf64>
          %64 = "func.call"(%52, %62, %53, %63) <{callee = @vector_dot}> : (vector<8xi64>, vector<8xf64>, vector<8xi64>, vector<8xf64>) -> f64
          %65 = "arith.addf"(%arg18, %64) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
          %66 = "arith.cmpi"(%55, %57) <{predicate = 2 : i64}> : (i64, i64) -> i1
          %67:2 = "scf.if"(%66) ({
            %73 = "arith.addi"(%arg19, %48) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
            "scf.yield"(%73, %arg20) : (index, index) -> ()
          }, {
            %68 = "arith.cmpi"(%57, %55) <{predicate = 2 : i64}> : (i64, i64) -> i1
            %69:2 = "scf.if"(%68) ({
              %72 = "arith.addi"(%arg20, %48) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
              "scf.yield"(%arg19, %72) : (index, index) -> ()
            }, {
              %70 = "arith.addi"(%arg19, %48) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
              %71 = "arith.addi"(%arg20, %48) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
              "scf.yield"(%70, %71) : (index, index) -> ()
            }) : (i1) -> (index, index)
            "scf.yield"(%69#0, %69#1) : (index, index) -> ()
          }) : (i1) -> (index, index)
          "scf.yield"(%65, %67#0, %67#1) : (f64, index, index) -> ()
        }) : (i1) -> (f64, index, index)
        "scf.yield"(%61#0, %61#1, %61#2) : (f64, index, index) -> ()
      }) : (i1) -> (f64, index, index)
      "scf.yield"(%59#0, %59#1, %59#2) : (f64, index, index) -> ()
    }) : (f64, index, index) -> (f64, index, index)
    "func.return"(%51#0) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64, sym_name = "memref_dot_while_branchless"}> ({
  ^bb0(%arg0: memref<?xi64>, %arg1: memref<?xf64>, %arg2: memref<?xi64>, %arg3: memref<?xf64>, %arg4: index, %arg5: index):
    %19 = "arith.constant"() <{value = 0 : index}> : () -> index
    %20 = "arith.constant"() <{value = 7 : index}> : () -> index
    %21 = "arith.constant"() <{value = 8 : index}> : () -> index
    %22 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %23 = "arith.constant"() <{value = 9223372036854775807 : i64}> : () -> i64
    %24:3 = "scf.while"(%22, %19, %19) ({
    ^bb0(%arg9: f64, %arg10: index, %arg11: index):
      %43 = "arith.cmpi"(%arg10, %arg4) <{predicate = 2 : i64}> : (index, index) -> i1
      %44 = "arith.cmpi"(%arg11, %arg5) <{predicate = 2 : i64}> : (index, index) -> i1
      %45 = "arith.andi"(%43, %44) : (i1, i1) -> i1
      "scf.condition"(%45, %arg9, %arg10, %arg11) : (i1, f64, index, index) -> ()
    }, {
    ^bb0(%arg6: f64, %arg7: index, %arg8: index):
      %25 = "vector.transfer_read"(%arg0, %arg7, %23) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xi64>, index, i64) -> vector<8xi64>
      %26 = "vector.transfer_read"(%arg1, %arg7, %22) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf64>, index, f64) -> vector<8xf64>
      %27 = "vector.transfer_read"(%arg2, %arg8, %23) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xi64>, index, i64) -> vector<8xi64>
      %28 = "vector.transfer_read"(%arg3, %arg8, %22) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf64>, index, f64) -> vector<8xf64>
      %29 = "func.call"(%25, %26, %27, %28) <{callee = @vector_dot}> : (vector<8xi64>, vector<8xf64>, vector<8xi64>, vector<8xf64>) -> f64
      %30 = "arith.addf"(%arg6, %29) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %31 = "vector.extract"(%25, %20) <{static_position = array<i64: -9223372036854775808>}> : (vector<8xi64>, index) -> i64
      %32 = "vector.extract"(%27, %20) <{static_position = array<i64: -9223372036854775808>}> : (vector<8xi64>, index) -> i64
      %33 = "arith.cmpi"(%31, %32) <{predicate = 3 : i64}> : (i64, i64) -> i1
      %34 = "arith.extui"(%33) : (i1) -> i64
      %35 = "arith.index_cast"(%34) : (i64) -> index
      %36 = "arith.muli"(%35, %21) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %37 = "arith.addi"(%arg7, %36) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %38 = "arith.cmpi"(%32, %31) <{predicate = 3 : i64}> : (i64, i64) -> i1
      %39 = "arith.extui"(%38) : (i1) -> i64
      %40 = "arith.index_cast"(%39) : (i64) -> index
      %41 = "arith.muli"(%40, %21) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %42 = "arith.addi"(%arg8, %41) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%30, %37, %42) : (f64, index, index) -> ()
    }) : (f64, index, index) -> (f64, index, index)
    "func.return"(%24#0) : (f64) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "entry"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xi64>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xf64>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xi64>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xf64>
    %4 = "memref.cast"(%0) : (memref<128xi64>) -> memref<?xi64>
    %5 = "memref.cast"(%1) : (memref<128xf64>) -> memref<?xf64>
    %6 = "memref.cast"(%2) : (memref<128xi64>) -> memref<?xi64>
    %7 = "memref.cast"(%3) : (memref<128xf64>) -> memref<?xf64>
    %8:2 = "func.call"(%4, %5, %6, %7) <{callee = @fill_input_1}> : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>) -> (index, index)
    %9 = "func.call"(%4, %5, %6, %7, %8#0, %8#1) <{callee = @memref_dot_simple}> : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %10 = "func.call"(%4, %5, %6, %7, %8#0, %8#1) <{callee = @memref_dot_optimized}> : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %11 = "func.call"(%4, %5, %6, %7, %8#0, %8#1) <{callee = @memref_dot_while}> : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %12 = "func.call"(%4, %5, %6, %7, %8#0, %8#1) <{callee = @memref_dot_while_branchless}> : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %13:2 = "func.call"(%4, %5, %6, %7) <{callee = @fill_input_2}> : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>) -> (index, index)
    %14 = "func.call"(%4, %5, %6, %7, %13#0, %13#1) <{callee = @memref_dot_simple}> : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %15 = "func.call"(%4, %5, %6, %7, %13#0, %13#1) <{callee = @memref_dot_optimized}> : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %16 = "func.call"(%4, %5, %6, %7, %13#0, %13#1) <{callee = @memref_dot_while}> : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    %17 = "func.call"(%4, %5, %6, %7, %13#0, %13#1) <{callee = @memref_dot_while_branchless}> : (memref<?xi64>, memref<?xf64>, memref<?xi64>, memref<?xf64>, index, index) -> f64
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
    "memref.dealloc"(%0) : (memref<128xi64>) -> ()
    "memref.dealloc"(%1) : (memref<128xf64>) -> ()
    "memref.dealloc"(%2) : (memref<128xi64>) -> ()
    "memref.dealloc"(%3) : (memref<128xf64>) -> ()
    %18 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    "func.return"(%18) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

