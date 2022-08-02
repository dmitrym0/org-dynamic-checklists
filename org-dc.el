(setq org-dc--weekday-checklist "~/workspace/org-dynamics-checklists/template-morning-work-checklist.org")


; 50/50, like flipping a coin.
(defun fifty-fifty ()
  (= (random 2) 0))


; seventy thirty, bias true
(defun seventy-thirty-true-false ()
  (< 30 (random 100)))


(defun should-journal ()
  (seventy-thirty-true-false)) 

(defun should-note-important-things ()
  (seventy-thirty-true-false)) 

(defun should-show-focus ()
  (seventy-thirty-true-false)) 

 

(defun should-estimate-and-think-about-difficulties ()
  (seventy-thirty-true-false))

; from here https://masteringemacs.org/article/removing-blank-lines-buffer
(defun collapse-blank-lines (start end) (interactive "r") (replace-regexp "^\n\\{2,\\}" "\n" nil start end))

(defun dm/template ()
  (let* ((rendered-template
          (templatel-render-string (dm/get-checklist-template)
                                   `(("thing" . "THING")
                                     ("focusContents" . ,(dm/get-focus-file))
                                     ("shouldJournal" . ,(should-journal))
                                     ("shouldImportant" . ,(should-note-important-things))
                                     ("shouldEstimate" . ,(should-estimate-and-think-about-difficulties))
                                     ("shouldShowFocus" . ,(should-show-focus))
                                     ))))
    (with-temp-buffer
      (insert rendered-template)
      (collapse-blank-lines (point-min) (point-max))
      (buffer-string)
      )))



  (defun dm/get-focus-file ()
    (when (file-readable-p "~/org-roam/focus.org")
      (with-temp-buffer
        (insert-file-contents "~/org-roam/focus.org")
        (goto-char (point-min))
        (kill-line)
        (kill-line)
        (kill-line)
        (kill-line)
        (kill-line)
        (kill-line)
        (kill-line)
        (kill-line)
        (kill-line)
        (kill-line)
        (kill-line)
        (kill-line)
        (kill-line)
        (buffer-string)
        )))



(defun dm/get-weekday-checkist ()
    (when (file-readable-p org-dc--weekday-checklist)
      (with-temp-buffer
        (insert-file-contents org-dc--weekday-checklist)
        (buffer-string))))



(defun dm/get-checklist-template ()
  (dm/get-weekday-checkist)
)






