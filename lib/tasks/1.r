#desc "Удаление старых отчетов"
#task :remove_old_searches => development do
#	Search.delete_all ["created_at < ?", 1.month.ago]
#end