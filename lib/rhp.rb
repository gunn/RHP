require "rack"
require "tilt"

module RHP
  class Server
    class << self
      def project_root=(path)
        @@project_root = path
      end
    
      def project_root
        @@project_root
      end
    
      def call(env)
        file_request = FileRequest.new(env["PATH_INFO"])
      
        [200, {"Content-Type" => file_request.mime_type}, [file_request.content]]
      end
    end
  end
  
  class FileRequest
    attr_accessor :request_path
    EXTENSIONS_REGEX = "\\.(#{Tilt.mappings.keys.join('|')})$"
    
    def initialize(path)
      # /pages/
      self.request_path = path.gsub(/\/$/, "/index.html").gsub(/^\//, "")
      self.request_path = "#{self.request_path}/index.html" if File.directory?(raw_file_path)
      # pages/index.html
    end
    
    def content
      if Tilt.mappings.keys.include?(extension)
        "Files with the .#{extension} extension may not be accessed directly."
      elsif File.file?(raw_file_path.to_s)
        File.read(raw_file_path)
      elsif File.file?(template_path.to_s)
        Tilt.new(template_path).render
      else
        "ERROR!"
      end
    end
    
    def mime_type
      Rack::Mime::mime_type(".#{extension}", "text/html")
    end
    
    protected
    
      def raw_file_path
        File.expand_path(request_path, Server.project_root)
        # /Users/.. ../site/public/pages/index.html
      end
      
      def template_path
        Dir.glob("#{raw_file_path}*").find do |file|
          /#{raw_file_path}#{EXTENSIONS_REGEX}/ === file
        end
        # /Users/.. ../site/public/pages/index.html.haml
      end
      
      def request_filename
        request_path.split("/").last
        # index.html
      end
    
      def template_extension
        template_path.split(".").last
        # haml
      end
    
      def extension
        request_filename.split(".").last
        # html
      end
    
  end
end
