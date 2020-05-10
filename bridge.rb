class WindowManager
  def initialize(platform_api)
    @platform_api = platform_api
  end

  def render_desktop
    @platform_api.render_desktop
  end

  def render_window
    @platform_api.render_window
  end

  def maximize_window
    @platform_api.maximize_window
  end

  def minimize_window
    @platform_api.minimize_window
  end

  def close_window
    @platform_api.render_desktop
  end
end

class LinuxWindowManager < WindowManager
  def initialize(platform_api)
    super
  end

  def clone_window
    @platform_api.close_window
  end

  def disable_menu_bar
    @platform_api.disable_menu_bar
  end
end

class BasePlatformInterface
  def render_desktop; end
  def render_window; end
  def maximize_window; end
  def minimize_window; end
  def close_window; end
end

class  DosKernelAPI < BasePlatformInterface
  def render_desktop
    puts 'render desktop in Windows'
  end

  def render_window
    puts 'render window in Windows'
  end

  def maximize_window
    puts 'maximize window in Windows'
  end

  def minimize_window
    puts 'minimize window in Windows'
  end

  def close_window
    puts 'close window in Windows'
  end
end

class LinuxKernelAPI < BasePlatformInterface
  def render_desktop
    puts 'render desktop in Linux'
  end

  def render_window
    puts 'render window in Linux'
  end

  def maximize_window
    puts 'maximize window in Linux'
  end

  def minimize_window
    puts 'minimize window in Linux'
  end

  def close_window
    puts 'close window in Linux'
  end

  # platform specific api calls
  def clone_window
    puts 'clone window in Linux'
  end

  def disable_menu_bar
    puts 'disable menu bar in Linux window'
  end
end

windows_platform = DosKernelAPI.new
linux_platform = LinuxKernelAPI.new

windows_wm = WindowManager.new(windows_platform)
linux_wm = LinuxWindowManager.new(linux_platform)

windows_wm.render_window
linux_wm.clone_window
