# frozen_string_literal: true

class SetOnDeleteCascadeForPushNotificationRetries < ActiveRecord::Migration[
  6.1
]
  def change
    remove_foreign_key :push_notification_retries,
                       :push_notifications,
                       column: :push_notification_id
    add_foreign_key :push_notification_retries,
                    :push_notifications,
                    column: :push_notification_id,
                    on_delete: :cascade
  end
end
