module Presents
  VERSION = '1.0.0'
end

Dir.glob(File.dirname(__FILE__) + '/presents/*.rb') { |file| require file }
