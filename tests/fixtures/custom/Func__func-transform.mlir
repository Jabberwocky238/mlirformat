module {
  func.func @basic_cast_and_call() {
    "test.foo"() : () -> ()
    return
  }
  func.func @second() {
    "test.bar"() : () -> ()
    return
  }
  func.func private @third()
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:3 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["test.foo"]} in %1#0 : (!transform.any_op) -> !transform.any_op
      %3 = transform.func.cast_and_call @second before %2 : (!transform.any_op) -> !transform.any_op
      %4 = transform.func.cast_and_call %1#2 after %2 : (!transform.any_op, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @non_empty_arg_and_out(%arg0: index) -> i32 {
    %0 = "test.foo"(%arg0) : (index) -> index
    %1 = "test.bar"(%0) : (index) -> i32
    return %1 : i32
  }
  func.func private @second(index) -> i32
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["test.foo"]} in %1#0 : (!transform.any_op) -> !transform.any_op
      %3 = transform.structured.match ops{["test.bar"]} in %1#0 : (!transform.any_op) -> !transform.any_op
      %4 = transform.get_result %2[0] : (!transform.any_op) -> !transform.any_value
      %5 = transform.get_result %3[0] : (!transform.any_op) -> !transform.any_value
      %6 = transform.func.cast_and_call %1#1(%4) -> %5 before %3 : (!transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @multi_arg_and_result(%arg0: index) -> (index, index) {
    %0 = "test.foo"(%arg0) : (index) -> index
    %1 = "test.bar"(%0) : (index) -> index
    %2 = "test.bar"(%0) : (index) -> index
    return %1, %2 : index, index
  }
  func.func private @second(index, index) -> (index, index)
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["test.foo"]} in %1#0 : (!transform.any_op) -> !transform.any_op
      %3 = transform.structured.match ops{["test.bar"]} in %1#0 : (!transform.any_op) -> !transform.any_op
      %4 = transform.get_result %2[0] : (!transform.any_op) -> !transform.any_value
      %5 = transform.get_result %2[0] : (!transform.any_op) -> !transform.any_value
      %6 = transform.merge_handles %4, %5 : !transform.any_value
      %7 = transform.get_result %3[0] : (!transform.any_op) -> !transform.any_value
      %8 = transform.func.cast_and_call %1#1(%6) -> %7 after %2 : (!transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @nested_call() {
    %0 = "test.arg"() : () -> index
    "test.foo"() ({
      "test.bar"(%0) : (index) -> ()
    }) : () -> ()
  }
  func.func private @second(index)
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.structured.match ops{["test.arg"]} in %1#0 : (!transform.any_op) -> !transform.any_op
      %3 = transform.structured.match ops{["test.bar"]} in %1#0 : (!transform.any_op) -> !transform.any_op
      %4 = transform.get_result %2[0] : (!transform.any_op) -> !transform.any_value
      %5 = transform.func.cast_and_call %1#1(%4) before %3 : (!transform.any_op, !transform.any_value, !transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  module {
    func.func private @func_with_reverse_order_no_result_no_calls(%arg0: memref<1xi8, 1>, %arg1: memref<2xi8, 1>, %arg2: memref<3xi8, 1>) {
      %c0 = arith.constant 0 : index
      %view = memref.view %arg0[%c0][] : memref<1xi8, 1> to memref<1xi8, 1>
      %view_0 = memref.view %arg1[%c0][] : memref<2xi8, 1> to memref<2xi8, 1>
      %view_1 = memref.view %arg2[%c0][] : memref<3xi8, 1> to memref<3xi8, 1>
      return
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_parent_op %0 : (!transform.any_op) -> !transform.any_op
      %transformed_module, %transformed_function = transform.func.replace_func_signature @func_with_reverse_order_no_result_no_calls args_interchange = [0, 2, 1] results_interchange = [] at %1 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  module {
    func.func private @func_with_reverse_order_no_result(%arg0: memref<1xi8, 1>, %arg1: memref<2xi8, 1>, %arg2: memref<3xi8, 1>) {
      %c0 = arith.constant 0 : index
      %view = memref.view %arg0[%c0][] : memref<1xi8, 1> to memref<1xi8, 1>
      %view_0 = memref.view %arg1[%c0][] : memref<2xi8, 1> to memref<2xi8, 1>
      %view_1 = memref.view %arg2[%c0][] : memref<3xi8, 1> to memref<3xi8, 1>
      return
    }
    func.func @func_with_reverse_order_no_result_caller(%arg0: memref<1xi8, 1>, %arg1: memref<2xi8, 1>, %arg2: memref<3xi8, 1>) {
      call @func_with_reverse_order_no_result(%arg0, %arg1, %arg2) : (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> ()
      return
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.get_parent_op %1#0 : (!transform.any_op) -> !transform.any_op
      %transformed_module, %transformed_function = transform.func.replace_func_signature @func_with_reverse_order_no_result args_interchange = [0, 2, 1] results_interchange = [] at %2 {adjust_func_calls} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  module {
    func.func private @func_with_reverse_order(%arg0: memref<1xi8, 1>, %arg1: memref<2xi8, 1>, %arg2: memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>) {
      %c0 = arith.constant 0 : index
      %view = memref.view %arg0[%c0][] : memref<1xi8, 1> to memref<1xi8, 1>
      %view_0 = memref.view %arg1[%c0][] : memref<2xi8, 1> to memref<2xi8, 1>
      %view_1 = memref.view %arg2[%c0][] : memref<3xi8, 1> to memref<3xi8, 1>
      return %view, %view_0 : memref<1xi8, 1>, memref<2xi8, 1>
    }
    func.func @func_with_reverse_order_caller(%arg0: memref<1xi8, 1>, %arg1: memref<2xi8, 1>, %arg2: memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>) {
      %0:2 = call @func_with_reverse_order(%arg0, %arg1, %arg2) : (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>)
      return %0#0, %0#1 : memref<1xi8, 1>, memref<2xi8, 1>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.get_parent_op %1#0 : (!transform.any_op) -> !transform.any_op
      %transformed_module, %transformed_function = transform.func.replace_func_signature @func_with_reverse_order args_interchange = [0, 2, 1] results_interchange = [1, 0] at %2 {adjust_func_calls} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  module {
    func.func private @func_with_reverse_order_with_attr(%arg0: memref<1xi8, 1>, %arg1: memref<2xi8, 1> {transform.readonly}, %arg2: memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>) {
      %c0 = arith.constant 0 : index
      %view = memref.view %arg0[%c0][] : memref<1xi8, 1> to memref<1xi8, 1>
      %view_0 = memref.view %arg1[%c0][] : memref<2xi8, 1> to memref<2xi8, 1>
      %view_1 = memref.view %arg2[%c0][] : memref<3xi8, 1> to memref<3xi8, 1>
      return %view, %view_0 : memref<1xi8, 1>, memref<2xi8, 1>
    }
    func.func @func_with_reverse_order_with_attr_caller(%arg0: memref<1xi8, 1>, %arg1: memref<2xi8, 1>, %arg2: memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>) {
      %0:2 = call @func_with_reverse_order_with_attr(%arg0, %arg1, %arg2) : (memref<1xi8, 1>, memref<2xi8, 1>, memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>)
      return %0#0, %0#1 : memref<1xi8, 1>, memref<2xi8, 1>
    }
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = transform.get_parent_op %1#0 : (!transform.any_op) -> !transform.any_op
      %transformed_module, %transformed_function = transform.func.replace_func_signature @func_with_reverse_order_with_attr args_interchange = [0, 2, 1] results_interchange = [1, 0] at %2 {adjust_func_calls} : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @func_with_duplicate_args(%arg0: memref<1xi8, 1>, %arg1: memref<2xi8, 1>, %arg2: memref<1xi8, 1>) {
    %c0 = arith.constant 0 : index
    %view = memref.view %arg0[%c0][] : memref<1xi8, 1> to memref<1xi8, 1>
    %view_0 = memref.view %arg1[%c0][] : memref<2xi8, 1> to memref<2xi8, 1>
    %view_1 = memref.view %arg2[%c0][] : memref<1xi8, 1> to memref<1xi8, 1>
    return
  }
  func.func @func_with_duplicate_args_caller(%arg0: memref<1xi8, 1>, %arg1: memref<2xi8, 1>) {
    call @func_with_duplicate_args(%arg0, %arg1, %arg0) : (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>) -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %transformed_module, %transformed_function = transform.func.deduplicate_func_args @func_with_duplicate_args at %arg0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @func_with_complex_duplicate_args(%arg0: memref<1xi8, 1>, %arg1: memref<2xi8, 1>, %arg2: memref<1xi8, 1>, %arg3: memref<3xi8, 1>, %arg4: memref<2xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>, memref<3xi8, 1>, memref<2xi8, 1>) {
    %c0 = arith.constant 0 : index
    %view = memref.view %arg0[%c0][] : memref<1xi8, 1> to memref<1xi8, 1>
    %view_0 = memref.view %arg1[%c0][] : memref<2xi8, 1> to memref<2xi8, 1>
    %view_1 = memref.view %arg2[%c0][] : memref<1xi8, 1> to memref<1xi8, 1>
    %view_2 = memref.view %arg3[%c0][] : memref<3xi8, 1> to memref<3xi8, 1>
    %view_3 = memref.view %arg4[%c0][] : memref<2xi8, 1> to memref<2xi8, 1>
    return %view, %view_0, %view_1, %view_2, %view_3 : memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>, memref<3xi8, 1>, memref<2xi8, 1>
  }
  func.func @func_with_complex_duplicate_args_caller(%arg0: memref<1xi8, 1>, %arg1: memref<2xi8, 1>, %arg2: memref<3xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>, memref<3xi8, 1>, memref<2xi8, 1>) {
    %0:5 = call @func_with_complex_duplicate_args(%arg0, %arg1, %arg0, %arg2, %arg1) : (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>, memref<3xi8, 1>, memref<2xi8, 1>) -> (memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>, memref<3xi8, 1>, memref<2xi8, 1>)
    return %0#0, %0#1, %0#2, %0#3, %0#4 : memref<1xi8, 1>, memref<2xi8, 1>, memref<1xi8, 1>, memref<3xi8, 1>, memref<2xi8, 1>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %transformed_module, %transformed_function = transform.func.deduplicate_func_args @func_with_complex_duplicate_args at %arg0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

