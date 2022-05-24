; 50/50, like flipping a coin flipping a coin.
(defun fifty-fifty ()
  (= (random 2) 0))

(defun should-journal ()
  (fifty-fifty)) 

(defun should-note-important-things ()
  (fifty-fifty)) 

(defun should-estimate-and-think-about-difficulties ()
  (fifty-fifty))

; from here https://masteringemacs.org/article/removing-blank-lines-buffer
(defun collapse-blank-lines (start end) (interactive "r") (replace-regexp "^\n\\{2,\\}" "\n" nil start end))

(defun dm/template ()
  (let* ((rendered-template
          (templatel-render-file "template-morning-work-checklist.org" `(("thing" . "THING")
                                                                         ("shouldJournal" . ,(should-journal))
                                                                         ("shouldImportant" . ,(should-note-important-things))
                                                                         ("shouldEstimate" . ,(should-estimate-and-think-about-difficulties))
                                                                         ))))
    (with-temp-buffer
      (insert rendered-template)
      (collapse-blank-lines (point-min) (point-max))
      (buffer-string)
      )))



