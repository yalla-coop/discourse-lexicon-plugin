# frozen_string_literal: true

class AddExtraColumnsToPushNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :push_notifications, :chat_message_id, :integer
    add_column :push_notifications, :chat_channel_id, :integer
    add_column :push_notifications, :channel_name, :string
    add_column :push_notifications, :is_direct_message_channel, :boolean
    add_column :push_notifications, :message, :string

    add_foreign_key :push_notifications,
                    :chat_messages,
                    column: :chat_message_id,
                    on_delete: :cascade
    add_foreign_key :push_notifications,
                    :chat_channels,
                    column: :chat_channel_id,
                    on_delete: :cascade
  end
end
