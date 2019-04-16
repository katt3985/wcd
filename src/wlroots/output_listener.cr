require "../wayland/lib_server"
module Wlroots
    class OutputListener
        def self.new

            container = Wayland::LibServer::WlListenerContainer.new
            con_ptr = Pointer(Wayland::LibServer::WlListenerContainer).malloc

            obj = new con_ptr
            container.parent = Box.box(obj)

            listener = Wayland::LibServer::WlListener.new
            listener.notify = ->notify_func(Wayland::LibServer::WlListener*, Void*)
            container.listener = listener
            con_ptr.value = container
            obj
        end

        def self.notify_func(listener : Wayland::LibServer::WlListener*, data : Void*)
            puts "hello"
        end

        def initialize(@ptr : Wayland::LibServer::WlListenerContainer*)
            # @container = Wayland::LibServer::WlListenerContainer.new
            # @container.@core = Wayland::LibServer::WlListener.new
            # @core.notify = ->OutputListener.callback
            # @stored_proc = nil
            # register
        end

        def test
            target = Pointer(Wayland::LibServer::WlListener).new(@ptr.address + 8)
            proc = target.value.notify
            proc.call(target, Pointer(Void).null)
        end


        # def notify(&block : Output ->)
        #     @stored_proc = block
        # end

        # def self.callback(self_ptr : Wayland::LibServer::WlListener*, data : Void*) : Void
        #     myself = @@identity_hash[self_ptr]
        #     myself.call_notify(target)
        # end

        # private def call_notify(target)
        #     @stored_proc.call(target)
        # end

        def finialize
            # remove
        end
    end
end