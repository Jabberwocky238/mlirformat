#map = affine_map<()[s0] -> (50, -s0 + 100)>
#map1 = affine_map<()[s0] -> (100, s0 + 80)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (index, index), sym_name = "simplify_min_max"}> ({
    %2 = "test.some_op"() : () -> index
    %3 = "affine.min"(%2) <{map = #map}> : (index) -> index
    %4 = "affine.max"(%2) <{map = #map1}> : (index) -> index
    "func.return"(%3, %4) : (index, index) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["affine.min", "affine.max"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["test.some_op"]}> : (!transform.any_op) -> !transform.any_op
      "transform.affine.simplify_bounded_affine_ops"(%0, %1) <{lower_bounds = array<i64: 0>, upper_bounds = array<i64: 20>}> : (!transform.any_op, !transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0 * -32 + 1023, 32)>
#map1 = affine_map<()[s0, s1] -> (s0 - s1 * (s0 ceildiv 32), s0 ceildiv 32)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "simplify_min_sequence"}> ({
    %3 = "test.workgroup_id"() : () -> index
    %4 = "affine.min"(%3) <{map = #map}> : (index) -> index
    %5 = "test.thread_id"() : () -> index
    %6 = "affine.min"(%4, %5) <{map = #map1}> : (index, index) -> index
    "func.return"(%6) : (index) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["affine.min"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["test.workgroup_id"]}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.match"(%arg0) <{ops = ["test.thread_id"]}> : (!transform.any_op) -> !transform.any_op
      "transform.affine.simplify_bounded_affine_ops"(%0, %1, %2) <{lower_bounds = array<i64: 0, 0>, upper_bounds = array<i64: 31, 31>}> : (!transform.any_op, !transform.any_op, !transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
// -----
