(setq visible-bell t)

(setq visible-bell t)

;; Automatically tangle our Emacs.org config file when we save it
(defun prma/org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "~/willow/home/emacs.org"))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'prma/org-babel-tangle-config)))
