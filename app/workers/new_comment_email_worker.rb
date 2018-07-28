class NewCommentEmailWorker
	@queue = :emails

	def self.perform(comment_id)
		puts('sending comment_email')
		UserMailer.new_comment(comment_id).deliver_now
	end


end