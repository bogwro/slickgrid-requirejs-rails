require 'fileutils'

namespace :slickgrid do
  desc 'Update SlickGrid library'
  task :update => 'tmp/SlickGrid' do
    cd 'tmp/SlickGrid' do
      js_files = Dir.glob('*.js') +
          Dir.glob('plugins/*.js') +
          Dir.glob('controls/*.js')

      js_files.each do |file|
        mkdir_p "../../vendor/assets/javascripts/slick/#{File.dirname(file)}" unless File.dirname(file) == '.'
        cp file, "../../vendor/assets/javascripts/slick/#{file}"
      end

      css_files = Dir.glob('*.css') +
          Dir.glob('plugins/*.css') +
          Dir.glob('controls/*.css')

      css_files.each do |file|
        mkdir_p "../../vendor/assets/stylesheets/slick/#{File.dirname(file)}"
        sh "cp #{file} ../../vendor/assets/stylesheets/slick/#{file}"
      end
    end

    FileUtils.rm_r 'tmp'
  end

  file 'tmp/SlickGrid' do
    mkdir_p 'tmp'
    cd 'tmp' do
      sh 'git clone https://github.com/jsm222/SlickGrid.git'
    end
  end
end
