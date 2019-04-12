
module Wayland
    @[Link("wayland-server")]
    lib LibServer

    struct wl_object
        interface : wl_interface*
        implementation : void*
        id : UInt32
    end


    end
end