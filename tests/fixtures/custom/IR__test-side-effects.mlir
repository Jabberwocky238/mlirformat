#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @side_effect(%arg0: index) {
    %0 = "test.side_effect_op"() : () -> i32
    %1 = "test.side_effect_op"() {effects = [{effect = "read"}, {effect = "free"}]} : () -> i32
    %2 = "test.side_effect_op"() {effects = [{effect = "write", test_resource}]} : () -> i32
    %3 = "test.side_effect_op"() {effects = [{effect = "allocate", on_result, test_resource}]} : () -> i32
    %4 = "test.side_effect_op"() {effects = [{effect = "read", on_reference = @foo_ref, test_resource}]} : () -> i32
    %5 = "test.side_effect_op"() {effect_parameter = #map} : () -> i32
    %6 = "test.unregistered_side_effect_op"() {effect_parameter = #map} : () -> i32
    %7 = test.side_effect_with_region_op(%arg0) {
    ^bb0(%arg1: index):
      test.region_yield %arg1 : index
    } {effects = [{effect = "allocate", on_operand, test_resource}]} : index -> index
    %8 = test.side_effect_with_region_op(%arg0) {
    ^bb0(%arg1: index):
      test.region_yield %arg1 : index
    } {effects = [{effect = "allocate", on_result, test_resource}]} : index -> index
    %9 = test.side_effect_with_region_op(%arg0) {
    ^bb0(%arg1: index):
      test.region_yield %arg1 : index
    } {effects = [{effect = "allocate", on_argument, test_resource}]} : index -> index
    return
  }
}

