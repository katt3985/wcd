require "../wayland/lib_server"
module Wlroots
    @[Link("wlroots")]
    lib LibWlroots
        type WlrBackend = Void
        alias WlList = Wayland::LibServer::WlList
        alias WlListener = Wayland::LibServer::WlListener
        alias WlSignal = Wayland::LibServer::WlSignal
        alias WlDisplay = Wayland::LibServer::WlDisplay

        fun autocreate_backend = wlr_backend_autocreate(display : WlDisplay*, renderer : Void*) : WlrBackend*?

        fun backend_start = wlr_backend_start(backend: WlrBackend*) : Bool


        struct WlrOuputMode
            flags : UInt32
            width, height, refresh : Int32
            link : WlList
        end

        struct WlrOutputCursorEmbedded
            destroy : WlSignal
        end

        struct WlrOutputCursor
            output : WlrOuput*
            x, y   : Float64
            enabled, visible : Bool
            width, height : UInt32
            hotspot_x,hotspot_y : Int32
            link : WlList
            # struct wlr_texture *texture;
            texture : Void*
            # struct wlr_surface *surface;
            surface : Void*
            surface_commit, surface_destroy : WlListener
            events : WlrOutputCursorEmbedded
        end

        struct PixmanBox32
            x1, y1, x2, y2 : Int32
        end

        struct PixmanRegion32
            extends : PixmanBox32
            data : Void*
        end

        struct WlrOuputEvents
            #     // Request to render a frame
            #     struct wl_signal frame;
            frame : WlSignal
            #     // Emitted when buffers need to be swapped (because software cursors or
            #     // fullscreen damage or because of backend-specific logic)
            #     struct wl_signal needs_swap;
            needs_swap : WlSignal
            #     // Emitted right before buffer swap
            #     struct wl_signal swap_buffers; // wlr_output_event_swap_buffers
            swap_buffers : WlSignal
            #     // Emitted right after the buffer has been presented to the user
            #     struct wl_signal present; // wlr_output_event_present
            present : WlSignal
            #     struct wl_signal enable;
            enable : WlSignal
            #     struct wl_signal mode;
            mode : WlSignal
            #     struct wl_signal scale;
            scale : WlSignal
            #     struct wl_signal transform;
            transform : WlSignal
            #     struct wl_signal destroy;
            destroy : WlSignal
        end

        struct WlrOuput
            # const struct wlr_output_impl *impl;
            # wlr_output_impl is likly private
            impl : Void*
            # struct wlr_backend *backend;
            backend : WlrBackend*
            # struct wl_display *display;
            display : WlDisplay*
  
            # struct wl_global *global;
            global : Void*
            # struct wl_list resources;
            resources : WlList
            
            name : UInt8[24]
            make : UInt8[56]
            model : UInt8[16]
            serial : UInt8[16]
   
            phys_width, phys_height : Int32 # mm

        
            # // Note: some backends may have zero modes
            # struct wl_list modes;
            # struct wlr_output_mode *current_mode;

            modes : WlList
            current_mode : WlrOuputMode*
   
            # int32_t width, height;
            # int32_t refresh; // mHz, may be zero

            width,height : Int32
            refresh : Int32
        
            # bool enabled;
            # float scale;
            # enum wl_output_subpixel subpixel;
            # enum wl_output_transform transform;

            enabled : Bool
            scale : Float32
            subpixel : UInt32
            transform : UInt32
    

        
            # bool needs_swap;
            # // damage for cursors and fullscreen surface, in output-local coordinates
            # pixman_region32_t damage;
            # bool frame_pending;
            # float transform_matrix[9];

            needs_swap : Bool
            damage : PixmanRegion32
            frame_pending : Bool
            transform_matrix : Float32[9]
        
            # struct wl_event_source *idle_frame;
            events : WlrOuputEvents
            idle_frame : Void*

            # struct wl_list cursors; // wlr_output_cursor::link
            cursors : WlList
 
            # struct wlr_output_cursor *hardware_cursor;
            hardware_cursor : WlrOutputCursor*

            # int software_cursor_locks; // number of locks forcing software cursors
            software_cursor_locks : Int32
 
            # // the output position in layout space reported to clients
            # int32_t lx, ly;
            lx , ly : Int32
            # struct wl_listener display_destroy;
            display_destroy : WlListener

            # void *data;
            data : Void*
        end
    end
end