desc "Re"
task :remove_old_searches => enviroment do
	Search.delete_all ["created_at < ?", 1.month.ago]
end