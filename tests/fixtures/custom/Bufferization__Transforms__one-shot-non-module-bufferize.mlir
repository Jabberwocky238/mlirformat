module {
  "test.symbol_scope_isolated"() ({
    func.func @inner_func(%arg0: tensor<?xf32>) -> (tensor<?xf32>, f32) {
      %cst = arith.constant 1.000000e+00 : f32
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %inserted = tensor.insert %cst into %arg0[%c0] : tensor<?xf32>
      %extracted = tensor.extract %inserted[%c1] : tensor<?xf32>
      return %inserted, %extracted : tensor<?xf32>, f32
    }
    func.func @call_func_with_non_tensor_return(%arg0: tensor<?xf32> {bufferization.writable = true}) -> (f32, tensor<?xf32>) {
      %0:2 = call @inner_func(%arg0) : (tensor<?xf32>) -> (tensor<?xf32>, f32)
      return %0#1, %0#0 : f32, tensor<?xf32>
    }
    "test.finish"() : () -> ()
  }) : () -> ()
}

