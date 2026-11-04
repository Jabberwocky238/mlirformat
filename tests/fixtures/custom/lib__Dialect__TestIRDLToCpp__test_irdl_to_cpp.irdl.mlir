module {
  irdl.dialect @test_irdl_to_cpp {
    irdl.type @foo 
    irdl.operation @bar {
      %0 = irdl.any
      irdl.results(res: %0)
    }
    irdl.operation @beef {
      %0 = irdl.any
      irdl.operands(lhs: %0, rhs: %0)
      irdl.results(res: %0)
    }
    irdl.operation @hash {
      %0 = irdl.any
      irdl.operands(lhs: %0, rhs: %0)
      irdl.results(res: %0)
    }
    irdl.operation @conditional {
      %0 = irdl.region
      %1 = irdl.region()
      %2 = irdl.any
      %3 = irdl.region(%2)
      irdl.regions(cond: %3, then: %0, else: %1)
      %4 = irdl.any
      irdl.operands(input: %4)
    }
  }
}

