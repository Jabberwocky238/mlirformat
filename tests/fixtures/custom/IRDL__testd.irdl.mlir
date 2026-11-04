module {
  irdl.dialect @testd {
    irdl.type @parametric {
      %0 = irdl.any
      irdl.parameters(foo: %0)
    }
    irdl.attribute @parametric_attr {
      %0 = irdl.any
      irdl.parameters(foo: %0)
    }
    irdl.type @attr_in_type_out {
      %0 = irdl.any
      irdl.parameters(foo: %0)
    }
    irdl.operation @eq {
      %0 = irdl.is i32 
      irdl.results(foo: %0)
    }
    irdl.operation @anyof {
      %0 = irdl.is i32 
      %1 = irdl.is i64 
      %2 = irdl.any_of(%0, %1) 
      irdl.results(foo: %2)
    }
    irdl.operation @all_of {
      %0 = irdl.is i32 
      %1 = irdl.is i64 
      %2 = irdl.any_of(%0, %1) 
      %3 = irdl.all_of(%2, %1) 
      irdl.results(foo: %3)
    }
    irdl.operation @any {
      %0 = irdl.any
      irdl.results(foo: %0)
    }
    irdl.operation @dyn_type_base {
      %0 = irdl.base @testd::@parametric 
      irdl.results(foo: %0)
    }
    irdl.operation @dyn_attr_base {
      %0 = irdl.base @testd::@parametric_attr 
      irdl.attributes {"attr1" = %0}
    }
    irdl.operation @named_type_base {
      %0 = irdl.base "!builtin.integer" 
      irdl.results(foo: %0)
    }
    irdl.operation @named_attr_base {
      %0 = irdl.base "#builtin.integer" 
      irdl.attributes {"attr1" = %0}
    }
    irdl.operation @dynparams {
      %0 = irdl.is i32 
      %1 = irdl.is i64 
      %2 = irdl.any_of(%0, %1) 
      %3 = irdl.parametric @testd::@parametric<%2> 
      irdl.results(foo: %3)
    }
    irdl.operation @constraint_vars {
      %0 = irdl.is i32 
      %1 = irdl.is i64 
      %2 = irdl.any_of(%0, %1) 
      irdl.results(foo: %2, bar: %2)
    }
    irdl.operation @attrs {
      %0 = irdl.is i32 
      %1 = irdl.is i64 
      irdl.attributes {"attr1" = %0, "attr2" = %1}
    }
    irdl.operation @regions {
      %0 = irdl.region
      %1 = irdl.is i32 
      %2 = irdl.is i64 
      %3 = irdl.region(%1, %2)
      %4 = irdl.region with size 3
      %5 = irdl.region()
      irdl.regions(foo: %0, bar: %3, baz: %4, qux: %5)
    }
    irdl.operation @region_and_operand {
      %0 = irdl.any
      %1 = irdl.region(%0)
      irdl.operands(foo: %0)
      irdl.regions(bar: %1)
    }
  }
}

