require "./lib_server"
module Wayland
    class EventLoop
        def initialize (@pointer : LibServer::WlEventLoop)
        end
    end    
end