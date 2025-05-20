// immutable reference
// mutable reference.

module my_first_package::reference{

    public struct Counter1 has key {
        id: UID,
        value: u64
    }


    public struct Counter2 has key {
        id: UID,
        value: u64
    }

    //mutable reference
    public fun counter_increment(counter: &mut Counter1) {
        counter.value = counter.value + 1;
    }


}
