require "../wayland/lib_server"
module Wlroots
    class OutputListener
        @@identity_hash = {} of Wayland::LibServer::WlListener* => OutputListener
        def initialize 
            @core = Wayland::LibServer::WlListener.new
            @core.notify = ->OutputListener.callback
            @stored_proc = nil
            @@identity_hash[pointerof(@core)] = self
            # register
        end


        def notify(&block : Output ->)
            @stored_proc = block
        end

        def self.callback(self_ptr : LibServer::WlListener*, data : Void*) : Void
            myself = @@identity_hash[self_ptr]
            myself.call_notify(target)
        end

        private def call_notify(target)
            @stored_proc.call(target)
        end

        def finialize
            @@identity_hash.delete(pointerof(@core))
            # remove
        end
    end
end