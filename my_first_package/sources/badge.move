module my_first_package::badge;

public struct Badge has key, store {
    id: UID,
    name: vector<u8>,
    owner: address
}

public fun create_badge(name: vector<u8>, ctx: &mut TxContext){
    let badge = Badge {
        id: object::new(ctx),
        name,
        owner: tx_context::sender(ctx),
    };
    transfer::transfer(badge, tx_context::sender(ctx));
}


public fun get_badge_owner(badge: &Badge): address {
    badge.owner
}

public fun get_badge_name(badge: &Badge): vector<u8> {
    badge.name
}