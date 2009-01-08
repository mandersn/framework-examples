ENV['TAZA_ENV'] = "isolation" if ENV['TAZA_ENV'].nil?
require 'rubygems'
$LOAD_PATH.unshift File.expand_path(ENV['TAZA_DEV'] + '/lib') if ENV['TAZA_DEV']
require 'taza'

module Depot
  include ForwardInitialization

  class Depot < ::Taza::Site
    class << self
      def reset_database
        Dir.chdir File.dirname(__FILE__) + '/../../../depot' do
          unless system 'mysql -u root -ppassword depot_development < db\product_data.sql'
            raise 'database error'
          end
        end
      end
    end
  end 
end
