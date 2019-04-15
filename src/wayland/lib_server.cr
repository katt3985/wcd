
module Wayland
    @[Link("wayland-server")]
    lib LibServer
        type WlEventLoop = Void*
        type WlPrivSignal = Void*
        type WlClient = Void*
        type WlGlobal = Void*

        enum WlOutputSubpixel
            WL_OUTPUT_SUBPIXEL_UNKNOWN = 0,
            WL_OUTPUT_SUBPIXEL_NONE = 1,
            WL_OUTPUT_SUBPIXEL_HORIZONTAL_RGB = 2,
            WL_OUTPUT_SUBPIXEL_HORIZONTAL_BGR = 3,
            WL_OUTPUT_SUBPIXEL_VERTICAL_RGB = 4, 
            WL_OUTPUT_SUBPIXEL_VERTICAL_BGR = 5
        end

        enum WlOutputTransform
            WL_OUTPUT_TRANSFORM_NORMAL = 0,
            WL_OUTPUT_TRANSFORM_90 = 1,
            WL_OUTPUT_TRANSFORM_180 = 2,
            WL_OUTPUT_TRANSFORM_270 = 3,
            WL_OUTPUT_TRANSFORM_FLIPPED = 4,
            WL_OUTPUT_TRANSFORM_FLIPPED_90 = 5,
            WL_OUTPUT_TRANSFORM_FLIPPED_180 = 6,
            WL_OUTPUT_TRANSFORM_FLIPPED_270 = 7
        end

        alias SizeT = UInt64 

        fun display_create = wl_display_create : WlDisplay*?

        fun display_get_event_loop = wl_display_get_event_loop(display : WlDisplay*) : WlEventLoop?

        fun display_destroy = wl_display_destroy(display : WlDisplay*) : Void 

        fun display_run = wl_display_run(display : WlDisplay*) : NoReturn

        fun wl_signal_add (signal : Void*, listener : WlListener*)

        struct WlSignal
            listener_list : WlList
        end

        struct WlListener 
            link : WlList
            notify : WlListener*, Void* -> Void
        end

        struct WlList
            prev : WlList*
            next : WlList*
        end

        struct WlArray
            # size_t size
            size : SizeT
            # size_t alloc
            alloc : SizeT
            # void* data
            data : Void*
        end

        struct WlDisplay
            # struct wl_event_loop * 	loop
            loop : WlEventLoop
            # int run
            run : Int32
            # uint32_t 	id
            id : UInt32
            # uint32_t 	serial
            serial : UInt32
            # struct wl_list 	registry_resource_list
            registry_resource_list : WlList
            # struct wl_list 	global_list
            global_list : WlList
            # struct wl_list 	socket_list
            socket_list : WlList
            # struct wl_list 	client_list
            client_list : WlList
            # struct wl_list 	protocol_loggers
            protocol_loggers : WlList
            # struct wl_priv_signal 	destroy_signal
            destroy_signal : WlPrivSignal
            # struct wl_priv_signal 	create_client_signal
            create_client_signal : WlPrivSignal
            # struct wl_array 	additional_shm_formats
            additional_shm_formats : WlArray
            # wl_display_global_filter_func_t 	global_filter
            global_filter : WlClient, WlGlobal, Void* -> Bool
            # void * 	global_filter_data
            global_filter_data : Void*
        end
        # struct WlObject
        #     interface : WlInterface*
        #     implementation : Void*
        #     id : UInt32
        # end
        # struct WlResource
	    #     object : WlObject
	    #     destroy : wl_resource_destroy_func_t
	    #     link : struct wl_list
	    #     destroy_signal : struct wl_signal
	    #     client : struct wl_client*
	    #     data : Void*
        # end
        
    end
end