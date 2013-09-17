require 'rails/generators'
require 'pathname'

module Flatuipro
  module Generators
    class AppInstallGenerator < Rails::Generators::Base
      desc "Install to rails app 'vendor' directory"
      source_root File.expand_path("../../../../../vendor/assets", __FILE__)

      # Detect if Flat UI Pro assets copied over to gem
      def check_flatuipro_install
        unless File.exist?(File.expand_path("../../../../../vendor/assets", __FILE__))
          raise "Please run install generator first"
        end
      end

      def copy_to_vendor
        directory "fonts",        "vendor/assets/fonts"
        directory "images",       "vendor/assets/images"
        directory "javascripts",  "vendor/assets/javascripts"
        if File.exist?("less")
          directory "less",       "vendor/assets/less"
        end
      end
    end
  end
end