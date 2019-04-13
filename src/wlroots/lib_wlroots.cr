require "../wayland/lib_server"
module Wlroots
    @[Link("wlroots")]
    lib LibWlroots
        type WlrBackend = Void
        alias WlDisplay = Wayland::LibServer::WlDisplay*

        fun autocreate_backend = wlr_backend_autocreate(display : WlDisplay, renderer : Void*) : WlrBackend*?

        fun backend_start = wlr_backend_start(backend: WlrBackend*) : Bool
    end
end