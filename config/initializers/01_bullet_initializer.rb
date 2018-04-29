# frozen_string_literal: true

require 'bullet'

configure :development, :test do
  Bullet.enable = true
  Bullet.bullet_logger = true
  use Bullet::Rack
end
