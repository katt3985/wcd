require "./lib_wlroots"
module Wlroots
    class Output
        def initialize (@pointer : LibWlroots::WlrBackend*)
        end
    end
end