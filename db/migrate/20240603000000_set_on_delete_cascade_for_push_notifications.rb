# frozen_string_literal: true

class SetOnDeleteCascadeForPushNotifications < ActiveRecord::Migration[6.1]
  # add on delete cascade for user_id in push_notifications
  def change
    remove_foreign_key :push_notifications, :users, column: :user_id
    add_foreign_key :push_notifications,
                    :users,
                    column: :user_id,
                    on_delete: :cascade
  end
end
