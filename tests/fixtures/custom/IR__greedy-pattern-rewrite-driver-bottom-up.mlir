module {
  func.func @add_to_worklist_after_inplace_update() {
    "test.any_attr_of_i32_str"() <{attr = 0 : i32}> : () -> ()
    return
  }
}

// -----
module {
  func.func @add_ancestors_to_worklist() {
    "test.one_region_op"() ({
      %0 = "foo.maybe_eligible_op"() : () -> index
      "foo.yield"(%0) : (index) -> ()
    }) {hoist_eligible_ops} : () -> ()
    return
  }
}

// -----
module {
  "test.symbol"() <{sym_name = "foo"}> : () -> ()
}

