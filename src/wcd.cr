require "./wayland/display"
require "./wlroots/output_listener"
require "./wlroots/backend"
# TODO: Write documentation for `Wcd`
module Wcd
  VERSION = "0.1.0"

  def self.run 
    display = Wayland::Display.new

    event_loop = display.get_event_loop

    backend = Wlroots::Backend.autocreate(display)

    unless backend.start
      STDERR.puts "Failed to start backend"
      display.destroy
    end

    display.run
    display.destroy


  end

  # def self.run2
  #   display = Wayland::Display.new

  #   event_loop = display.get_event_loop
  #   return if event_loop.nil?

  #   backend = Wlroots::LibWlroots.autocreate_backend(display.to_ptr, nil)
  #   return if backend.nil?

  #   unless Wlroots::LibWlroots.backend_start(backend)
  #     STDERR.puts "Failed to start backend"
  #     display.destroy
  #   end

  #   display.run
  #   display.destroy

  # end

  run
end
