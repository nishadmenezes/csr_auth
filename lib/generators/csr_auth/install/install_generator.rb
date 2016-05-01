module CsrAuth
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def copy_files
      template "csr_auth.rb", File.join("config", "initializers", "csr_auth.rb")
    end

  end
end