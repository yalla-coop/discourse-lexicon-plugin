# frozen_string_literal: true

class SetOnDeleteCascadeForExpoPnSubscriptions < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :expo_pn_subscriptions, :users, column: :user_id
    remove_foreign_key :expo_pn_subscriptions,
                       :user_auth_tokens,
                       column: :user_auth_token_id
    add_foreign_key :expo_pn_subscriptions,
                    :users,
                    column: :user_id,
                    on_delete: :cascade
    add_foreign_key :expo_pn_subscriptions,
                    :user_auth_tokens,
                    column: :user_auth_token_id,
                    on_delete: :cascade
  end
end
