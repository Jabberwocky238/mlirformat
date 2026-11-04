#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x8xf64, #sparse>) -> tensor<8x8xf64, #sparse>, sym_name = "add_only_where_nonzero"}> ({
  ^bb0(%arg0: tensor<8x8xf64, #sparse>):
    %0 = "arith.constant"() <{value = 2.000000e+00 : f64}> : () -> f64
    %1 = "linalg.generic"(%arg0) <{doc = "A(i,j) += 2.0 where A(i,j) != 0", indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f64):
      %2 = "sparse_tensor.unary"(%arg1) ({
      ^bb0(%arg2: f64):
        %3 = "arith.addf"(%arg2, %0) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "sparse_tensor.yield"(%3) : (f64) -> ()
      }, {
      }) : (f64) -> f64
      "linalg.yield"(%2) : (f64) -> ()
    }) : (tensor<8x8xf64, #sparse>) -> tensor<8x8xf64, #sparse>
    "func.return"(%1) : (tensor<8x8xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

