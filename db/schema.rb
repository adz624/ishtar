# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 17) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "admins", force: true do |t|
    t.string   "username",                      default: "",    null: false
    t.string   "encrypted_password",            default: "",    null: false
    t.integer  "sign_in_count",                 default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_cd",            limit: 1,  default: 0,     null: false
    t.string   "nickname",           limit: 32, default: "",    null: false
    t.boolean  "lock",                          default: false, null: false
  end

  add_index "admins", ["username"], name: "index_admins_on_username", unique: true, using: :btree

  create_table "agent_sub_accounts", force: true do |t|
    t.integer  "agent_id"
    t.string   "username",                            default: "",    null: false
    t.string   "encrypted_password",                  default: "",    null: false
    t.integer  "sign_in_count",                       default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nickname",                 limit: 32, default: "",    null: false
    t.boolean  "lock",                                default: false, null: false
    t.boolean  "machine_read_permission",             default: false, null: false
    t.boolean  "machine_write_permission",            default: false, null: false
    t.boolean  "finances_permission",                 default: false, null: false
    t.boolean  "agent_read_permission",               default: false, null: false
    t.boolean  "agent_write_permission",              default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agent_sub_accounts", ["username"], name: "index_agent_sub_accounts_on_username", unique: true, using: :btree

  create_table "agents", force: true do |t|
    t.string   "nickname",             limit: 32,                          default: "",    null: false
    t.string   "username",                                                 default: "",    null: false
    t.string   "encrypted_password",                                       default: "",    null: false
    t.integer  "sign_in_count",                                            default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.decimal  "credit_max",                      precision: 15, scale: 2, default: 0.0,   null: false
    t.decimal  "credit_dispatched",               precision: 15, scale: 2, default: 0.0,   null: false
    t.decimal  "credit_used",                     precision: 15, scale: 2, default: 0.0,   null: false
    t.decimal  "casino_ratio",                    precision: 4,  scale: 1, default: 0.0,   null: false
    t.decimal  "commission_ratio",                precision: 4,  scale: 1, default: 0.0,   null: false
    t.integer  "total_users_count",                                        default: 0,     null: false
    t.integer  "total_agents_count",                                       default: 0,     null: false
    t.integer  "agents_count",                                             default: 0,     null: false
    t.integer  "total_machines_count",                                     default: 0,     null: false
    t.integer  "parent_id"
    t.integer  "lft",                                                                      null: false
    t.integer  "rgt",                                                                      null: false
    t.integer  "agent_level_cd",       limit: 1,                           default: 0,     null: false
    t.boolean  "lock",                                                     default: false, null: false
    t.string   "maintain_code",        limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agents", ["lft", "rgt"], name: "index_agents_on_lft_and_rgt", using: :btree
  add_index "agents", ["parent_id"], name: "index_agents_on_parent_id", using: :btree
  add_index "agents", ["rgt"], name: "index_agents_on_rgt", using: :btree
  add_index "agents", ["username"], name: "index_agents_on_username", unique: true, using: :btree

  create_table "bank_accounts", force: true do |t|
    t.string   "bank_title",       default: ""
    t.string   "bank_code",        default: ""
    t.string   "title",            default: ""
    t.string   "ssn",              default: ""
    t.string   "mobile",           default: ""
    t.string   "account",          default: ""
    t.string   "security_code",    default: ""
    t.integer  "accountable_id",                null: false
    t.string   "accountable_type",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bank_accounts", ["accountable_id"], name: "index_bank_accounts_on_accountable_id", using: :btree

  create_table "bet_forms", force: true do |t|
    t.string   "type",                   limit: 30,                          default: "",  null: false
    t.integer  "home_team_id",                                               default: 0,   null: false
    t.integer  "guest_team_id",                                              default: 0,   null: false
    t.decimal  "company_win_amount",                precision: 13, scale: 4, default: 0.0, null: false
    t.integer  "shareholder_id",                                             default: 0,   null: false
    t.decimal  "shareholder_win_amount",            precision: 13, scale: 4, default: 0.0, null: false
    t.integer  "director_id",                                                default: 0,   null: false
    t.decimal  "director_win_amount",               precision: 13, scale: 4, default: 0.0, null: false
    t.integer  "agent_id",                                                   default: 0,   null: false
    t.decimal  "agent_win_amount",                  precision: 13, scale: 2, default: 0.0, null: false
    t.integer  "user_id",                                                    default: 0,   null: false
    t.integer  "user_bet_amount",                                            default: 0,   null: false
    t.decimal  "user_win_amount",                   precision: 11, scale: 2, default: 0.0, null: false
    t.text     "extra"
    t.text     "result"
    t.integer  "beted_at",                                                   default: 0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bet_forms", ["beted_at", "agent_id"], name: "index_bet_forms_on_beted_at_and_agent_id", using: :btree
  add_index "bet_forms", ["beted_at", "director_id"], name: "index_bet_forms_on_beted_at_and_director_id", using: :btree
  add_index "bet_forms", ["beted_at", "shareholder_id"], name: "index_bet_forms_on_beted_at_and_shareholder_id", using: :btree
  add_index "bet_forms", ["beted_at"], name: "index_bet_forms_on_beted_at", using: :btree

  create_table "bonuses", force: true do |t|
    t.integer  "bonus_type_cd",      limit: 2
    t.integer  "machine_id",                                                            null: false
    t.integer  "slot_bet_form_id",                                      default: 0,     null: false
    t.decimal  "bonus",                        precision: 15, scale: 2,                 null: false
    t.decimal  "bonus_dispatched",             precision: 13, scale: 4, default: 0.0,   null: false
    t.integer  "retry_count",        limit: 3,                          default: 0
    t.datetime "done_dispatched_at"
    t.boolean  "done",                                                  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bonuses", ["machine_id"], name: "index_bonuses_on_machine_id", using: :btree
  add_index "bonuses", ["slot_bet_form_id"], name: "index_bonuses_on_slot_bet_form_id", using: :btree

  create_table "game_settings", force: true do |t|
    t.decimal  "jackpot_accumulate_rate", precision: 4, scale: 3, default: 0.0, null: false
    t.integer  "jackpot_primary_max",                             default: 0,   null: false
    t.integer  "jackpot_md_range_begin",                          default: 0,   null: false
    t.integer  "jackpot_md_range_end",                            default: 0,   null: false
    t.integer  "jackpot_md_interval",                             default: 0,   null: false
    t.integer  "jackpot_sm_range_begin",                          default: 0,   null: false
    t.integer  "jackpot_sm_range_end",                            default: 0,   null: false
    t.integer  "jackpot_sm_interval",                             default: 0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "machines", force: true do |t|
    t.string   "mac_address",                                             default: "",    null: false
    t.string   "encrypted_password",                                      default: "",    null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.decimal  "credit_max",                     precision: 15, scale: 2, default: 0.0,   null: false
    t.decimal  "credit_used",                    precision: 15, scale: 2, default: 0.0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname",            limit: 32,                          default: "",    null: false
    t.boolean  "lock",                                                    default: false, null: false
    t.boolean  "boot",                                                    default: false, null: false
    t.boolean  "deleted",                                                 default: false, null: false
    t.integer  "shareholder_id",                                                          null: false
    t.integer  "director_id",                                                             null: false
    t.integer  "agent_id",                                                                null: false
  end

  add_index "machines", ["agent_id"], name: "index_machines_on_agent_id", using: :btree
  add_index "machines", ["director_id"], name: "index_machines_on_director_id", using: :btree
  add_index "machines", ["mac_address"], name: "index_machines_on_mac_address", unique: true, using: :btree
  add_index "machines", ["shareholder_id"], name: "index_machines_on_shareholder_id", using: :btree

  create_table "pages", force: true do |t|
    t.string   "page_id",    limit: 50,              null: false
    t.string   "title",                 default: "", null: false
    t.text     "content"
    t.integer  "views",                 default: 0,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["page_id"], name: "index_pages_on_page_id", unique: true, using: :btree

  create_table "redactor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "site_configs", force: true do |t|
    t.boolean  "cash_maintenance",  default: false, null: false
    t.boolean  "lobby_maintenance", default: false, null: false
    t.boolean  "agent_maintenance", default: false, null: false
    t.string   "cash_marquee",      default: "",    null: false
    t.string   "lobby_marquee",     default: "",    null: false
    t.string   "agent_marquee",     default: "",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slot_bet_forms", force: true do |t|
    t.integer  "shareholder_id",                                             default: 0,   null: false
    t.decimal  "shareholder_win_amount",            precision: 11, scale: 2, default: 0.0, null: false
    t.decimal  "shareholder_owe_parent",            precision: 11, scale: 2, default: 0.0, null: false
    t.integer  "director_id",                                                default: 0,   null: false
    t.decimal  "director_win_amount",               precision: 11, scale: 2, default: 0.0, null: false
    t.decimal  "director_owe_parent",               precision: 11, scale: 2, default: 0.0, null: false
    t.integer  "agent_id",                                                   default: 0,   null: false
    t.decimal  "agent_win_amount",                  precision: 11, scale: 2, default: 0.0, null: false
    t.decimal  "agent_owe_parent",                  precision: 11, scale: 2, default: 0.0, null: false
    t.integer  "machine_id",                                                               null: false
    t.integer  "slot_machine_id",                                                          null: false
    t.decimal  "bet_credit",                        precision: 11, scale: 2,               null: false
    t.integer  "bet_line",               limit: 3,                                         null: false
    t.decimal  "bet_total_credit",                  precision: 11, scale: 2,               null: false
    t.integer  "free_spin_count",                                            default: 0,   null: false
    t.integer  "free_spin_used",                                             default: 0,   null: false
    t.integer  "free_spin_multiple",                                         default: 0,   null: false
    t.string   "free_spin_token",        limit: 50,                          default: "",  null: false
    t.integer  "free_spin_base_id"
    t.string   "grids",                                                      default: ""
    t.string   "win_lines",                                                  default: ""
    t.decimal  "reward_amount",                     precision: 11, scale: 2, default: 0.0, null: false
    t.decimal  "machine_credit_diff",               precision: 11, scale: 2, default: 0.0, null: false
    t.decimal  "over_jackpot",                      precision: 15, scale: 5, default: 0.0, null: false
    t.decimal  "jackpot",                           precision: 12, scale: 2, default: 0.0, null: false
    t.integer  "jackpot_type_cd",        limit: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slot_bet_forms", ["created_at", "agent_id"], name: "index_slot_bet_forms_on_created_at_and_agent_id", using: :btree
  add_index "slot_bet_forms", ["created_at", "director_id"], name: "index_slot_bet_forms_on_created_at_and_director_id", using: :btree
  add_index "slot_bet_forms", ["created_at", "shareholder_id"], name: "index_slot_bet_forms_on_created_at_and_shareholder_id", using: :btree
  add_index "slot_bet_forms", ["created_at"], name: "index_slot_bet_forms_on_created_at", using: :btree
  add_index "slot_bet_forms", ["free_spin_base_id"], name: "index_slot_bet_forms_on_free_spin_base_id", using: :btree
  add_index "slot_bet_forms", ["machine_id"], name: "index_slot_bet_forms_on_machine_id", using: :btree

  create_table "slot_machine_histories", force: true do |t|
    t.integer  "machine_id"
    t.integer  "slot_machine_id"
    t.integer  "total_bet_count",                            default: 0,   null: false
    t.decimal  "total_win_amount",  precision: 15, scale: 2, default: 0.0, null: false
    t.decimal  "total_lose_amount", precision: 15, scale: 2, default: 0.0, null: false
    t.decimal  "dispatching_xs",    precision: 15, scale: 5, default: 0.0, null: false
    t.decimal  "preparing_xs",      precision: 15, scale: 5, default: 0.0, null: false
    t.decimal  "dispatching_sm",    precision: 15, scale: 5, default: 0.0, null: false
    t.decimal  "preparing_sm",      precision: 15, scale: 5, default: 0.0, null: false
    t.decimal  "dispatching_md",    precision: 15, scale: 5, default: 0.0, null: false
    t.decimal  "preparing_md",      precision: 15, scale: 5, default: 0.0, null: false
    t.decimal  "dispatching_lg",    precision: 15, scale: 5, default: 0.0, null: false
    t.decimal  "preparing_lg",      precision: 15, scale: 5, default: 0.0, null: false
    t.decimal  "dispatching_xl",    precision: 15, scale: 5, default: 0.0, null: false
    t.decimal  "preparing_xl",      precision: 15, scale: 5, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slot_machine_histories", ["machine_id", "slot_machine_id"], name: "index_slot_machine_histories_on_machine_id_and_slot_machine_id", unique: true, using: :btree

  create_table "slot_machines", force: true do |t|
    t.decimal  "jackpot",                          precision: 15, scale: 5, default: 0.0, null: false
    t.decimal  "lose_rate_xs",                     precision: 4,  scale: 3, default: 0.0, null: false
    t.integer  "lose_trigger_amount_xs",                                    default: 0,   null: false
    t.decimal  "max_mutiple_xs",                   precision: 5,  scale: 1, default: 0.0
    t.decimal  "lose_rate_sm",                     precision: 4,  scale: 3, default: 0.0, null: false
    t.integer  "lose_trigger_amount_sm",                                    default: 0,   null: false
    t.decimal  "max_mutiple_sm",                   precision: 5,  scale: 1, default: 0.0
    t.decimal  "lose_rate_md",                     precision: 4,  scale: 3, default: 0.0, null: false
    t.integer  "lose_trigger_amount_md",                                    default: 0,   null: false
    t.decimal  "max_mutiple_md",                   precision: 5,  scale: 1, default: 0.0
    t.decimal  "lose_rate_lg",                     precision: 4,  scale: 3, default: 0.0, null: false
    t.integer  "lose_trigger_amount_lg",                                    default: 0,   null: false
    t.decimal  "max_mutiple_lg",                   precision: 5,  scale: 1, default: 0.0
    t.decimal  "lose_rate_xl",                     precision: 4,  scale: 3, default: 0.0, null: false
    t.integer  "lose_trigger_amount_xl",                                    default: 0,   null: false
    t.decimal  "max_mutiple_xl",                   precision: 5,  scale: 1, default: 0.0
    t.integer  "win_speed",              limit: 1,                          default: 0
    t.string   "game_model_name",                                           default: "",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                                                default: "",    null: false
    t.string   "encrypted_password",                                      default: "",    null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "shareholder_id",                                          default: 0,     null: false
    t.integer  "director_id",                                             default: 0,     null: false
    t.integer  "agent_id",                                                default: 0,     null: false
    t.decimal  "credit",                         precision: 15, scale: 2, default: 0.0,   null: false
    t.decimal  "credit_used",                    precision: 15, scale: 2, default: 0.0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname",            limit: 32,                          default: "",    null: false
    t.boolean  "lock",                                                    default: false, null: false
  end

  add_index "users", ["agent_id"], name: "index_users_on_agent_id", using: :btree
  add_index "users", ["director_id"], name: "index_users_on_director_id", using: :btree
  add_index "users", ["shareholder_id"], name: "index_users_on_shareholder_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "withdraws", force: true do |t|
    t.decimal  "credit",            precision: 15, scale: 2, default: 0.0, null: false
    t.integer  "status",                                     default: 0,   null: false
    t.integer  "user_id",                                    default: 0,   null: false
    t.text     "bank_account_info"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "withdraws", ["user_id"], name: "index_withdraws_on_user_id", using: :btree

end
