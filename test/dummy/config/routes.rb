Rails.application.routes.draw do

  root to: 'examples#simple'

  mount SlickgridRequirejsRails::Engine => '/slickgrid-requirejs-rails'


end
