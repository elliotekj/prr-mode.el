;;; prr-mode.el --- Major mode for editing .prr files

;; Author: Elliot Jackson <elliotjackson@mailbox.org>
;; Version: 1.0-rc1
;; Keywords: vc, tools
;; URL: https://github.com/elliotekj/prr-mode.el

;;; Commentary:
;;;
;;; This package provides a major mode for prr [1] files.
;;;
;;; [1]: https://github.com/danobi/prr

;;; Code:

(defvar prr-font-lock-keywords
  (let* (
         (x-header '("^> \\(diff\\|index\\).*" . 'diff-header))
         (x-diff-hunk-header '("^> @@.*" . 'diff-hunk-header))
         (x-removed '("^> \\-.*" . 'diff-removed))
         (x-added '("^> \\+.*" . 'diff-added))
         (x-context '("^>.*" . 'diff-context)))

    (list x-header x-diff-hunk-header x-removed x-added x-context)))

(define-derived-mode prr-mode text-mode "PRR mode"
  "Major mode for editing .prr files."

  (setq font-lock-defaults '((prr-font-lock-keywords))))

(add-to-list 'auto-mode-alist '("\\.prr\\'" . prr-mode))

(provide 'prr-mode)
;;; prr-mode.el ends here
