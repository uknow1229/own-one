class ChangeBlobIdTypeOnActiveStorageAttachments < ActiveRecord::Migration[6.1]
  def change
    change_column :active_storage_attachments, :blob_id, :bigint
  end
end
