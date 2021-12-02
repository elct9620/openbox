# Openbox

![main branch](https://github.com/elct9620/openbox/actions/workflows/main.yml/badge.svg?branch=main)

The zero-configuration Ruby container entry-point.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'openbox'
```

And then execute:

    $ bundle install

## Usage

Create `openbox` binstus to allow container use it as entrypoint

```bash
bundle binstubs openbox
```

Modify your `Dockerfile` to use it as `entrypoint`

```dockerfile
ENTRYPOINT ["bin/openbox"]
CMD ["server"]
```

### Commands

The commands are pre-defined for the Rack and Rails applications.

| Name      | Enabled Condition | Description              |
|-----------|-------------------|--------------------------|
| `server`  | `rails` or `rack` | Start application server |
| `rake`    | `rails` or `rake` | Run rake tasks           |
| `console` | `rails`           | Start rails console      |
| `migrate` | `rails`           | Run database migration   |
| `seed`    | `rails`           | Run database seed        |
| `sidekiq` | `sidekiq`         | Run sidekiq server       |

### Environments

| Name             | Description                                                                          |
|------------------|--------------------------------------------------------------------------------------|
| `AUTO_MIGRATION` | When present, the `migrate` will run before `server` started                         |
| `DATABASE_URL`   | When `pg` or `mysql2` gem present, Openbox will use it to ensure database connection |

## Roadmap

* [ ] `config/openbox.rb` config
* [ ] Customize command
* [x] Database connection check
  * [x] PostgreSQL support
  * [x] MySQL support
* [x] Run Web Server
  * [x] `rails server`
  * [x] `rackup -o 0.0.0.0`
* [x] Rake Task support
* [x] Sidekiq support
* [x] Rails capability
  * [x] `openbox console` to `rails console`
  * [x] `openbox migrate` to `rails db:migrate`
  * [x] `openbox seed` to `rails db:seed`
  * [x] Use `AUTO_MIGRATION` to run migration before server started


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/elct9620/openbox. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/elct9620/openbox/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Openbox project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/elct9620/openbox/blob/main/CODE_OF_CONDUCT.md).
