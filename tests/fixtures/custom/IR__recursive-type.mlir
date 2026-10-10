!testrec = !test.test_rec<type_to_alias, test_rec<type_to_alias>>
!name = !test.test_rec_alias<name, !test.test_rec_alias<name>>
!name5 = !test.test_rec_alias<name5, !test.test_rec_alias<name3, !test.test_rec_alias<name4, !test.test_rec_alias<name5>>>>
!name2 = !test.test_rec_alias<name2, tuple<!test.test_rec_alias<name2>, i32>>
!name4 = !test.test_rec_alias<name4, !name5>
!name3 = !test.test_rec_alias<name3, !name4>
module {
  func.func @roundtrip() {
    %0 = "test.dummy_op_for_roundtrip"() : () -> !test.test_rec<a, test_rec<b, test_type>>
    %1 = "test.dummy_op_for_roundtrip"() : () -> !test.test_rec<c, test_rec<c>>
    %2 = "test.dummy_op_for_roundtrip"() : () -> !testrec
    %3 = "test.dummy_op_for_roundtrip"() : () -> !name
    %4 = "test.dummy_op_for_roundtrip"() : () -> !name
    %5 = "test.dummy_op_for_roundtrip"() : () -> !name2
    %6 = "test.dummy_op_for_roundtrip"() : () -> !name2
    %7 = "test.dummy_op_for_roundtrip"() : () -> !name3
    %8 = "test.dummy_op_for_roundtrip"() : () -> !name4
    %9 = "test.dummy_op_for_roundtrip"() : () -> !name5
    return
  }
  func.func @create() {
    return
  }
}

