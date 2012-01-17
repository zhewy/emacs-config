(defun mm (file label)
  (start-process "mm" 
		 nil
		 "c:/program files (x86)/Mindjet/Mindmanager 7/mindmanager"
		 file
		 (concat "/Bookmark:" label)))
