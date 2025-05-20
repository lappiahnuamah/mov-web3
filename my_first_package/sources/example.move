module my_first_package::example;


public struct Sword has key, store{
    id: UID,
    magic: u64,
    strength: u64,
}

public struct Forge has key {
    id: UID,
    swords_created: u64,
}


fun init(ctx: &mut TxContext) {
    let admin = Forge {
        id: object::new(ctx),
        swords_created: 0,
    };

    //Transfer the admin object to the sender
    transfer::transfer(admin, tx_context::sender(ctx));
}


public fun magic(self: &Sword): u64 {
    self.magic
}


public fun strength(self: &Sword): u64 {
    self.strength
}


public fun swords_created(self: &Forge): u64 {
    self.swords_created
}


#[test]
fun test_sword_create() {

    //Create a dummy TxContext for testing
    let mut ctx = tx_context::dummy();

    // Create a new sword
    let sword = Sword {
        id: object::new(&mut ctx),
        magic: 42,
        strength: 7,
    };

    //Check if accessor function return correct values
    assert!(sword.magic() == 42 && sword.strength() == 7, 1);


    // Transfer the sword to consume it, avoiding unused value error
    transfer::transfer(sword, tx_context::sender(&ctx));
}