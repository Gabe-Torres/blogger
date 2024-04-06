<div align="center">
    <img src="https://github.com/Gabe-Torres/blogger/assets/127896538/30051cda-9337-4d42-86b0-fe8928560a42" alt="blogger">
</div>

![pull request](https://img.shields.io/github/issues-pr/gabe-torres/blogger)
[![website down](https://img.shields.io/website-up-down-green-red/http/monip.org.svg)](https://thawing-citadel-30877-e399d2943313.herokuapp.com/users/sign_in)

![Made with Ruby on Rails](https://img.shields.io/badge/Made%20with-Ruby%20on%20Rails-%23990000?style=for-the-badge&logo=ruby-on-rails&logoColor=white)


Technologies used:<br>
<div>
  <img src="https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white"/>
  <img src="https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white"/>
  <img src="https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white" />
  <img src="https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white"/>
  <img src="https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white"/>
  <img src="https://img.shields.io/badge/circleci-343434?style=for-the-badge&logo=circleci&logoColor=white"/>
  <img src="https://img.shields.io/badge/CSS-239120?&style=for-the-badge&logo=css3&logoColor=white" />
  <img src="https://img.shields.io/badge/HTML-239120?style=for-the-badge&logo=html5&logoColor=white" />
  <img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white" />
  <img src="https://img.shields.io/badge/Bootstrap-563D7C?style=for-the-badge&logo=bootstrap&logoColor=white" />
  <img src="https://img.shields.io/badge/Visual_Studio_Code-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white" />
  <img src="https://img.shields.io/badge/JavaScript-323330?style=for-the-badge&logo=javascript&logoColor=F7DF1E" />
</div>

---

</div>

<p>Watsup. is a Ruby on Rails monolith application rebooted from an archived Turing School of Software and Design project walkthrough. It was made years ago around Ruby on Rails 3 & 5.  I decided to see the changes I could make while leveraging the features of Rails 7, experiment with different CSS frameworks, and the authorization gem Devise. It is a sandbox/playground application for me to try things out and have some fun with. 
</p>

<details>
<summary>The Team</summary>

### 

- Gabe Torres [![GitHub](https://img.shields.io/badge/-GitHub-grey?style=flat&logo=github&logoColor=white)](https://github.com/Gabe-Torres) [![LinkedIn](https://img.shields.io/badge/-blue?style=flat&logo=Linkedin&logoColor=white)](https://www.linkedin.com/in/gabe-torres-74a515269/)<br><br>
</details>



--- 

## Summary 
- [Important Links](#important-links)
- [Getting Started](#getting-started)
- [Routes](#routes)
- [Test Suite](#test-suite)


## Important Links
- [Back-End production site](https://thawing-citadel-30877-e399d2943313.herokuapp.com/users/sign_in)


## Getting Started
<details>
<summary>Database Information</summary>

**Schema**

```ruby
ActiveRecord::Schema[7.0].define(version: 2024_03_29_041220) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "author_name"
    t.text "body"
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_taggings_on_article_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "articles", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "taggings", "articles"
  add_foreign_key "taggings", "tags"
end

```

**Gems**
```ruby
gem "rails", "~> 7.0.8", ">= 7.0.8.1"

gem "pg", "~> 1.1"

gem "puma", "~> 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "tailwindcss-rails"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false
gem "bootstrap"

gem "image_processing", "~> 1.2"
gem "hotwire-rails"
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "capybara"
  gem "launchy"
  gem "shoulda-matchers"
  gem "pry"
  gem "active_designer"
end

group :development do
  gem "web-console"
  gem "spring"
end

gem "devise", "~> 4.9"

gem "cssbundling-rails", "~> 1.4"

gem "jsbundling-rails", "~> 1.3"
```

**Installing**
 - Fork and clone this repo
  - Run `bundle install`
  - Run `rails db:{create,migrate,seed}`
  - Run `rails s` to start the server
  - Open your browser and navigate to `localhost:3000`
</details>

## Routes

| Action | Route |
| ----------- | ----------- |
|  | '/' |
|  | '/' |
|  | '/' |
|  | '/' |
|  | '/' |
|  | '/' |
|  | '/' |
|  | '/' |
|  | '/' |


## Test Suite
 - run `bundle exec rspec` to run the test suite

<details>
<summary>Happy Path</summary>
    
```ruby
```

</details>

<details>
<summary>Sad Path</summary>

```ruby
```

</details>

