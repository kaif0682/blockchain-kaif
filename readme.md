![Screenshot 2024-10-04 113545](https://github.com/user-attachments/assets/72695358-b4f0-486d-bb1b-1e145993c34a)

[package]
name = "send_message"
version = "1.0.0"
authors = []

[addresses]
MyModule = '0x5b1078affa8a933281b371957765b6efea1cab734d28a66f84ccf88f84b59fb0'
[dev-addresses]

[dependencies.AptosFramework]
git = "https://github.com/aptos-labs/aptos-core.git"
rev = "mainnet"
subdir = "aptos-move/framework/aptos-framework"

[dev-dependencies]
