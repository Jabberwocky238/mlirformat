module {
  irdl.dialect @testd {
    irdl.type @singleton 
    irdl.type @parametrized {
      %0 = irdl.any
      %1 = irdl.is i32 
      %2 = irdl.is i64 
      %3 = irdl.any_of(%1, %2) 
      irdl.parameters(foo: %0, bar: %3)
    }
    irdl.operation @any {
      %0 = irdl.any
      irdl.results(foo: %0)
    }
  }
}

