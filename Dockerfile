FROM asozontov/ruby-postgres:2.3

CMD puma -C config/puma.rb
