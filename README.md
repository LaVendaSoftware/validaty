# Validaty

Validaty has basic validations for Rails application

## Installation

Add this line to your application's Gemfile:

```ru
gem "validaty", "~> 0.0.1"
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
bundle add validaty
```

## Usage

Imagine this schema:

```rb
create_table "pixes", force: :cascade do |t|
  t.uuid "public_id", null: false
  t.integer "kind"
  t.string "key", null: false
  t.boolean "accepted", null: false, default: false
  t.date "schedule_date", null: false
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end
```

You should validate this way:

```rb
class Pix < ApplicationRecord
  enum :kind, {cpf: 0, cnpj: 1, email: 2, phone: 3, evp: 4}

  validates :public_id, uuid: true
  validates :kind, presence: true
  validates :key, cpf: true, if: :cpf?
  validates :key, cnpj: true, if: :cnpj?
  validates :key, email: true, if: :email?
  validates :key, phone: {country_code: :phone_country}, if: :phone?
  validates :key, uuid: true, if: :evp?
  validates :accepted, boolean: true
  validates :schedule_date, date: true
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/validaty.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
