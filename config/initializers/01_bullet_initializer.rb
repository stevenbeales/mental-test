# frozen_string_literal: true

configure :development, :test do
  require 'bullet'
  Bullet.enable = true
  Bullet.bullet_logger = true
  use Bullet::Rack
end
