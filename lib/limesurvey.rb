require "limesurvey/version"
require "net/http"
require 'json'
module Limesurvey
    class API
      def initialize(service_url)
        @uri = URI.parse(service_url)
      end
     
      def method_missing(name, *args)
        post_body = { 'method' => name, 'params' => args, 'id' => 'jsonrpc' }.to_json
        resp = JSON.parse( http_post_request(post_body) )
        raise JSONRPCError, resp['error'] if resp['error']
        resp['result']
      end
     
      def http_post_request(post_body)
        http  = Net::HTTP.new(@uri.host, @uri.port)
        request = Net::HTTP::Post.new(@uri.request_uri)
        request.content_type = 'application/json'
        request.body = post_body
        http.request(request).body
      end
    end

    class JSONRPCError < RuntimeError; end
end
