require 'nokogiri'

module Models
  class Version
    attr_accessor :versions
 
    attr_accessor :versions_for_new_build

    def initialize
      #get the repose versions
      @versions = []
      @versions_for_new_build = ['2.8.0']

      #http://maven.research.rackspacecloud.com/content/repositories/releases/com/rackspace/papi/papi/maven-metadata.xml
      url = 'http://maven.research.rackspacecloud.com/content/repositories/releases/com/rackspace/papi/papi/maven-metadata.xml'
      xml_data = Net::HTTP.get_response(URI.parse(url)).body
      doc = Nokogiri.XML(xml_data)
      doc.xpath('//version').each do |version|
        @versions << version
      end
    end

    def get_versions_available_for_new_build 
      @versions_for_new_build
    end

    def get_versions_for_testing
      @versions
    end
  end
end
