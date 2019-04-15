require "./lib_server"
require "./event_loop"
module Wayland
    class Display
        def self.new
            ptr = LibServer.display_create
            raise "error creating display" if ptr.nil?
            new(ptr)
        end

        def initialize(@display_pointer : LibServer::WlDisplay*)
        end
        def get_event_loop
            ptr = LibServer.display_get_event_loop(@display_pointer)
            raise "error creating event loop" if ptr.nil?
            EventLoop.new(ptr)
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