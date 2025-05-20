module my_first_package::certificate;


public struct Certificate has key, store {
    id: UID, 
    title: vector<u8>,
    holder: address,
}

public fun create_certificate(title: vector<u8>, ctx: &mut TxContext){
    let certificate = Certificate {
        id: object::new(ctx),
        title,
        holder: ctx.sender()
    };
    transfer::transfer(certificate, ctx.sender());
}


public fun get_certificate_title(certificate: &Certificate): vector<u8> {
    certificate.title
}

public fun get_certificate_holder(certificate: &Certificate): address {
    certificate.holder
}

#[test]
fun test_create_certificate() {
    // Create a dummy TxContext for testing
    let mut ctx = tx_context::dummy();

    // Create a new certificate
    let title = b"Certificate of Completion";

    let certificate = Certificate {
        id: object::new(&mut ctx),
        title,
        holder: tx_context::sender(&ctx)
    };

    // Check if accessor function returns correct values
    assert!(get_certificate_title(&certificate) == b"Certificate of Completion", 1);
    
    // Transfer the certificate to consume it, avoiding unused value error
    transfer::transfer(certificate, tx_context::sender(&ctx));
}

