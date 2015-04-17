module Spree
  class Doc < Asset
    validate :no_attachment_errors

    # attr_accessible :alt, :attachment, :position, :viewable_type, :viewable_id

    has_attached_file :attachment,
      storage: :s3,
      s3_credentials: Proc.new{|a| a.instance.s3_credentials}

    before_post_process :skip_thumbnail_creation

    ALLOWED_CONTENT_TYPES = [ "application/msword","application/vnd.ms-excel","application/pdf" ]
    ALLOWED_FILE_EXTENSIONS = [ "pdf", "doc", "docx", "xls", "xlsx" ]

    def no_attachment_errors
      unless attachment.errors.empty?
        # uncomment this to get rid of the less-than-useful interrim messages
        # errors.clear
        errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check document source file."
        false
      end
    end

    def s3_credentials
      {
        bucket: ENV["S3_BUCKET"],
        access_key_id: ENV["S3_ACCESS_KEY"],
        secret_access_key: ENV["S3_SECRET"]
      }
    end
    private
    def skip_thumbnail_creation
      return false if (attachment_content_type =~ /application\/.*pdf/ or ALLOWED_CONTENT_TYPES.include?(attachment_content_type))
    end

  end
end
