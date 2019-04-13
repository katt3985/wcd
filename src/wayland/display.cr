require "./lib_server"
module Wayland
    class Display
        def self.new
            ptr = LibServer.display_create
            raise "error creating display" if ptr.nil?
            new(ptr)
        end

        def initialize(@display_pointer : LibServer::WlDisplay*)
        end
        #TODO: wrap event loop
        def get_event_loop
            LibServer.display_get_event_loop(@display_pointer)
        end

        def destroy
            LibServer.display_destroy(@display_pointer)
        end

        def run
            LibServer.display_run(@display_pointer)
        end

        def to_ptr
            @display_pointer
        end
    end
end