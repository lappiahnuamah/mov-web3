module book::drop_ability;

public struct IgnoreMe has drop {
    a: u8,
    b: u8,
}

public struct NoDrop{}

#[test]

fun test_ignore() {
    let no_drop = NoDrop{};
    let _ =  IgnoreMe{a: 1, b: 2};

    let NoDrop {} = no_drop;
    let IgnoreMe {a, b} = IgnoreMe{a: 1, b: 2};
    assert!(a == 1);
}