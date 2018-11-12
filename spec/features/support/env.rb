Capybara.register_driver(:headless_chrome) do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      # Add 'no-sandbox' arg if you have an "unknown error: Chrome failed to start: exited abnormally"
      # @see https://github.com/SeleniumHQ/selenium/issues/4961
      chromeOptions: { args: %w[headless disable-gpu no-sandbox] }
  )

  Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
end

Capybara.javascript_driver = :headless_chrome