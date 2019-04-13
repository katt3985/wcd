require "./lib_wlroots"
require "../wayland/display"
module Wlroots
    class Backend
        def self.autocreate(display : Wayland::Display)   
            ptr = LibWlroots.autocreate_backend(display.to_ptr, nil)
            raise "Failed to create backend" if ptr.nil?
            new(ptr)
        end
        def initialize (@pointer : LibWlroots::WlrBackend*)
        end

        def start
            LibWlroots.backend_start(@pointer)
        end

        def to_ptr
            @pointer
        end
    end
end