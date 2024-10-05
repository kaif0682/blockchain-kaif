module MyModule::RealEstateTokenizer {

    use aptos_framework::signer;
    use std::vector;

    /// Struct representing a tokenized real estate property.
    struct PropertyToken has store, key {
        owner: address,          // Address of the property owner
        property_name: vector<u8>, // Name or identifier for the property
        total_shares: u64,       // Total shares representing the property
        available_shares: u64,   // Shares available for purchase
        rental_income_per_share: u64, // Rental income per share
    }

    /// Function for an owner to tokenize their property.
    public fun tokenize_property(owner: &signer, property_name: vector<u8>, total_shares: u64, rental_income_per_share: u64) {
        let property = PropertyToken {
            owner: signer::address_of(owner),
            property_name,
            total_shares,
            available_shares: total_shares,
            rental_income_per_share,
        };
        move_to(owner, property);
    }

    /// Function for an investor to purchase shares of a tokenized property.
    public fun purchase_shares(investor: &signer, owner_address: address, shares_to_buy: u64) acquires PropertyToken {
        let property = borrow_global_mut<PropertyToken>(owner_address);

        // Ensure there are enough shares available
        assert!(property.available_shares >= shares_to_buy, 1);

        // Update the available shares
        property.available_shares = property.available_shares - shares_to_buy;

        // Payment and share transfer are assumed to be handled off-chain
    }
}
