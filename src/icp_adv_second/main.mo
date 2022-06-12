import IC "./ic";
import Principal "mo:base/Principal";

actor class () = self {
    public func create_canister() : async IC.canister_id {
        let settings = {
            freezing_threshold = null;
            controllers = ?[Principal.fromActor(self)];
            memory_allocation = null;
            compute_allocation = null;
        };
        let ic : IC.Self = actor("aaaaa-aa");
        let result = await ic.create_canister({ settings = ?settings; });
        result.canister_id
    };

    public func install_code(canister_id : IC.canister_id, wasm_module : IC.wasm_module) : async (){
        let ic : IC.Self = actor("aaaaa-aa");
        await ic.install_code ({
            arg = []; 
            wasm_module = wasm_module; 
            mode = #install;
            canister_id = canister_id;
        });
    };

    public func start_canister(canister_id : IC.canister_id) : async (){
        let ic : IC.Self = actor("aaaaa-aa");
        await ic.start_canister({canister_id = canister_id});
    };

    public func stop_canister(canister_id : IC.canister_id) : async (){
        let ic : IC.Self = actor("aaaaa-aa");
        await ic.stop_canister({canister_id = canister_id});
    };

    public func delete_canister(canister_id : IC.canister_id) : async (){
        let ic : IC.Self = actor("aaaaa-aa");
        await ic.delete_canister({canister_id = canister_id});
    };
};
